import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/quiz_models.dart';
import '../../quiz/data/quiz_repository.dart';
import '../application/results_providers.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  static const _dimensaoNomes = {
    'realista': 'Realista',
    'investigativo': 'Investigativo',
    'artistico': 'Artístico',
    'social': 'Social',
    'empreendedor': 'Empreendedor',
    'convencional': 'Convencional',
  };

  String _formatDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';

  String _topDimension(Map<String, double> resultados) {
    if (resultados.isEmpty) return '—';
    final sorted = resultados.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return _dimensaoNomes[sorted.first.key] ?? sorted.first.key;
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String sessionId,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Apagar teste'),
        content: const Text('Tens a certeza que queres apagar este resultado?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await ref.read(quizRepositoryProvider).deleteSession(sessionId);
      ref.invalidate(quizHistoryProvider);
      ref.invalidate(latestQuizSessionProvider);
    }
  }

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
          'Tens a certeza que queres apagar todo o histórico? Esta acção não pode ser desfeita.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
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
          appBar: AppBar(
            title: const Text('Histórico de testes'),
            actions: [
              if (completed.isNotEmpty)
                IconButton(
                  icon: Icon(
                    Icons.delete_sweep_rounded,
                    color: theme.colorScheme.error,
                  ),
                  tooltip: 'Apagar tudo',
                  onPressed: () =>
                      _confirmDeleteAll(context, ref, completed.first.userId),
                ),
            ],
          ),
          body: completed.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history_rounded,
                        size: 64,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Ainda não fizeste nenhum teste',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () => context.go(AppRoutes.quiz),
                        child: const Text('Fazer o primeiro teste'),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(24),
                  itemCount: completed.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final session = completed[index];
                    final isLatest = index == 0;
                    final topDim = _topDimension(session.resultados);
                    final sorted = session.resultados.entries.toList()
                      ..sort((a, b) => b.value.compareTo(a.value));

                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isLatest
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outlineVariant,
                          width: isLatest ? 2 : 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Cabeçalho
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (isLatest)
                                      Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 4,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme
                                              .colorScheme
                                              .primaryContainer,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          'Mais recente',
                                          style: theme.textTheme.labelSmall
                                              ?.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                              ),
                                        ),
                                      ),
                                    Text(
                                      _formatDate(session.completadoEm!),
                                      style: theme.textTheme.titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                Chip(
                                  label: Text(topDim),
                                  backgroundColor:
                                      theme.colorScheme.secondaryContainer,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Top 3 dimensões
                            ...sorted.take(3).map((entry) {
                              final nome =
                                  _dimensaoNomes[entry.key] ?? entry.key;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          nome,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        Text(
                                          '${entry.value.toStringAsFixed(0)}%',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    LinearProgressIndicator(
                                      value: entry.value / 100,
                                      borderRadius: BorderRadius.circular(8),
                                      minHeight: 6,
                                    ),
                                  ],
                                ),
                              );
                            }),
                            const SizedBox(height: 8),

                            // Botões
                            Row(
                              children: [
                                if (isLatest)
                                  Expanded(
                                    child: FilledButton.tonal(
                                      onPressed: () =>
                                          context.go(AppRoutes.results),
                                      child: const Text('Ver detalhes'),
                                    ),
                                  ),
                                if (isLatest) const SizedBox(width: 8),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () => context.go(AppRoutes.quiz),
                                    child: const Text('Refazer'),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete_outline_rounded,
                                    color: theme.colorScheme.error,
                                  ),
                                  tooltip: 'Apagar',
                                  onPressed: () =>
                                      _confirmDelete(context, ref, session.id),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
