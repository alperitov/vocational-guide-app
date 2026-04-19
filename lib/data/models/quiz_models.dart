import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_models.freezed.dart';
part 'quiz_models.g.dart';

enum RiasecDimension {
  realista,
  investigativo,
  artistico,
  social,
  empreendedor,
  convencional,
}

@freezed
sealed class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String id,
    required String texto,
    required RiasecDimension dimensao,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}

@freezed
sealed class QuizSession with _$QuizSession {
  const factory QuizSession({
    required String id,
    required String userId,
    required DateTime iniciadoEm,
    DateTime? completadoEm,
    @Default({}) Map<String, int> respostas,
    @Default({}) Map<String, double> resultados,
  }) = _QuizSession;

  factory QuizSession.fromJson(Map<String, dynamic> json) =>
      _$QuizSessionFromJson(json);
}
