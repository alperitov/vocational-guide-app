import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/light_theme.dart';
import '../application/explore_providers.dart';
import 'widgets/course_card.dart';
import 'widgets/profession_card.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _share(String nome, String descricao, String emoji) {
    SharePlus.instance.share(
      ShareParams(
        text: '$emoji $nome\n\n$descricao\n\nDescobre mais na app Guivo!',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final filter = ref.watch(exploreFilterNotifierProvider);
    final notifier = ref.read(exploreFilterNotifierProvider.notifier);
    final professions = ref.watch(filteredProfessionsProvider);
    final courses = ref.watch(filteredCoursesProvider);
    final profAreas = ref.watch(professionAreasProvider);
    final courseAreas = ref.watch(courseAreasProvider);
    final theme = Theme.of(context);
    final areas = filter.tab == 0 ? profAreas : courseAreas;

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
              bottom: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Explorar',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.compass(),
                      color: Colors.white70,
                      size: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Barra de pesquisa
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: notifier.setQuery,
                    decoration: InputDecoration(
                      hintText: filter.tab == 0
                          ? 'Pesquisar profissões...'
                          : 'Pesquisar cursos...',
                      prefixIcon: PhosphorIcon(
                        PhosphorIcons.magnifyingGlass(),
                        color: Colors.grey,
                      ),
                      suffixIcon: filter.query.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded),
                              onPressed: () {
                                _searchController.clear();
                                notifier.setQuery('');
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      filled: false,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Abas Profissões / Cursos
                Row(
                  children: [
                    _TabButton(
                      label: 'Profissões',
                      emoji: '💼',
                      isSelected: filter.tab == 0,
                      onTap: () => notifier.setTab(0),
                    ),
                    const SizedBox(width: 8),
                    _TabButton(
                      label: 'Cursos',
                      emoji: '🎓',
                      isSelected: filter.tab == 1,
                      onTap: () => notifier.setTab(1),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Filtros por área
          if (areas.isNotEmpty)
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                itemCount: areas.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return _AreaChip(
                      label: 'Todas',
                      isSelected: filter.area == null,
                      onTap: () => notifier.setArea(null),
                    );
                  }
                  final area = areas[i - 1];
                  return _AreaChip(
                    label: area,
                    isSelected: filter.area == area,
                    onTap: () => notifier.setArea(area),
                  );
                },
              ),
            ),

          // Lista
          Expanded(
            child: filter.tab == 0
                ? _ProfessionsList(
                    professions: professions,
                    onTap: (p) =>
                        context.go('${AppRoutes.explore}/profession/${p.id}'),
                    onShare: (p) => _share(p.nome, p.descricao, p.emoji),
                  )
                : _CoursesList(
                    courses: courses,
                    onTap: (c) =>
                        context.go('${AppRoutes.explore}/course/${c.id}'),
                    onShare: (c) => _share(c.nome, c.descricao, '🎓'),
                  ),
          ),
        ],
      ),
    );
  }
}

class _ProfessionsList extends StatelessWidget {
  const _ProfessionsList({
    required this.professions,
    required this.onTap,
    required this.onShare,
  });

  final List professions;
  final Function(dynamic) onTap;
  final Function(dynamic) onShare;

  @override
  Widget build(BuildContext context) {
    if (professions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🔍', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            Text(
              'Nenhuma profissão encontrada',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: professions.length,
      itemBuilder: (_, i) => ProfessionCard(
        profession: professions[i],
        onTap: () => onTap(professions[i]),
        onShare: () => onShare(professions[i]),
      ),
    );
  }
}

class _CoursesList extends StatelessWidget {
  const _CoursesList({
    required this.courses,
    required this.onTap,
    required this.onShare,
  });

  final List courses;
  final Function(dynamic) onTap;
  final Function(dynamic) onShare;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🔍', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            Text(
              'Nenhum curso encontrado',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (_, i) => CourseCard(
        course: courses[i],
        onTap: () => onTap(courses[i]),
        onShare: () => onShare(courses[i]),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xff6155F5) : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AreaChip extends StatelessWidget {
  const _AreaChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : color,
          ),
        ),
      ),
    );
  }
}
