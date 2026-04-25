// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedPost {

 String get id; String get instituicao; String get titulo; String get descricao; PostTipo get tipo; DateTime get dataPublicacao; DateTime? get dataExpiracao; String? get url; String? get imagemUrl; String? get logoInstituicao;
/// Create a copy of FeedPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedPostCopyWith<FeedPost> get copyWith => _$FeedPostCopyWithImpl<FeedPost>(this as FeedPost, _$identity);

  /// Serializes this FeedPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedPost&&(identical(other.id, id) || other.id == id)&&(identical(other.instituicao, instituicao) || other.instituicao == instituicao)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.dataPublicacao, dataPublicacao) || other.dataPublicacao == dataPublicacao)&&(identical(other.dataExpiracao, dataExpiracao) || other.dataExpiracao == dataExpiracao)&&(identical(other.url, url) || other.url == url)&&(identical(other.imagemUrl, imagemUrl) || other.imagemUrl == imagemUrl)&&(identical(other.logoInstituicao, logoInstituicao) || other.logoInstituicao == logoInstituicao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,instituicao,titulo,descricao,tipo,dataPublicacao,dataExpiracao,url,imagemUrl,logoInstituicao);

@override
String toString() {
  return 'FeedPost(id: $id, instituicao: $instituicao, titulo: $titulo, descricao: $descricao, tipo: $tipo, dataPublicacao: $dataPublicacao, dataExpiracao: $dataExpiracao, url: $url, imagemUrl: $imagemUrl, logoInstituicao: $logoInstituicao)';
}


}

