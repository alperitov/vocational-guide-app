import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/local/courses_data.dart';
import '../../../data/local/professions_data.dart';
import '../../../data/models/course.dart';
import '../../../data/models/profession.dart';

part 'explore_providers.g.dart';

// Estado de pesquisa e filtros
class ExploreFilter {
  const ExploreFilter({
    this.query = '',
    this.area,
    this.tab = 0, // 0 = profissões, 1 = cursos
  });

  final String query;
  final String? area;
  final int tab;

  ExploreFilter copyWith({
    String? query,
    String? area,
    int? tab,
    bool clearArea = false,
  }) => ExploreFilter(
    query: query ?? this.query,
    area: clearArea ? null : (area ?? this.area),
    tab: tab ?? this.tab,
  );
}

@riverpod
class ExploreFilterNotifier extends _$ExploreFilterNotifier {
  @override
  ExploreFilter build() => const ExploreFilter();

  void setQuery(String query) => state = state.copyWith(query: query);

  void setArea(String? area) =>
      state = state.copyWith(area: area, clearArea: area == null);

  void setTab(int tab) =>
      state = state.copyWith(tab: tab, clearArea: true, query: '');
}

@riverpod
List<Profession> filteredProfessions(Ref ref) {
  final filter = ref.watch(exploreFilterNotifierProvider);
  return kProfissoes.where((p) {
    final matchQuery =
        filter.query.isEmpty ||
        p.nome.toLowerCase().contains(filter.query.toLowerCase()) ||
        p.descricao.toLowerCase().contains(filter.query.toLowerCase());
    final matchArea = filter.area == null || p.areaConhecimento == filter.area;
    return matchQuery && matchArea;
  }).toList();
}

@riverpod
List<Course> filteredCourses(Ref ref) {
  final filter = ref.watch(exploreFilterNotifierProvider);
  return kCursos.where((c) {
    final matchQuery =
        filter.query.isEmpty ||
        c.nome.toLowerCase().contains(filter.query.toLowerCase()) ||
        c.descricao.toLowerCase().contains(filter.query.toLowerCase());
    final matchArea = filter.area == null || c.area == filter.area;
    return matchQuery && matchArea;
  }).toList();
}

@riverpod
List<String> professionAreas(Ref ref) =>
    kProfissoes.map((p) => p.areaConhecimento).toSet().toList()..sort();

@riverpod
List<String> courseAreas(Ref ref) =>
    kCursos.map((c) => c.area).toSet().toList()..sort();
