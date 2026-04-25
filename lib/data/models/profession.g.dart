// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profession _$ProfessionFromJson(Map<String, dynamic> json) => _Profession(
  id: json['id'] as String,
  nome: json['nome'] as String,
  descricao: json['descricao'] as String,
  emoji: json['emoji'] as String,
  areaConhecimento: json['areaConhecimento'] as String,
  dimRiasec: (json['dimRiasec'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  dimGardner: (json['dimGardner'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  dimValores: (json['dimValores'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  cursosRelacionados: (json['cursosRelacionados'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  instituicoes: (json['instituicoes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  mercadoTrabalho: $enumDecode(
    _$MercadoTrabalhoEnumMap,
    json['mercadoTrabalho'],
  ),
  salarioMedio: json['salarioMedio'] as String?,
  detalhesMercado: json['detalhesMercado'] as String?,
);

Map<String, dynamic> _$ProfessionToJson(_Profession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'emoji': instance.emoji,
      'areaConhecimento': instance.areaConhecimento,
      'dimRiasec': instance.dimRiasec,
      'dimGardner': instance.dimGardner,
      'dimValores': instance.dimValores,
      'cursosRelacionados': instance.cursosRelacionados,
      'instituicoes': instance.instituicoes,
      'mercadoTrabalho': _$MercadoTrabalhoEnumMap[instance.mercadoTrabalho]!,
      'salarioMedio': instance.salarioMedio,
      'detalhesMercado': instance.detalhesMercado,
    };

const _$MercadoTrabalhoEnumMap = {
  MercadoTrabalho.excelente: 'excelente',
  MercadoTrabalho.bom: 'bom',
  MercadoTrabalho.moderado: 'moderado',
  MercadoTrabalho.limitado: 'limitado',
};
