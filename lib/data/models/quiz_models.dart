import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_models.freezed.dart';
part 'quiz_models.g.dart';

// ── RIASEC ──────────────────────────────────────────────
enum RiasecDimension {
  realista,
  investigativo,
  artistico,
  social,
  empreendedor,
  convencional,
}

// ── GARDNER ─────────────────────────────────────────────
enum GardnerDimension {
  linguistica,
  logico_matematica,
  espacial,
  musical,
  corporal_cinestesica,
  naturalista,
  interpessoal,
  intrapessoal,
}

// ── VALORES DE TRABALHO ──────────────────────────────────
enum ValoresDimension {
  autonomia,
  prestigio,
  seguranca,
  ajuda_social,
  criatividade,
  remuneracao,
}

// ── TIPO DE TESTE ────────────────────────────────────────
enum QuizType { riasec, gardner, valores }

@freezed
sealed class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String id,
    required String texto,
    required RiasecDimension? dimensao,
    GardnerDimension? gardnerDimensao,
    ValoresDimension? valoresDimensao,
    @Default(QuizType.riasec) QuizType tipo,
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
    @Default(QuizType.riasec) QuizType tipo,
    DateTime? completadoEm,
    @Default({}) Map<String, int> respostas,
    @Default({}) Map<String, double> resultados,
  }) = _QuizSession;

  factory QuizSession.fromJson(Map<String, dynamic> json) =>
      _$QuizSessionFromJson(json);
}
