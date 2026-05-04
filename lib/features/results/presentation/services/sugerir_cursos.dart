import '../../../../data/local/courses_data.dart';
import '../../application/results_providers.dart';

List<String> sugerirCursos(CombinedProfile profile) {
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
    int sA = 0, sB = 0;
    if (a.dimensoesRiasec.any((d) => riasecTop2.contains(d))) sA += 3;
    if (a.dimGardner.contains(topGardner)) sA += 2;
    if (a.dimValores.contains(topValores)) sA += 1;
    if (b.dimensoesRiasec.any((d) => riasecTop2.contains(d))) sB += 3;
    if (b.dimGardner.contains(topGardner)) sB += 2;
    if (b.dimValores.contains(topValores)) sB += 1;
    return sB.compareTo(sA);
  });

  return sugeridos.take(8).map((c) => c.id).toList();
}
