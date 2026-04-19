import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/quiz_models.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../features/quiz/data/quiz_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'results_providers.g.dart';

@riverpod
Future<QuizSession?> latestQuizSession(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return null;
  return ref.read(quizRepositoryProvider).getLatestSession(user.uid);
}