/// @nodoc
abstract mixin class $FeedPostCopyWith<$Res>  {
  factory $FeedPostCopyWith(FeedPost value, $Res Function(FeedPost) _then) = _$FeedPostCopyWithImpl;
@useResult
$Res call({
 String id, String instituicao, String titulo, String descricao, PostTipo tipo, DateTime dataPublicacao, DateTime? dataExpiracao, String? url, String? imagemUrl, String? logoInstituicao
});




}
/// @nodoc
class _$FeedPostCopyWithImpl<$Res>
    implements $FeedPostCopyWith<$Res> {
  _$FeedPostCopyWithImpl(this._self, this._then);

  final FeedPost _self;
  final $Res Function(FeedPost) _then;

/// Create a copy of FeedPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? instituicao = null,Object? titulo = null,Object? descricao = null,Object? tipo = null,Object? dataPublicacao = null,Object? dataExpiracao = freezed,Object? url = freezed,Object? imagemUrl = freezed,Object? logoInstituicao = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,instituicao: null == instituicao ? _self.instituicao : instituicao // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as PostTipo,dataPublicacao: null == dataPublicacao ? _self.dataPublicacao : dataPublicacao // ignore: cast_nullable_to_non_nullable
as DateTime,dataExpiracao: freezed == dataExpiracao ? _self.dataExpiracao : dataExpiracao // ignore: cast_nullable_to_non_nullable
as DateTime?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,imagemUrl: freezed == imagemUrl ? _self.imagemUrl : imagemUrl // ignore: cast_nullable_to_non_nullable
as String?,logoInstituicao: freezed == logoInstituicao ? _self.logoInstituicao : logoInstituicao // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedPost].
extension FeedPostPatterns on FeedPost {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedPost() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedPost value)  $default,){
final _that = this;
switch (_that) {
case _FeedPost():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedPost value)?  $default,){
final _that = this;
switch (_that) {
case _FeedPost() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String instituicao,  String titulo,  String descricao,  PostTipo tipo,  DateTime dataPublicacao,  DateTime? dataExpiracao,  String? url,  String? imagemUrl,  String? logoInstituicao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedPost() when $default != null:
return $default(_that.id,_that.instituicao,_that.titulo,_that.descricao,_that.tipo,_that.dataPublicacao,_that.dataExpiracao,_that.url,_that.imagemUrl,_that.logoInstituicao);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String instituicao,  String titulo,  String descricao,  PostTipo tipo,  DateTime dataPublicacao,  DateTime? dataExpiracao,  String? url,  String? imagemUrl,  String? logoInstituicao)  $default,) {final _that = this;
switch (_that) {
case _FeedPost():
return $default(_that.id,_that.instituicao,_that.titulo,_that.descricao,_that.tipo,_that.dataPublicacao,_that.dataExpiracao,_that.url,_that.imagemUrl,_that.logoInstituicao);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String instituicao,  String titulo,  String descricao,  PostTipo tipo,  DateTime dataPublicacao,  DateTime? dataExpiracao,  String? url,  String? imagemUrl,  String? logoInstituicao)?  $default,) {final _that = this;
switch (_that) {
case _FeedPost() when $default != null:
return $default(_that.id,_that.instituicao,_that.titulo,_that.descricao,_that.tipo,_that.dataPublicacao,_that.dataExpiracao,_that.url,_that.imagemUrl,_that.logoInstituicao);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedPost implements FeedPost {
  const _FeedPost({required this.id, required this.instituicao, required this.titulo, required this.descricao, required this.tipo, required this.dataPublicacao, this.dataExpiracao, this.url, this.imagemUrl, this.logoInstituicao});
  factory _FeedPost.fromJson(Map<String, dynamic> json) => _$FeedPostFromJson(json);

@override final  String id;
@override final  String instituicao;
@override final  String titulo;
@override final  String descricao;
@override final  PostTipo tipo;
@override final  DateTime dataPublicacao;
@override final  DateTime? dataExpiracao;
@override final  String? url;
@override final  String? imagemUrl;
@override final  String? logoInstituicao;

/// Create a copy of FeedPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedPostCopyWith<_FeedPost> get copyWith => __$FeedPostCopyWithImpl<_FeedPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedPost&&(identical(other.id, id) || other.id == id)&&(identical(other.instituicao, instituicao) || other.instituicao == instituicao)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.dataPublicacao, dataPublicacao) || other.dataPublicacao == dataPublicacao)&&(identical(other.dataExpiracao, dataExpiracao) || other.dataExpiracao == dataExpiracao)&&(identical(other.url, url) || other.url == url)&&(identical(other.imagemUrl, imagemUrl) || other.imagemUrl == imagemUrl)&&(identical(other.logoInstituicao, logoInstituicao) || other.logoInstituicao == logoInstituicao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,instituicao,titulo,descricao,tipo,dataPublicacao,dataExpiracao,url,imagemUrl,logoInstituicao);

@override
String toString() {
  return 'FeedPost(id: $id, instituicao: $instituicao, titulo: $titulo, descricao: $descricao, tipo: $tipo, dataPublicacao: $dataPublicacao, dataExpiracao: $dataExpiracao, url: $url, imagemUrl: $imagemUrl, logoInstituicao: $logoInstituicao)';
}


}

/// @nodoc
abstract mixin class _$FeedPostCopyWith<$Res> implements $FeedPostCopyWith<$Res> {
  factory _$FeedPostCopyWith(_FeedPost value, $Res Function(_FeedPost) _then) = __$FeedPostCopyWithImpl;
@override @useResult
$Res call({
 String id, String instituicao, String titulo, String descricao, PostTipo tipo, DateTime dataPublicacao, DateTime? dataExpiracao, String? url, String? imagemUrl, String? logoInstituicao
});




}
/// @nodoc
class __$FeedPostCopyWithImpl<$Res>
    implements _$FeedPostCopyWith<$Res> {
  __$FeedPostCopyWithImpl(this._self, this._then);

  final _FeedPost _self;
  final $Res Function(_FeedPost) _then;

/// Create a copy of FeedPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? instituicao = null,Object? titulo = null,Object? descricao = null,Object? tipo = null,Object? dataPublicacao = null,Object? dataExpiracao = freezed,Object? url = freezed,Object? imagemUrl = freezed,Object? logoInstituicao = freezed,}) {
  return _then(_FeedPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,instituicao: null == instituicao ? _self.instituicao : instituicao // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as PostTipo,dataPublicacao: null == dataPublicacao ? _self.dataPublicacao : dataPublicacao // ignore: cast_nullable_to_non_nullable
as DateTime,dataExpiracao: freezed == dataExpiracao ? _self.dataExpiracao : dataExpiracao // ignore: cast_nullable_to_non_nullable
as DateTime?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,imagemUrl: freezed == imagemUrl ? _self.imagemUrl : imagemUrl // ignore: cast_nullable_to_non_nullable
as String?,logoInstituicao: freezed == logoInstituicao ? _self.logoInstituicao : logoInstituicao // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
