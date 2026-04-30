// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Institution _$InstitutionFromJson(Map<String, dynamic> json) => _Institution(
  id: json['id'] as String,
  acronym: json['acronym'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$InstitutionTypeEnumMap, json['type']),
  province: $enumDecode(_$ProvinceEnumMap, json['province']),
  website: json['website'] as String?,
  logoUrl: json['logoUrl'] as String?,
);

Map<String, dynamic> _$InstitutionToJson(_Institution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'acronym': instance.acronym,
      'name': instance.name,
      'type': _$InstitutionTypeEnumMap[instance.type]!,
      'province': _$ProvinceEnumMap[instance.province]!,
      'website': instance.website,
      'logoUrl': instance.logoUrl,
    };

const _$InstitutionTypeEnumMap = {
  InstitutionType.publica: 'publica',
  InstitutionType.privada: 'privada',
};

const _$ProvinceEnumMap = {
  Province.maputoCidade: 'maputoCidade',
  Province.maputoProvincia: 'maputoProvincia',
  Province.gaza: 'gaza',
  Province.inhambane: 'inhambane',
  Province.sofala: 'sofala',
  Province.manica: 'manica',
  Province.tete: 'tete',
  Province.zambezia: 'zambezia',
  Province.nampula: 'nampula',
  Province.niassa: 'niassa',
  Province.caboDelgado: 'caboDelgado',
};
