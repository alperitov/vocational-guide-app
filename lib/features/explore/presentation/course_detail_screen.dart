import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/theme/light_theme.dart';
import '../../../data/local/courses_data.dart';
import '../../../data/local/professions_data.dart';
import '../../../data/models/favorite.dart';
import '../application/favorites_providers.dart';
import '../../../features/results/presentation/widgets/results_constants.dart';
import '../../../data/models/profession.dart';

class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = kCursos.where((c) => c.id == courseId).firstOrNull;

    if (course == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Curso')),
        body: const Center(child: Text('Curso não encontrado')),
      );
    }

    final theme = Theme.of(context);
    final isFavAsync = ref.watch(isFavoriteProvider(course.id));
    final isFav = isFavAsync.valueOrNull ?? false;
    final profissoesRelacionadas = kProfissoes
        .where((p) => p.cursosRelacionados.contains(course.id))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: lightGradientHeader,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 8,
                right: 16,
                bottom: 28,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          isFav
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFav ? Colors.red : Colors.white,
                        ),
                        onPressed: () => ref
                            .read(favoritesNotifierProvider.notifier)
                            .toggle(
                              itemId: course.id,
                              tipo: FavoriteType.curso,
                              nome: course.nome,
                              emoji: '🎓',
                              area: course.area,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () => SharePlus.instance.share(
                          ShareParams(
                            text:
                                '🎓 ${course.nome}\n\n${course.descricao}\n\nDescobre mais na app Guivo!',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('🎓', style: TextStyle(fontSize: 56)),
                  const SizedBox(height: 12),
                  Text(
                    course.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.area,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Duração e requisitos
                if (course.duracao != null || course.requisitosMinimos != null)
                  Row(
                    children: [
                      if (course.duracao != null)
                        Expanded(
                          child: _InfoCard(
                            icon: PhosphorIcons.clock(),
                            label: 'Duração',
                            value: course.duracao!,
                            color: const Color(0xff6155F5),
                          ),
                        ),
                      if (course.duracao != null &&
                          course.requisitosMinimos != null)
                        const SizedBox(width: 12),
                      if (course.requisitosMinimos != null)
                        Expanded(
                          child: _InfoCard(
                            icon: PhosphorIcons.graduationCap(),
                            label: 'Requisitos',
                            value: course.requisitosMinimos!,
                            color: const Color(0xffFF9800),
                          ),
                        ),
                    ],
                  ),
                const SizedBox(height: 20),

                // Descrição
                _Section(
                  title: 'Sobre o curso',
                  child: Text(
                    course.descricao,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Perfil RIASEC
                if (course.dimensoesRiasec.isNotEmpty)
                  _Section(
                    title: '🎯 Perfil vocacional ideal',
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: course.dimensoesRiasec.map((d) {
                        final cor =
                            dimensaoCores[d] ?? theme.colorScheme.primary;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: cor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: cor.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            '${dimensaoEmojis[d] ?? ''} ${dimensaoNomes[d] ?? d}',
                            style: TextStyle(
                              color: cor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 20),

                // Profissões relacionadas
                if (profissoesRelacionadas.isNotEmpty)
                  _Section(
                    title: '💼 Profissões que podes seguir',
                    child: Column(
                      children: profissoesRelacionadas.map((prof) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                prof.emoji,
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      prof.nome,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      prof.salarioMedio ?? '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: const Color(0xff4CAF50),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _mercadoColor(
                                    prof.mercadoTrabalho,
                                  ).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  _mercadoEmoji(prof.mercadoTrabalho),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 20),

                // Instituições
                _Section(
                  title: '🏛️ Onde estudar em Moçambique',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: course.instituicoes
                        .map(
                          (inst) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              inst,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 32),

                // Botão favorito
                SizedBox(
                  height: 52,
                  child: FilledButton.icon(
                    onPressed: () => ref
                        .read(favoritesNotifierProvider.notifier)
                        .toggle(
                          itemId: course.id,
                          tipo: FavoriteType.curso,
                          nome: course.nome,
                          emoji: '🎓',
                          area: course.area,
                        ),
                    style: FilledButton.styleFrom(
                      backgroundColor: isFav
                          ? Colors.red
                          : theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: Icon(
                      isFav
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                    ),
                    label: Text(
                      isFav
                          ? 'Remover dos favoritos'
                          : 'Adicionar aos favoritos',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Color _mercadoColor(MercadoTrabalho m) => switch (m) {
    MercadoTrabalho.excelente => const Color(0xff4CAF50),
    MercadoTrabalho.bom => const Color(0xff8BC34A),
    MercadoTrabalho.moderado => const Color(0xffFFC107),
    MercadoTrabalho.limitado => const Color(0xffF44336),
  };

  String _mercadoEmoji(MercadoTrabalho m) => switch (m) {
    MercadoTrabalho.excelente => '🚀',
    MercadoTrabalho.bom => '✅',
    MercadoTrabalho.moderado => '⚠️',
    MercadoTrabalho.limitado => '⛔',
  };
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(icon, color: color, size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
