import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/quiz_models.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../results/application/results_providers.dart';
import '../data/quiz_questions.dart';
import '../data/quiz_repository.dart';
import '../../../data/remote/firebase_sync_service.dart';

part 'quiz_providers.g.dart';

class QuizState {
  const QuizState({
    this.session,
    this.currentIndex = 0,
    this.isLoading = false,
    this.isComplete = false,
  });

  final QuizSession? session;
  final int currentIndex;
  final bool isLoading;
  final bool isComplete;

  QuizState copyWith({
    QuizSession? session,
    int? currentIndex,
    bool? isLoading,
    bool? isComplete,
  }) => QuizState(
    session: session ?? this.session,
    currentIndex: currentIndex ?? this.currentIndex,
    isLoading: isLoading ?? this.isLoading,
    isComplete: isComplete ?? this.isComplete,
  );

  int get totalQuestions => kQuizQuestions.length;
  double get progress =>
      session == null ? 0 : session!.respostas.length / totalQuestions;
  QuizQuestion get currentQuestion => kQuizQuestions[currentIndex];
  int? get currentAnswer => session?.respostas[currentQuestion.id];
  bool get isLastQuestion => currentIndex == totalQuestions - 1;
}

@riverpod
class QuizNotifier extends _$QuizNotifier {
  @override
  QuizState build() => const QuizState();

  Future<void> iniciarQuiz() async {
    state = state.copyWith(isLoading: true);
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) return;

    final session = await ref
        .read(quizRepositoryProvider)
        .createSession(user.uid);
    state = QuizState(session: session);
  }

  Future<void> responder(int score) async {
    final session = state.session;
    if (session == null) return;

    final novasRespostas = Map<String, int>.from(session.respostas)
      ..[state.currentQuestion.id] = score;

    final novaSession = session.copyWith(respostas: novasRespostas);
    state = state.copyWith(session: novaSession);

    // Avança automaticamente para a próxima pergunta
    if (!state.isLastQuestion) {
      state = state.copyWith(
        session: novaSession,
        currentIndex: state.currentIndex + 1,
      );
    } else {
      await _concluirQuiz(novaSession);
    }
  }

  void voltarPergunta() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  Future<void> _concluirQuiz(QuizSession session) async {
    final scores = <String, double>{};
    for (final dim in RiasecDimension.values) {
      final perguntas = kQuizQuestions.where((q) => q.dimensao == dim);
      final total = perguntas
          .map((q) => session.respostas[q.id] ?? 0)
          .fold(0, (a, b) => a + b);
      scores[dim.name] = (total / (perguntas.length * 5)) * 100;
    }

    final sessionCompleta = session.copyWith(
      completadoEm: DateTime.now(),
      resultados: scores,
    );

    // Guarda localmente
    await ref.read(quizRepositoryProvider).saveSession(sessionCompleta);
    // Sincroniza com Firebase em background
    ref.read(firebaseSyncServiceProvider).syncSession(sessionCompleta);

    // Invalida os providers de resultados
    ref.invalidate(latestQuizSessionProvider);
    ref.invalidate(quizHistoryProvider);

    state = state.copyWith(session: sessionCompleta, isComplete: true);
  }
}
