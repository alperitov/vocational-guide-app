// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedPost _$FeedPostFromJson(Map<String, dynamic> json) => _FeedPost(
  id: json['id'] as String,
  instituicao: json['instituicao'] as String,
  titulo: json['titulo'] as String,
  descricao: json['descricao'] as String,
  tipo: $enumDecode(_$PostTipoEnumMap, json['tipo']),
  dataPublicacao: DateTime.parse(json['dataPublicacao'] as String),
  dataExpiracao: json['dataExpiracao'] == null
      ? null
      : DateTime.parse(json['dataExpiracao'] as String),
  url: json['url'] as String?,
  imagemUrl: json['imagemUrl'] as String?,
  logoInstituicao: json['logoInstituicao'] as String?,
);

Map<String, dynamic> _$FeedPostToJson(_FeedPost instance) => <String, dynamic>{
  'id': instance.id,
  'instituicao': instance.instituicao,
  'titulo': instance.titulo,
  'descricao': instance.descricao,
  'tipo': _$PostTipoEnumMap[instance.tipo]!,
  'dataPublicacao': instance.dataPublicacao.toIso8601String(),
  'dataExpiracao': instance.dataExpiracao?.toIso8601String(),
  'url': instance.url,
  'imagemUrl': instance.imagemUrl,
  'logoInstituicao': instance.logoInstituicao,
};

const _$PostTipoEnumMap = {
  PostTipo.edital: 'edital',
  PostTipo.bolsa: 'bolsa',
  PostTipo.evento: 'evento',
  PostTipo.noticia: 'noticia',
  PostTipo.programa: 'programa',
};
