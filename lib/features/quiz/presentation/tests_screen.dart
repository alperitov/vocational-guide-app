import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/light_theme.dart';
import '../../../data/models/quiz_models.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../features/results/application/results_providers.dart';
import '../application/quiz_providers.dart';

class TestsScreen extends ConsumerWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final user = ref.watch(authRepositoryProvider).currentUser;
    final riasecAsync = ref.watch(latestSessionByTypeProvider(QuizType.riasec));
    final gardnerAsync = ref.watch(
      latestSessionByTypeProvider(QuizType.gardner),
    );
    final valoresAsync = ref.watch(
      latestSessionByTypeProvider(QuizType.valores),
    );

    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho
          Container(
            decoration: const BoxDecoration(
              gradient: lightGradientHeader,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              left: 20,
              right: 20,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Testes Vocacionais',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Olá, ${user?.displayName?.split(' ').first ?? 'Estudante'}! Faz os 3 testes para um perfil completo.',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.brain(),
                      color: Colors.white54,
                      size: 32,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Progresso geral
                _buildOverallProgress(
                  context,
                  riasecAsync,
                  gardnerAsync,
                  valoresAsync,
                ),
              ],
            ),
          ),

          // Lista de testes
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _TestCard(
                    emoji: '🎯',
                    titulo: 'Teste RIASEC',
                    subtitulo: 'Interesses e personalidade vocacional',
                    descricao:
                        'Descobre que tipo de actividades e ambientes de trabalho combinam mais contigo. Baseado no modelo de Holland com 6 dimensões.',
                    duracao: '~8 minutos',
                    perguntas: '30 perguntas',
                    cor: const Color(0xff6155F5),
                    tipo: QuizType.riasec,
                    sessionAsync: riasecAsync,
                    onStart: () => _startQuiz(context, ref, QuizType.riasec),
                  ),
                  const SizedBox(height: 16),
                  _TestCard(
                    emoji: '🧠',
                    titulo: 'Inteligências Múltiplas',
                    subtitulo: 'As tuas aptidões naturais (Gardner)',
                    descricao:
                        'Identifica as tuas inteligências dominantes segundo a teoria de Howard Gardner. 8 tipos de inteligência que definem como aprendes e te destacas.',
                    duracao: '~6 minutos',
                    perguntas: '24 perguntas',
                    cor: const Color(0xff9C27B0),
                    tipo: QuizType.gardner,
                    sessionAsync: gardnerAsync,
                    onStart: () => _startQuiz(context, ref, QuizType.gardner),
                  ),
                  const SizedBox(height: 16),
                  _TestCard(
                    emoji: '⚖️',
                    titulo: 'Valores de Trabalho',
                    subtitulo: 'O que é mais importante para ti',
                    descricao:
                        'Descobre o que mais valorizas numa carreira — autonomia, prestígio, segurança, impacto social, criatividade ou remuneração.',
                    duracao: '~5 minutos',
                    perguntas: '18 perguntas',
                    cor: const Color(0xffFF9800),
                    tipo: QuizType.valores,
                    sessionAsync: valoresAsync,
                    onStart: () => _startQuiz(context, ref, QuizType.valores),
                  ),
                  const SizedBox(height: 24),

                  // Botão ver resultados combinados
                  _buildCombinedResultsButton(
                    context,
                    riasecAsync,
                    gardnerAsync,
                    valoresAsync,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverallProgress(
    BuildContext context,
    AsyncValue riasecAsync,
    AsyncValue gardnerAsync,
    AsyncValue valoresAsync,
  ) {
    final completed = [
      riasecAsync,
      gardnerAsync,
      valoresAsync,
    ].where((a) => a.valueOrNull != null).length;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$completed de 3 testes completos',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              '${(completed / 3 * 100).toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: completed / 3,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff8AE04A)),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildCombinedResultsButton(
    BuildContext context,
    AsyncValue riasecAsync,
    AsyncValue gardnerAsync,
    AsyncValue valoresAsync,
  ) {
    final allDone =
        riasecAsync.valueOrNull != null &&
        gardnerAsync.valueOrNull != null &&
        valoresAsync.valueOrNull != null;
    final theme = Theme.of(context);

    if (!allDone) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            const Text('🔒', style: TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Perfil Completo',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Completa os 3 testes para ver o teu perfil vocacional completo com sugestões precisas.',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton.icon(
        onPressed: () => context.go(AppRoutes.results),
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xff8AE04A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        icon: PhosphorIcon(PhosphorIcons.chartBar()),
        label: const Text(
          'Ver Perfil Completo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> _startQuiz(
    BuildContext context,
    WidgetRef ref,
    QuizType tipo,
  ) async {
    await ref.read(quizNotifierProvider.notifier).iniciarQuiz(tipo: tipo);
    if (context.mounted) {
      context.go('${AppRoutes.quiz}?tipo=${tipo.name}');
    }
  }
}

class _TestCard extends ConsumerWidget {
  const _TestCard({
    required this.emoji,
    required this.titulo,
    required this.subtitulo,
    required this.descricao,
    required this.duracao,
    required this.perguntas,
    required this.cor,
    required this.tipo,
    required this.sessionAsync,
    required this.onStart,
  });

  final String emoji;
  final String titulo;
  final String subtitulo;
  final String descricao;
  final String duracao;
  final String perguntas;
  final Color cor;
  final QuizType tipo;
  final AsyncValue sessionAsync;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final session = sessionAsync.valueOrNull;
    final isCompleted = session != null;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCompleted
              ? cor.withValues(alpha: 0.4)
              : theme.colorScheme.outlineVariant,
          width: isCompleted ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isCompleted
                ? cor.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: cor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(emoji, style: const TextStyle(fontSize: 26)),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        subtitulo,
                        style: TextStyle(
                          color: cor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isCompleted)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xff4CAF50),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              descricao,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                _InfoChip(
                  icon: PhosphorIcons.clock(),
                  label: duracao,
                  cor: cor,
                ),
                const SizedBox(width: 8),
                _InfoChip(
                  icon: PhosphorIcons.listBullets(),
                  label: perguntas,
                  cor: cor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: isCompleted
                  ? OutlinedButton.icon(
                      onPressed: onStart,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cor,
                        side: BorderSide(color: cor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      icon: PhosphorIcon(
                        PhosphorIcons.arrowsClockwise(),
                        size: 18,
                      ),
                      label: const Text(
                        'Refazer teste',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  : FilledButton.icon(
                      onPressed: onStart,
                      style: FilledButton.styleFrom(
                        backgroundColor: cor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      icon: PhosphorIcon(PhosphorIcons.play(), size: 18),
                      label: const Text(
                        'Iniciar teste',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label, required this.cor});
  final IconData icon;
  final String label;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, size: 13, color: cor),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: cor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
