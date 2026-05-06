import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/light_theme.dart';
import '../../../data/models/quiz_models.dart';
import '../../quiz/data/quiz_repository.dart';
import '../application/results_providers.dart';
import 'widgets/results_constants.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  static const _dimensaoNomes = {
    ...dimensaoNomes,
    ...gardnerNomes,
    ...valoresNomes,
  };

  String _formatDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';

  String topDimension(Map<String, double> resultados) {
    if (resultados.isEmpty) return '—';
    final sorted = resultados.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return _dimensaoNomes[sorted.first.key] ?? sorted.first.key;
  }

  String _tipoLabel(QuizType tipo) => switch (tipo) {
    QuizType.riasec => '🎯 RIASEC',
    QuizType.gardner => '🧠 Gardner',
    QuizType.valores => '⚖️ Valores',
  };

  Color _tipoColor(QuizType tipo) => switch (tipo) {
    QuizType.riasec => const Color(0xff6155F5),
    QuizType.gardner => const Color(0xff9C27B0),
    QuizType.valores => const Color(0xffFF9800),
  };

  Future<void> _confirmDeleteAll(
    BuildContext context,
    WidgetRef ref,
    String userId,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Apagar tudo'),
        content: const Text(
          'Tens a certeza que queres apagar todo o histórico?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Apagar tudo'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await ref.read(quizRepositoryProvider).deleteAllSessions(userId);
      ref.invalidate(quizHistoryProvider);
      ref.invalidate(latestQuizSessionProvider);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(quizHistoryProvider);
    final theme = Theme.of(context);

    return historyAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erro: $e'))),
      data: (sessions) {
        final completed = sessions
            .where((s) => s.completadoEm != null)
            .toList();

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
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 8,
                  right: 16,
                  bottom: 20,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(AppRoutes.tests);
                        }
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Histórico de testes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    if (completed.isNotEmpty)
                      IconButton(
                        icon: Icon(
                          Icons.delete_sweep_rounded,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                        tooltip: 'Apagar tudo',
                        onPressed: () => _confirmDeleteAll(
                          context,
                          ref,
                          completed.first.userId,
                        ),
                      ),
                  ],
                ),
              ),

              // Instrução de swipe
              if (completed.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.swipe_left_rounded,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Desliza para a esquerda para apagar',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

              // Lista
              Expanded(
                child: completed.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('📋', style: TextStyle(fontSize: 48)),
                            const SizedBox(height: 12),
                            Text(
                              'Sem histórico',
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Os testes que fizeres aparecerão aqui',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: completed.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final session = completed[index];
                          final isLatest = index == 0;
                          final cor = _tipoColor(session.tipo);
                          final sorted = session.resultados.entries.toList()
                            ..sort((a, b) => b.value.compareTo(a.value));

                          return Dismissible(
                            key: Key(session.id),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (_) async {
                              return await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Apagar teste'),
                                  content: const Text('Apagar este resultado?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(ctx).pop(false),
                                      child: const Text('Cancelar'),
                                    ),
                                    FilledButton(
                                      onPressed: () =>
                                          Navigator.of(ctx).pop(true),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text('Apagar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onDismissed: (_) async {
                              await ref
                                  .read(quizRepositoryProvider)
                                  .deleteSession(session.id);
                              ref.invalidate(quizHistoryProvider);
                              ref.invalidate(latestQuizSessionProvider);
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_rounded,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Apagar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isLatest
                                      ? cor.withValues(alpha: 0.4)
                                      : theme.colorScheme.outlineVariant,
                                  width: isLatest ? 2 : 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.04),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Cabeçalho do card
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: cor.withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: cor.withValues(alpha: 0.3),
                                            ),
                                          ),
                                          child: Text(
                                            _tipoLabel(session.tipo),
                                            style: TextStyle(
                                              color: cor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        if (isLatest)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 3,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff8AE04A),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Text(
                                              'Mais recente',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        const SizedBox(width: 8),
                                        Text(
                                          _formatDate(session.completadoEm!),
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 14),

                                    // Top 3 dimensões
                                    ...sorted.take(3).map((entry) {
                                      final nome =
                                          _dimensaoNomes[entry.key] ??
                                          entry.key;
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 8,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  nome,
                                                  style: theme
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  '${entry.value.toStringAsFixed(0)}%',
                                                  style: TextStyle(
                                                    color: cor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              child: LinearProgressIndicator(
                                                value: entry.value / 100,
                                                backgroundColor: cor.withValues(
                                                  alpha: 0.12,
                                                ),
                                                valueColor:
                                                    AlwaysStoppedAnimation(cor),
                                                minHeight: 6,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),

                                    // Botão refazer
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () => context.go(
                                          '${AppRoutes.quiz}?tipo=${session.tipo.name}',
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: cor,
                                          side: BorderSide(
                                            color: cor.withValues(alpha: 0.4),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Refazer',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
