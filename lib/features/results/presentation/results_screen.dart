import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../data/local/courses_data.dart';
import '../../../data/models/quiz_models.dart';
import '../application/results_providers.dart';
import 'widgets/riasec_bar_chart.dart';
import 'widgets/riasec_radar_chart.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  static const _dimensaoNomes = {
    'realista': 'Realista',
    'investigativo': 'Investigativo',
    'artistico': 'Artístico',
    'social': 'Social',
    'empreendedor': 'Empreendedor',
    'convencional': 'Convencional',
  };

  static const _dimensaoDescricoes = {
    'realista':
        'Preferes trabalho prático, ferramentas e actividades ao ar livre.',
    'investigativo':
        'Gostas de analisar, investigar e resolver problemas complexos.',
    'artistico': 'Valorizas a criatividade, expressão e liberdade no trabalho.',
    'social': 'Tens prazer em ajudar, ensinar e trabalhar com pessoas.',
    'empreendedor': 'Tens aptidão para liderar, persuadir e gerir negócios.',
    'convencional':
        'Preferes trabalho organizado, dados e procedimentos claros.',
  };

  List<String> _sugerirCursos(Map<String, double> resultados) {
    // Ordena dimensões por score
    final sorted = resultados.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topDims = sorted.take(3).map((e) => e.key).toList();

    // Filtra cursos que têm pelo menos uma das top dimensões
    final sugeridos = kCursos
        .where((c) => c.dimensoesRiasec.any((d) => topDims.contains(d)))
        .toList();

    // Ordena por relevância (quantas dimensões coincidem)
    sugeridos.sort((a, b) {
      final scoreA = a.dimensoesRiasec.where((d) => topDims.contains(d)).length;
      final scoreB = b.dimensoesRiasec.where((d) => topDims.contains(d)).length;
      return scoreB.compareTo(scoreA);
    });

    return sugeridos.take(6).map((c) => c.id).toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(latestQuizSessionProvider);
    final theme = Theme.of(context);

    ref.invalidate(latestQuizSessionProvider);

    return sessionAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erro: $e'))),
      data: (session) {
        if (session == null || session.resultados.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: const Text('Resultados')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.quiz_outlined,
                    size: 64,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ainda não fizeste o teste',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => context.go(AppRoutes.quiz),
                    child: const Text('Fazer teste agora'),
                  ),
                ],
              ),
            ),
          );
        }

        final resultados = session.resultados;
        final sorted = resultados.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final topDim = sorted.first.key;
        final cursoIds = _sugerirCursos(resultados);
        final cursosSugeridos = kCursos
            .where((c) => cursoIds.contains(c.id))
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Os teus resultados'),
            actions: [
              IconButton(
                icon: const Icon(Icons.history_rounded),
                tooltip: 'Histórico',
                onPressed: () => context.go(AppRoutes.history),
              ),
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                tooltip: 'Refazer teste',
                onPressed: () => context.go(AppRoutes.quiz),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Perfil dominante
                Card(
                  elevation: 0,
                  color: theme.colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'O teu perfil dominante',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _dimensaoNomes[topDim] ?? topDim,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _dimensaoDescricoes[topDim] ?? '',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Gráfico de barras
                Text(
                  'Pontuação por dimensão',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                RiasecBarChart(resultados: resultados),
                const SizedBox(height: 32),

                // Gráfico radar
                Text(
                  'Perfil RIASEC',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                RiasecRadarChart(resultados: resultados),
                const SizedBox(height: 32),

                // Top 3 dimensões
                Text(
                  'As tuas 3 dimensões principais',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...sorted.take(3).map((entry) {
                  final percent = entry.value.toStringAsFixed(0);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _dimensaoNomes[entry.key] ?? entry.key,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '$percent%',
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: entry.value / 100,
                          borderRadius: BorderRadius.circular(8),
                          minHeight: 8,
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 32),

                // Cursos sugeridos
                Text(
                  'Cursos recomendados',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Baseados no teu perfil RIASEC',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                ...cursosSugeridos.map(
                  (curso) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: theme.colorScheme.outlineVariant,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    curso.nome,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Chip(
                                  label: Text(
                                    curso.area,
                                    style: theme.textTheme.labelSmall,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              curso.descricao,
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 6,
                              children: curso.instituicoes
                                  .map(
                                    (inst) => Chip(
                                      label: Text(
                                        inst,
                                        style: theme.textTheme.labelSmall,
                                      ),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor:
                                          theme.colorScheme.secondaryContainer,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
