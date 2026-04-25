import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/router/app_router.dart';
import '../../../data/local/courses_data.dart';
import '../application/results_providers.dart';
import 'widgets/chart_tab_section.dart';
import 'widgets/courses_tab_section.dart';
import 'widgets/empty_results.dart';
import 'widgets/results_header.dart';
import 'widgets/top_dimensions.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  List<String> _sugerirCursos(Map<String, double> resultados) {
    final sorted = resultados.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topDims = sorted.take(3).map((e) => e.key).toList();
    final sugeridos = kCursos
        .where((c) => c.dimensoesRiasec.any((d) => topDims.contains(d)))
        .toList();
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

    return sessionAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erro: $e'))),
      data: (session) {
        if (session == null || session.resultados.isEmpty) {
          return const EmptyResults();
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
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ResultsHeader(topDim: topDim)),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    TopDimensions(resultados: resultados),
                    const SizedBox(height: 28),
                    ChartTabSection(resultados: resultados),
                    const SizedBox(height: 28),
                    CoursesTabSection(cursos: cursosSugeridos),
                    const SizedBox(height: 28),
                    // SizedBox(
                    //   height: 52,
                    //   child: FilledButton.icon(
                    //     onPressed: () => context.go(AppRoutes.quiz),
                    //     style: FilledButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(14),
                    //       ),
                    //     ),
                    //     icon: PhosphorIcon(PhosphorIcons.arrowsClockwise()),
                    //     label: const Text(
                    //       'Novo Teste',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 32),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
