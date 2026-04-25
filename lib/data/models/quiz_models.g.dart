// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizQuestion _$QuizQuestionFromJson(
  Map<String, dynamic> json,
) => _QuizQuestion(
  id: json['id'] as String,
  texto: json['texto'] as String,
  dimensao: $enumDecodeNullable(_$RiasecDimensionEnumMap, json['dimensao']),
  gardnerDimensao: $enumDecodeNullable(
    _$GardnerDimensionEnumMap,
    json['gardnerDimensao'],
  ),
  valoresDimensao: $enumDecodeNullable(
    _$ValoresDimensionEnumMap,
    json['valoresDimensao'],
  ),
  tipo: $enumDecodeNullable(_$QuizTypeEnumMap, json['tipo']) ?? QuizType.riasec,
);

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'texto': instance.texto,
      'dimensao': _$RiasecDimensionEnumMap[instance.dimensao],
      'gardnerDimensao': _$GardnerDimensionEnumMap[instance.gardnerDimensao],
      'valoresDimensao': _$ValoresDimensionEnumMap[instance.valoresDimensao],
      'tipo': _$QuizTypeEnumMap[instance.tipo]!,
    };

const _$RiasecDimensionEnumMap = {
  RiasecDimension.realista: 'realista',
  RiasecDimension.investigativo: 'investigativo',
  RiasecDimension.artistico: 'artistico',
  RiasecDimension.social: 'social',
  RiasecDimension.empreendedor: 'empreendedor',
  RiasecDimension.convencional: 'convencional',
};

const _$GardnerDimensionEnumMap = {
  GardnerDimension.linguistica: 'linguistica',
  GardnerDimension.logico_matematica: 'logico_matematica',
  GardnerDimension.espacial: 'espacial',
  GardnerDimension.musical: 'musical',
  GardnerDimension.corporal_cinestesica: 'corporal_cinestesica',
  GardnerDimension.naturalista: 'naturalista',
  GardnerDimension.interpessoal: 'interpessoal',
  GardnerDimension.intrapessoal: 'intrapessoal',
};

const _$ValoresDimensionEnumMap = {
  ValoresDimension.autonomia: 'autonomia',
  ValoresDimension.prestigio: 'prestigio',
  ValoresDimension.seguranca: 'seguranca',
  ValoresDimension.ajuda_social: 'ajuda_social',
  ValoresDimension.criatividade: 'criatividade',
  ValoresDimension.remuneracao: 'remuneracao',
};

const _$QuizTypeEnumMap = {
  QuizType.riasec: 'riasec',
  QuizType.gardner: 'gardner',
  QuizType.valores: 'valores',
};

_QuizSession _$QuizSessionFromJson(Map<String, dynamic> json) => _QuizSession(
  id: json['id'] as String,
  userId: json['userId'] as String,
  iniciadoEm: DateTime.parse(json['iniciadoEm'] as String),
  tipo: $enumDecodeNullable(_$QuizTypeEnumMap, json['tipo']) ?? QuizType.riasec,
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
      'tipo': _$QuizTypeEnumMap[instance.tipo]!,
      'completadoEm': instance.completadoEm?.toIso8601String(),
      'respostas': instance.respostas,
      'resultados': instance.resultados,
    };
