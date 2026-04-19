// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Course _$CourseFromJson(Map<String, dynamic> json) => _Course(
  id: json['id'] as String,
  nome: json['nome'] as String,
  area: json['area'] as String,
  dimensoesRiasec: (json['dimensoesRiasec'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  instituicoes: (json['instituicoes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  descricao: json['descricao'] as String,
);

Map<String, dynamic> _$CourseToJson(_Course instance) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'area': instance.area,
  'dimensoesRiasec': instance.dimensoesRiasec,
  'instituicoes': instance.instituicoes,
  'descricao': instance.descricao,
};
