import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/quiz_models.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../features/quiz/data/quiz_repository.dart';

part 'results_providers.g.dart';

@Riverpod(keepAlive: true) // ← keepAlive para não descartar
Future<QuizSession?> latestQuizSession(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return null;
  return ref.read(quizRepositoryProvider).getLatestSession(user.uid);
}

@Riverpod(keepAlive: true) // ← keepAlive para não descartar
Future<List<QuizSession>> quizHistory(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return [];
  return ref.read(quizRepositoryProvider).getSessionsByUser(user.uid);
}

@riverpod
Future<QuizSession?> latestSessionByType(Ref ref, QuizType tipo) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return null;
  return ref
      .read(quizRepositoryProvider)
      .getLatestSessionByType(user.uid, tipo);
}

class CombinedProfile {
  const CombinedProfile({
    required this.riasec,
    required this.gardner,
    required this.valores,
  });

  final Map<String, double> riasec;
  final Map<String, double> gardner;
  final Map<String, double> valores;

  bool get isComplete =>
      riasec.isNotEmpty && gardner.isNotEmpty && valores.isNotEmpty;

  // Top dimensão de cada teste
  String get topRiasec => _top(riasec);
  String get topGardner => _top(gardner);
  String get topValores => _top(valores);

  String _top(Map<String, double> map) {
    if (map.isEmpty) return '';
    return (map.entries.toList()..sort((a, b) => b.value.compareTo(a.value)))
        .first
        .key;
  }
}

@riverpod
Future<CombinedProfile> combinedProfile(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) {
    return const CombinedProfile(riasec: {}, gardner: {}, valores: {});
  }

  final repo = ref.read(quizRepositoryProvider);
  final riasecSession = await repo.getLatestSessionByType(
    user.uid,
    QuizType.riasec,
  );
  final gardnerSession = await repo.getLatestSessionByType(
    user.uid,
    QuizType.gardner,
  );
  final valoresSession = await repo.getLatestSessionByType(
    user.uid,
    QuizType.valores,
  );

  return CombinedProfile(
    riasec: riasecSession?.resultados ?? {},
    gardner: gardnerSession?.resultados ?? {},
    valores: valoresSession?.resultados ?? {},
  );
}
