import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/quiz_models.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../results/application/results_providers.dart';
import '../data/quiz_questions.dart';
import '../data/gardner_questions.dart';
import '../data/valores_questions.dart';
import '../data/quiz_repository.dart';

part 'quiz_providers.g.dart';

class QuizState {
  const QuizState({
    this.session,
    this.currentIndex = 0,
    this.isLoading = false,
    this.isComplete = false,
    List<QuizQuestion>? questions,
  }) : _questions = questions;

  final QuizSession? session;
  final int currentIndex;
  final bool isLoading;
  final bool isComplete;
  final List<QuizQuestion>? _questions;

  List<QuizQuestion> get questions => _questions ?? kQuizQuestions;

  QuizState copyWith({
    QuizSession? session,
    int? currentIndex,
    bool? isLoading,
    bool? isComplete,
    List<QuizQuestion>? questions,
  }) => QuizState(
    session: session ?? this.session,
    currentIndex: currentIndex ?? this.currentIndex,
    isLoading: isLoading ?? this.isLoading,
    isComplete: isComplete ?? this.isComplete,
    questions: questions ?? _questions,
  );

  int get totalQuestions => questions.length;
  double get progress =>
      session == null ? 0 : session!.respostas.length / totalQuestions;
  QuizQuestion get currentQuestion => questions[currentIndex];
  int? get currentAnswer => session?.respostas[currentQuestion.id];
  bool get isLastQuestion => currentIndex == totalQuestions - 1;
}

@riverpod
class QuizNotifier extends _$QuizNotifier {
  @override
  QuizState build() => const QuizState();

  Future<void> iniciarQuiz({QuizType tipo = QuizType.riasec}) async {
    state = state.copyWith(isLoading: true);
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) return;

    final questions = _getQuestions(tipo);
    final session = await ref
        .read(quizRepositoryProvider)
        .createSession(user.uid, tipo: tipo);
    state = QuizState(session: session, questions: questions);
  }

  List<QuizQuestion> _getQuestions(QuizType tipo) {
    return switch (tipo) {
      QuizType.riasec => _shuffleRiasec(),
      QuizType.gardner => _shuffleGardner(),
      QuizType.valores => _shuffleValores(),
    };
  }

  List<QuizQuestion> _shuffleRiasec() {
    final grouped = <RiasecDimension, List<QuizQuestion>>{};
    for (final dim in RiasecDimension.values) {
      grouped[dim] = kQuizQuestions.where((q) => q.dimensao == dim).toList()
        ..shuffle(Random());
    }
    final result = <QuizQuestion>[];
    final dims = RiasecDimension.values.toList()..shuffle(Random());
    final maxPerDim = grouped.values.map((l) => l.length).reduce(max);
    for (int i = 0; i < maxPerDim; i++) {
      for (final dim in dims) {
        final list = grouped[dim]!;
        if (i < list.length) result.add(list[i]);
      }
    }
    return result;
  }

  List<QuizQuestion> _shuffleGardner() {
    final grouped = <GardnerDimension, List<QuizQuestion>>{};
    for (final dim in GardnerDimension.values) {
      grouped[dim] =
          kGardnerQuestions.where((q) => q.gardnerDimensao == dim).toList()
            ..shuffle(Random());
    }
    final result = <QuizQuestion>[];
    final dims = GardnerDimension.values.toList()..shuffle(Random());
    for (int i = 0; i < 3; i++) {
      for (final dim in dims) {
        final list = grouped[dim]!;
        if (i < list.length) result.add(list[i]);
      }
    }
    return result;
  }

  List<QuizQuestion> _shuffleValores() {
    final grouped = <ValoresDimension, List<QuizQuestion>>{};
    for (final dim in ValoresDimension.values) {
      grouped[dim] =
          kValoresQuestions.where((q) => q.valoresDimensao == dim).toList()
            ..shuffle(Random());
    }
    final result = <QuizQuestion>[];
    final dims = ValoresDimension.values.toList()..shuffle(Random());
    for (int i = 0; i < 3; i++) {
      for (final dim in dims) {
        final list = grouped[dim]!;
        if (i < list.length) result.add(list[i]);
      }
    }
    return result;
  }

  Future<void> responder(int score) async {
    final session = state.session;
    if (session == null) return;

    final novasRespostas = Map<String, int>.from(session.respostas)
      ..[state.currentQuestion.id] = score;
    final novaSession = session.copyWith(respostas: novasRespostas);
    state = state.copyWith(session: novaSession);

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

    switch (session.tipo) {
      case QuizType.riasec:
        for (final dim in RiasecDimension.values) {
          final perguntas = kQuizQuestions.where((q) => q.dimensao == dim);
          final total = perguntas
              .map((q) => session.respostas[q.id] ?? 0)
              .fold(0, (a, b) => a + b);
          scores[dim.name] = (total / (perguntas.length * 5)) * 100;
        }
      case QuizType.gardner:
        for (final dim in GardnerDimension.values) {
          final perguntas = kGardnerQuestions.where(
            (q) => q.gardnerDimensao == dim,
          );
          final total = perguntas
              .map((q) => session.respostas[q.id] ?? 0)
              .fold(0, (a, b) => a + b);
          scores[dim.name] = (total / (perguntas.length * 5)) * 100;
        }
      case QuizType.valores:
        for (final dim in ValoresDimension.values) {
          final perguntas = kValoresQuestions.where(
            (q) => q.valoresDimensao == dim,
          );
          final total = perguntas
              .map((q) => session.respostas[q.id] ?? 0)
              .fold(0, (a, b) => a + b);
          scores[dim.name] = (total / (perguntas.length * 5)) * 100;
        }
    }

    final sessionCompleta = session.copyWith(
      completadoEm: DateTime.now(),
      resultados: scores,
    );

    await ref.read(quizRepositoryProvider).saveSession(sessionCompleta);
    ref.invalidate(latestSessionByTypeProvider(session.tipo));

    state = state.copyWith(session: sessionCompleta, isComplete: true);
  }
}
