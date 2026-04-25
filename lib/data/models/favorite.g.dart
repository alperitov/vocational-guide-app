// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Favorite _$FavoriteFromJson(Map<String, dynamic> json) => _Favorite(
  id: json['id'] as String,
  userId: json['userId'] as String,
  itemId: json['itemId'] as String,
  tipo: $enumDecode(_$FavoriteTypeEnumMap, json['tipo']),
  criadoEm: DateTime.parse(json['criadoEm'] as String),
  nome: json['nome'] as String?,
  emoji: json['emoji'] as String?,
  area: json['area'] as String?,
);

Map<String, dynamic> _$FavoriteToJson(_Favorite instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'itemId': instance.itemId,
  'tipo': _$FavoriteTypeEnumMap[instance.tipo]!,
  'criadoEm': instance.criadoEm.toIso8601String(),
  'nome': instance.nome,
  'emoji': instance.emoji,
  'area': instance.area,
};

const _$FavoriteTypeEnumMap = {
  FavoriteType.curso: 'curso',
  FavoriteType.profissao: 'profissao',
};
