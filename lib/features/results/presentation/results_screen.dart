import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guivo/features/results/presentation/services/gerar_areas.dart';
import 'package:guivo/features/results/presentation/widgets/courses_prompt.dart';
import 'package:guivo/features/results/presentation/widgets/incomplete_notice.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/router/app_router.dart';
import '../../../data/local/courses_data.dart';
import '../application/results_providers.dart';
import 'widgets/courses_bottom_sheet.dart';
import 'widgets/courses_tab_section.dart';
import 'widgets/empty_results.dart';
import 'widgets/recommended_areas.dart';
import 'widgets/results_constants.dart';
import 'widgets/test_results_section.dart';
import 'widgets/tests_progress_badge.dart';
import 'widgets/vocational_narrative.dart';
import '../presentation/services/sugerir_cursos.dart';
import '../presentation/services/gerar_narrativa.dart';

class ResultsScreen extends ConsumerStatefulWidget {
  const ResultsScreen({super.key});

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen> {
  bool _showCourses = false;

  // Mapa: área recomendada → áreas dos cursos
  static const _areaParaCursos = {
    'Gestão e Negócios': [
      'Economia e Gestão',
      'Comunicação e Negócios',
      'Serviços',
    ],
    'Contabilidade e Finanças': ['Economia e Gestão'],
    'Administração e Gestão Pública': ['Economia e Gestão', 'Serviços'],
    'Saúde e Bem-estar': ['Saúde', 'Ciências da Saúde'],
    'Educação e Serviço Social': ['Educação', 'Ciências Sociais'],
    'Direito e Relações Internacionais': ['Direito', 'Ciências Sociais'],
    'Tecnologia e Informática': ['Tecnologia', 'Engenharia'],
    'Ciências e Investigação': ['Ciências Naturais', 'Tecnologia'],
    'Engenharia e Construção': ['Engenharia'],
    'Agricultura e Meio Ambiente': ['Agricultura', 'Ciências Naturais'],
    'Artes, Design e Comunicação': ['Artes', 'Comunicação e Negócios'],
    'Arquitectura e Urbanismo': ['Engenharia', 'Artes'],
  };

  void _mostrarCursosDaArea(BuildContext context, String area) {
    final areasCorrespondentes = _areaParaCursos[area] ?? [];
    final cursosDaArea = areasCorrespondentes.isEmpty
        ? kCursos
        : kCursos.where((c) => areasCorrespondentes.contains(c.area)).toList();

    if (cursosDaArea.isEmpty) {
      setState(() => _showCourses = true);
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => CoursesBottomSheet(area: area, cursos: cursosDaArea),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(combinedProfileProvider);

    return profileAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erro: $e'))),
      data: (profile) {
        if (profile.riasec.isEmpty) return const EmptyResults();

        final narrativa = gerarNarrativa(profile);
        final areas = gerarAreas(profile);
        final cursoIds = sugerirCursos(profile);
        final cursosSugeridos = kCursos
            .where((c) => cursoIds.contains(c.id))
            .toList();
        final topDim = profile.topRiasec;
        final topColor = dimensaoCores[topDim] ?? const Color(0xff6155F5);

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              // Cabeçalho
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [topColor, topColor.withValues(alpha: 0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 24,
                    right: 24,
                    bottom: 28,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'O teu Perfil Vocacional',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.refresh_rounded,
                              color: Colors.white70,
                            ),
                            onPressed: () => context.go(AppRoutes.tests),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            dimensaoEmojis[topDim] ?? '🎯',
                            style: const TextStyle(fontSize: 32),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dimensaoNomes[topDim] ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              if (profile.gardner.isNotEmpty)
                                Text(
                                  '${gardnerEmojis[profile.topGardner] ?? ''} ${gardnerNomes[profile.topGardner] ?? ''}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TestsProgressBadge(profile: profile),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Narrativa
                    if (narrativa.isNotEmpty) ...[
                      VocationalNarrative(
                        narrativa: narrativa,
                        topColor: topColor,
                      ),
                      const SizedBox(height: 24),
                    ] else ...[
                      IncompleteNotice(
                        profile: profile,
                        onTap: () => context.go(AppRoutes.tests),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Áreas recomendadas
                    RecommendedAreas(
                      areas: areas,
                      onAreaTap: (area) => _mostrarCursosDaArea(context, area),
                    ),
                    const SizedBox(height: 28),

                    // Gardner
                    if (profile.gardner.isNotEmpty) ...[
                      const Divider(),
                      const SizedBox(height: 16),
                      TestResultsSection(
                        titulo: 'Inteligências Múltiplas',
                        emoji: '🧠',
                        resultados: profile.gardner,
                        nomes: gardnerNomes,
                        emojis: gardnerEmojis,
                        cores: gardnerCores,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Valores
                    if (profile.valores.isNotEmpty) ...[
                      const Divider(),
                      const SizedBox(height: 16),
                      TestResultsSection(
                        titulo: 'Valores de Trabalho',
                        emoji: '⚖️',
                        resultados: profile.valores,
                        nomes: valoresNomes,
                        emojis: valoresEmojis,
                        cores: valoresCores,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Cursos
                    if (!_showCourses) ...[
                      CoursesPrompt(
                        onShowCourses: () =>
                            setState(() => _showCourses = true),
                        onRetakeTests: () => context.go(AppRoutes.tests),
                      ),
                    ] else ...[
                      const Divider(),
                      const SizedBox(height: 16),
                      CoursesTabSection(cursos: cursosSugeridos),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () => context.go(AppRoutes.tests),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          icon: PhosphorIcon(PhosphorIcons.arrowsClockwise()),
                          label: const Text('Refazer testes'),
                        ),
                      ),
                    ],
                    const SizedBox(height: 32),
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
