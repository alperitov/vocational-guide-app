import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/router/app_router.dart';
import '../../../data/local/courses_data.dart';
import '../../../data/models/quiz_models.dart';
import '../application/results_providers.dart';
import 'widgets/courses_tab_section.dart';
import 'widgets/empty_results.dart';
import 'widgets/results_constants.dart';

class ResultsScreen extends ConsumerStatefulWidget {
  const ResultsScreen({super.key});

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen> {
  bool _showCourses = false;

  List<String> _sugerirCursos(CombinedProfile profile) {
    final riasecTop2 =
        (profile.riasec.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value)))
            .take(2)
            .map((e) => e.key)
            .toList();
    final topGardner = profile.topGardner;
    final topValores = profile.topValores;

    final sugeridos = kCursos.where((c) {
      final matchRiasec = c.dimensoesRiasec.any((d) => riasecTop2.contains(d));
      final matchGardner =
          topGardner.isNotEmpty && c.dimGardner.contains(topGardner);
      final matchValores =
          topValores.isNotEmpty && c.dimValores.contains(topValores);
      return matchRiasec || matchGardner || matchValores;
    }).toList();

    sugeridos.sort((a, b) {
      int scoreA = 0, scoreB = 0;
      if (a.dimensoesRiasec.any((d) => riasecTop2.contains(d))) scoreA += 3;
      if (a.dimGardner.contains(topGardner)) scoreA += 2;
      if (a.dimValores.contains(topValores)) scoreA += 1;
      if (b.dimensoesRiasec.any((d) => riasecTop2.contains(d))) scoreB += 3;
      if (b.dimGardner.contains(topGardner)) scoreB += 2;
      if (b.dimValores.contains(topValores)) scoreB += 1;
      return scoreB.compareTo(scoreA);
    });

