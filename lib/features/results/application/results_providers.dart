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
