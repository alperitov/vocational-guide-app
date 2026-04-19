// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      id: json['id'] as String,
      texto: json['texto'] as String,
      dimensao: $enumDecode(_$RiasecDimensionEnumMap, json['dimensao']),
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'texto': instance.texto,
      'dimensao': _$RiasecDimensionEnumMap[instance.dimensao]!,
    };

const _$RiasecDimensionEnumMap = {
  RiasecDimension.realista: 'realista',
  RiasecDimension.investigativo: 'investigativo',
  RiasecDimension.artistico: 'artistico',
  RiasecDimension.social: 'social',
  RiasecDimension.empreendedor: 'empreendedor',
  RiasecDimension.convencional: 'convencional',
};

_QuizSession _$QuizSessionFromJson(Map<String, dynamic> json) => _QuizSession(
  id: json['id'] as String,
  userId: json['userId'] as String,
  iniciadoEm: DateTime.parse(json['iniciadoEm'] as String),
  completadoEm: json['completadoEm'] == null
      ? null
      : DateTime.parse(json['completadoEm'] as String),
  respostas:
      (json['respostas'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
  resultados:
      (json['resultados'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ) ??
      const {},
);

Map<String, dynamic> _$QuizSessionToJson(_QuizSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'iniciadoEm': instance.iniciadoEm.toIso8601String(),
      'completadoEm': instance.completadoEm?.toIso8601String(),
      'respostas': instance.respostas,
      'resultados': instance.resultados,
    };