    return sugeridos.take(8).map((c) => c.id).toList();
  }

  // Gera o texto narrativo do perfil
  String _gerarNarrativa(CombinedProfile profile) {
    if (!profile.isComplete) return '';

    final topRiasec = profile.topRiasec;
    final top2Riasec =
        (profile.riasec.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value)))
            .take(2)
            .map((e) => dimensaoNomes[e.key] ?? e.key)
            .toList();
    final topGardner = profile.topGardner;
    final top2Gardner =
        (profile.gardner.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value)))
            .take(2)
            .map((e) => gardnerNomes[e.key] ?? e.key)
            .toList();
    final topValores = profile.topValores;

    final riasecDesc = _riasecDescricao(topRiasec);
    final gardnerDesc = _gardnerDescricao(topGardner);
    final valoresDesc = _valoresDescricao(topValores);

    return 'És uma pessoa $riasecDesc. '
        'Tens uma inteligência predominantemente $gardnerDesc, '
        'o que significa que aprendes e te destacas melhor nessa área. '
        'No trabalho, o que mais valorizas é $valoresDesc.\n\n'
        'Com base neste perfil, tens maior potencial nas áreas de '
        '${top2Riasec.join(' e ')} — profissões que combinam '
        '${top2Gardner.join(' e ')} com ${valoresDesc.split(' ').first}.';
  }

  String _riasecDescricao(String dim) => switch (dim) {
    'realista' => 'prática e orientada para o trabalho manual e técnico',
    'investigativo' =>
      'analítica e curiosa, que gosta de investigar e resolver problemas',
    'artistico' =>
      'criativa e expressiva, que valoriza a liberdade e a inovação',
    'social' =>
      'empática e comunicativa, que encontra satisfação em ajudar outros',
    'empreendedor' => 'ambiciosa e líder, com aptidão para gerir e persuadir',
    'convencional' => 'organizada e metódica, que prefere estrutura e precisão',
    _ => 'versátil e multifacetada',
  };

  String _gardnerDescricao(String dim) => switch (dim) {
    'linguistica' => 'linguística e verbal',
    'logico_matematica' => 'lógico-matemática',
    'espacial' => 'visual e espacial',
    'musical' => 'musical e auditiva',
    'corporal_cinestesica' => 'corporal e cinestésica',
    'naturalista' => 'naturalista e científica',
    'interpessoal' => 'interpessoal e social',
    'intrapessoal' => 'intrapessoal e reflexiva',
    _ => 'diversificada',
  };

  String _valoresDescricao(String dim) => switch (dim) {
    'autonomia' => 'a liberdade e independência no trabalho',
    'prestigio' => 'o reconhecimento e o prestígio social',
    'seguranca' => 'a estabilidade e segurança profissional',
    'ajuda_social' => 'o impacto positivo na sociedade',
    'criatividade' => 'a criatividade e a inovação constante',
    'remuneracao' => 'uma boa remuneração e sucesso financeiro',
    _ => 'o equilíbrio entre vários aspectos',
  };

  // Gera as áreas recomendadas em texto
  List<Map<String, String>> _gerarAreasRecomendadas(CombinedProfile profile) {
    final topRiasec = profile.topRiasec;
    final topGardner = profile.topGardner;
    final topValores = profile.topValores;

    // Mapa de combinações → áreas recomendadas
    final areas = <Map<String, String>>[];

    // Baseado no RIASEC top
    final riasecAreas = _areasPorRiasec(topRiasec);
    areas.addAll(riasecAreas);

    // Refinamento baseado em Gardner
    if (topGardner == 'logico_matematica' || topGardner == 'espacial') {
      areas.add({
        'emoji': '💻',
        'area': 'Tecnologia e Engenharia',
        'motivo':
            'A tua inteligência lógico-matemática/espacial é ideal para esta área.',
      });
    }
    if (topGardner == 'interpessoal' || topGardner == 'linguistica') {
      areas.add({
        'emoji': '🎓',
        'area': 'Educação e Comunicação',
        'motivo':
            'A tua inteligência interpessoal/linguística destaca-te nesta área.',
      });
    }
    if (topGardner == 'naturalista') {
      areas.add({
        'emoji': '🌿',
        'area': 'Ciências Naturais e Ambiente',
        'motivo': 'A tua inteligência naturalista é uma vantagem nesta área.',
      });
    }

    // Remove duplicados e limita a 4
    final seen = <String>{};
    return areas.where((a) => seen.add(a['area']!)).take(4).toList();
  }

  List<Map<String, String>> _areasPorRiasec(String dim) => switch (dim) {
    'realista' => [
      {
        'emoji': '⚙️',
        'area': 'Engenharia e Construção',
        'motivo':
            'O teu perfil prático e técnico combina naturalmente com esta área.',
      },
      {
        'emoji': '🌾',
        'area': 'Agricultura e Meio Ambiente',
        'motivo':
            'A tua preferência por actividades ao ar livre é uma vantagem aqui.',
      },
    ],
    'investigativo' => [
      {
        'emoji': '🔬',
        'area': 'Ciências e Investigação',
        'motivo':
            'A tua mente analítica e curiosidade científica são ideais aqui.',
      },
      {
        'emoji': '💻',
        'area': 'Tecnologia e Informática',
        'motivo': 'A resolução de problemas complexos é o core desta área.',
      },
    ],
    'artistico' => [
      {
        'emoji': '🎨',
        'area': 'Artes, Design e Comunicação',
        'motivo': 'A tua criatividade e expressão são os pilares desta área.',
      },
      {
        'emoji': '🏛️',
        'area': 'Arquitectura e Urbanismo',
        'motivo': 'Combina criatividade com impacto visual e espacial.',
      },
    ],
    'social' => [
      {
        'emoji': '🏥',
        'area': 'Saúde e Bem-estar',
        'motivo':
            'A tua empatia e vontade de ajudar são essenciais nesta área.',
      },
      {
        'emoji': '📚',
        'area': 'Educação e Serviço Social',
        'motivo': 'O teu perfil social é o mais valorizado nestas profissões.',
      },
    ],
    'empreendedor' => [
      {
        'emoji': '📈',
        'area': 'Gestão e Negócios',
        'motivo': 'A tua liderança e ambição são activos valiosos nesta área.',
      },
      {
        'emoji': '⚖️',
        'area': 'Direito e Relações Internacionais',
        'motivo': 'A tua capacidade de persuasão destaca-te nesta área.',
      },
    ],
    'convencional' => [
      {
        'emoji': '💰',
        'area': 'Contabilidade e Finanças',
        'motivo': 'A tua precisão e organização são essenciais nesta área.',
      },
      {
        'emoji': '🏦',
        'area': 'Administração e Gestão Pública',
        'motivo': 'O teu perfil metódico é muito valorizado nestas funções.',
      },
    ],
    _ => [],
  };

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(combinedProfileProvider);
    final theme = Theme.of(context);

    return profileAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erro: $e'))),
      data: (profile) {
        if (profile.riasec.isEmpty) return const EmptyResults();

        final narrativa = _gerarNarrativa(profile);
        final areas = _gerarAreasRecomendadas(profile);
        final cursoIds = _sugerirCursos(profile);
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
                      // Badge do perfil
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
                      // Progresso dos testes
                      const SizedBox(height: 16),
                      _TestsBadges(profile: profile),
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
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: topColor.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: topColor.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                PhosphorIcon(
                                  PhosphorIcons.sparkle(),
                                  color: topColor,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'O teu perfil em palavras',
                                  style: TextStyle(
                                    color: topColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              narrativa,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ] else ...[
                      // Se não completou todos os testes
                      _IncompleteNotice(
                        profile: profile,
                        onTap: () => context.go(AppRoutes.tests),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Áreas recomendadas
                    Text(
                      'Áreas recomendadas para ti',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Com base no teu perfil combinado',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...areas.map(
                      (area) => _AreaCard(
                        emoji: area['emoji']!,
                        area: area['area']!,
                        motivo: area['motivo']!,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Pergunta ao utilizador
                    if (!_showCourses) ...[
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Text('🎓', style: TextStyle(fontSize: 36)),
                            const SizedBox(height: 12),
                            Text(
                              'Queres ver os cursos recomendados?',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Com base no teu perfil, identificámos cursos disponíveis em Moçambique que combinam contigo.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () =>
                                        context.go(AppRoutes.tests),
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text('Refazer testes'),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: FilledButton(
                                    onPressed: () =>
                                        setState(() => _showCourses = true),
                                    style: FilledButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text('Ver cursos'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
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

// Badges dos testes realizados
class _TestsBadges extends StatelessWidget {
  const _TestsBadges({required this.profile});
  final CombinedProfile profile;

  @override
  Widget build(BuildContext context) {
    final tests = [
      ('🎯', 'RIASEC', profile.riasec.isNotEmpty),
      ('🧠', 'Gardner', profile.gardner.isNotEmpty),
      ('⚖️', 'Valores', profile.valores.isNotEmpty),
    ];
    return Row(
      children: tests.map((t) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: t.$3
                  ? Colors.white.withValues(alpha: 0.25)
                  : Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(t.$1, style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 4),
                Text(
                  t.$2,
                  style: TextStyle(
                    color: t.$3 ? Colors.white : Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (t.$3) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Card de área recomendada
class _AreaCard extends StatelessWidget {
  const _AreaCard({
    required this.emoji,
    required this.area,
    required this.motivo,
  });

  final String emoji;
  final String area;
  final String motivo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 22)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  area,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  motivo,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Aviso de perfil incompleto
class _IncompleteNotice extends StatelessWidget {
  const _IncompleteNotice({required this.profile, required this.onTap});
  final CombinedProfile profile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final missing = <String>[];
    if (profile.riasec.isEmpty) missing.add('RIASEC');
    if (profile.gardner.isEmpty) missing.add('Gardner');
    if (profile.valores.isEmpty) missing.add('Valores');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffFFF3E0),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xffFF9800).withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        children: [
          const Text('⚠️', style: TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Perfil incompleto',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE65100),
                  ),
                ),
                Text(
                  'Faz o(s) teste(s) ${missing.join(', ')} para uma análise mais precisa.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xffE65100),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Completar testes →',
                    style: TextStyle(
                      color: Color(0xffE65100),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
