// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profession.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profession {

 String get id; String get nome; String get descricao; String get emoji; String get areaConhecimento; List<String> get dimRiasec; List<String> get dimGardner; List<String> get dimValores; List<String> get cursosRelacionados; List<String> get instituicoes; MercadoTrabalho get mercadoTrabalho; String? get salarioMedio; String? get detalhesMercado;
/// Create a copy of Profession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfessionCopyWith<Profession> get copyWith => _$ProfessionCopyWithImpl<Profession>(this as Profession, _$identity);

  /// Serializes this Profession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profession&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.areaConhecimento, areaConhecimento) || other.areaConhecimento == areaConhecimento)&&const DeepCollectionEquality().equals(other.dimRiasec, dimRiasec)&&const DeepCollectionEquality().equals(other.dimGardner, dimGardner)&&const DeepCollectionEquality().equals(other.dimValores, dimValores)&&const DeepCollectionEquality().equals(other.cursosRelacionados, cursosRelacionados)&&const DeepCollectionEquality().equals(other.instituicoes, instituicoes)&&(identical(other.mercadoTrabalho, mercadoTrabalho) || other.mercadoTrabalho == mercadoTrabalho)&&(identical(other.salarioMedio, salarioMedio) || other.salarioMedio == salarioMedio)&&(identical(other.detalhesMercado, detalhesMercado) || other.detalhesMercado == detalhesMercado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,descricao,emoji,areaConhecimento,const DeepCollectionEquality().hash(dimRiasec),const DeepCollectionEquality().hash(dimGardner),const DeepCollectionEquality().hash(dimValores),const DeepCollectionEquality().hash(cursosRelacionados),const DeepCollectionEquality().hash(instituicoes),mercadoTrabalho,salarioMedio,detalhesMercado);

@override
String toString() {
  return 'Profession(id: $id, nome: $nome, descricao: $descricao, emoji: $emoji, areaConhecimento: $areaConhecimento, dimRiasec: $dimRiasec, dimGardner: $dimGardner, dimValores: $dimValores, cursosRelacionados: $cursosRelacionados, instituicoes: $instituicoes, mercadoTrabalho: $mercadoTrabalho, salarioMedio: $salarioMedio, detalhesMercado: $detalhesMercado)';
}


}

/// @nodoc
abstract mixin class $ProfessionCopyWith<$Res>  {
  factory $ProfessionCopyWith(Profession value, $Res Function(Profession) _then) = _$ProfessionCopyWithImpl;
@useResult
$Res call({
 String id, String nome, String descricao, String emoji, String areaConhecimento, List<String> dimRiasec, List<String> dimGardner, List<String> dimValores, List<String> cursosRelacionados, List<String> instituicoes, MercadoTrabalho mercadoTrabalho, String? salarioMedio, String? detalhesMercado
});




}
/// @nodoc
class _$ProfessionCopyWithImpl<$Res>
    implements $ProfessionCopyWith<$Res> {
  _$ProfessionCopyWithImpl(this._self, this._then);

  final Profession _self;
  final $Res Function(Profession) _then;

/// Create a copy of Profession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nome = null,Object? descricao = null,Object? emoji = null,Object? areaConhecimento = null,Object? dimRiasec = null,Object? dimGardner = null,Object? dimValores = null,Object? cursosRelacionados = null,Object? instituicoes = null,Object? mercadoTrabalho = null,Object? salarioMedio = freezed,Object? detalhesMercado = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,areaConhecimento: null == areaConhecimento ? _self.areaConhecimento : areaConhecimento // ignore: cast_nullable_to_non_nullable
as String,dimRiasec: null == dimRiasec ? _self.dimRiasec : dimRiasec // ignore: cast_nullable_to_non_nullable
as List<String>,dimGardner: null == dimGardner ? _self.dimGardner : dimGardner // ignore: cast_nullable_to_non_nullable
as List<String>,dimValores: null == dimValores ? _self.dimValores : dimValores // ignore: cast_nullable_to_non_nullable
as List<String>,cursosRelacionados: null == cursosRelacionados ? _self.cursosRelacionados : cursosRelacionados // ignore: cast_nullable_to_non_nullable
as List<String>,instituicoes: null == instituicoes ? _self.instituicoes : instituicoes // ignore: cast_nullable_to_non_nullable
as List<String>,mercadoTrabalho: null == mercadoTrabalho ? _self.mercadoTrabalho : mercadoTrabalho // ignore: cast_nullable_to_non_nullable
as MercadoTrabalho,salarioMedio: freezed == salarioMedio ? _self.salarioMedio : salarioMedio // ignore: cast_nullable_to_non_nullable
as String?,detalhesMercado: freezed == detalhesMercado ? _self.detalhesMercado : detalhesMercado // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Profession].
extension ProfessionPatterns on Profession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profession value)  $default,){
final _that = this;
switch (_that) {
case _Profession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profession value)?  $default,){
final _that = this;
switch (_that) {
case _Profession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nome,  String descricao,  String emoji,  String areaConhecimento,  List<String> dimRiasec,  List<String> dimGardner,  List<String> dimValores,  List<String> cursosRelacionados,  List<String> instituicoes,  MercadoTrabalho mercadoTrabalho,  String? salarioMedio,  String? detalhesMercado)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profession() when $default != null:
return $default(_that.id,_that.nome,_that.descricao,_that.emoji,_that.areaConhecimento,_that.dimRiasec,_that.dimGardner,_that.dimValores,_that.cursosRelacionados,_that.instituicoes,_that.mercadoTrabalho,_that.salarioMedio,_that.detalhesMercado);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nome,  String descricao,  String emoji,  String areaConhecimento,  List<String> dimRiasec,  List<String> dimGardner,  List<String> dimValores,  List<String> cursosRelacionados,  List<String> instituicoes,  MercadoTrabalho mercadoTrabalho,  String? salarioMedio,  String? detalhesMercado)  $default,) {final _that = this;
switch (_that) {
case _Profession():
return $default(_that.id,_that.nome,_that.descricao,_that.emoji,_that.areaConhecimento,_that.dimRiasec,_that.dimGardner,_that.dimValores,_that.cursosRelacionados,_that.instituicoes,_that.mercadoTrabalho,_that.salarioMedio,_that.detalhesMercado);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nome,  String descricao,  String emoji,  String areaConhecimento,  List<String> dimRiasec,  List<String> dimGardner,  List<String> dimValores,  List<String> cursosRelacionados,  List<String> instituicoes,  MercadoTrabalho mercadoTrabalho,  String? salarioMedio,  String? detalhesMercado)?  $default,) {final _that = this;
switch (_that) {
case _Profession() when $default != null:
return $default(_that.id,_that.nome,_that.descricao,_that.emoji,_that.areaConhecimento,_that.dimRiasec,_that.dimGardner,_that.dimValores,_that.cursosRelacionados,_that.instituicoes,_that.mercadoTrabalho,_that.salarioMedio,_that.detalhesMercado);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Profession implements Profession {
  const _Profession({required this.id, required this.nome, required this.descricao, required this.emoji, required this.areaConhecimento, required final  List<String> dimRiasec, required final  List<String> dimGardner, required final  List<String> dimValores, required final  List<String> cursosRelacionados, required final  List<String> instituicoes, required this.mercadoTrabalho, this.salarioMedio, this.detalhesMercado}): _dimRiasec = dimRiasec,_dimGardner = dimGardner,_dimValores = dimValores,_cursosRelacionados = cursosRelacionados,_instituicoes = instituicoes;
  factory _Profession.fromJson(Map<String, dynamic> json) => _$ProfessionFromJson(json);

@override final  String id;
@override final  String nome;
@override final  String descricao;
@override final  String emoji;
@override final  String areaConhecimento;
 final  List<String> _dimRiasec;
@override List<String> get dimRiasec {
  if (_dimRiasec is EqualUnmodifiableListView) return _dimRiasec;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dimRiasec);
}

 final  List<String> _dimGardner;
@override List<String> get dimGardner {
  if (_dimGardner is EqualUnmodifiableListView) return _dimGardner;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dimGardner);
}

 final  List<String> _dimValores;
@override List<String> get dimValores {
  if (_dimValores is EqualUnmodifiableListView) return _dimValores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dimValores);
}

 final  List<String> _cursosRelacionados;
@override List<String> get cursosRelacionados {
  if (_cursosRelacionados is EqualUnmodifiableListView) return _cursosRelacionados;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cursosRelacionados);
}

 final  List<String> _instituicoes;
@override List<String> get instituicoes {
  if (_instituicoes is EqualUnmodifiableListView) return _instituicoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instituicoes);
}

@override final  MercadoTrabalho mercadoTrabalho;
@override final  String? salarioMedio;
@override final  String? detalhesMercado;

/// Create a copy of Profession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfessionCopyWith<_Profession> get copyWith => __$ProfessionCopyWithImpl<_Profession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profession&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.areaConhecimento, areaConhecimento) || other.areaConhecimento == areaConhecimento)&&const DeepCollectionEquality().equals(other._dimRiasec, _dimRiasec)&&const DeepCollectionEquality().equals(other._dimGardner, _dimGardner)&&const DeepCollectionEquality().equals(other._dimValores, _dimValores)&&const DeepCollectionEquality().equals(other._cursosRelacionados, _cursosRelacionados)&&const DeepCollectionEquality().equals(other._instituicoes, _instituicoes)&&(identical(other.mercadoTrabalho, mercadoTrabalho) || other.mercadoTrabalho == mercadoTrabalho)&&(identical(other.salarioMedio, salarioMedio) || other.salarioMedio == salarioMedio)&&(identical(other.detalhesMercado, detalhesMercado) || other.detalhesMercado == detalhesMercado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,descricao,emoji,areaConhecimento,const DeepCollectionEquality().hash(_dimRiasec),const DeepCollectionEquality().hash(_dimGardner),const DeepCollectionEquality().hash(_dimValores),const DeepCollectionEquality().hash(_cursosRelacionados),const DeepCollectionEquality().hash(_instituicoes),mercadoTrabalho,salarioMedio,detalhesMercado);

@override
String toString() {
  return 'Profession(id: $id, nome: $nome, descricao: $descricao, emoji: $emoji, areaConhecimento: $areaConhecimento, dimRiasec: $dimRiasec, dimGardner: $dimGardner, dimValores: $dimValores, cursosRelacionados: $cursosRelacionados, instituicoes: $instituicoes, mercadoTrabalho: $mercadoTrabalho, salarioMedio: $salarioMedio, detalhesMercado: $detalhesMercado)';
}


}

/// @nodoc
abstract mixin class _$ProfessionCopyWith<$Res> implements $ProfessionCopyWith<$Res> {
  factory _$ProfessionCopyWith(_Profession value, $Res Function(_Profession) _then) = __$ProfessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String nome, String descricao, String emoji, String areaConhecimento, List<String> dimRiasec, List<String> dimGardner, List<String> dimValores, List<String> cursosRelacionados, List<String> instituicoes, MercadoTrabalho mercadoTrabalho, String? salarioMedio, String? detalhesMercado
});




}
/// @nodoc
class __$ProfessionCopyWithImpl<$Res>
    implements _$ProfessionCopyWith<$Res> {
  __$ProfessionCopyWithImpl(this._self, this._then);

  final _Profession _self;
  final $Res Function(_Profession) _then;

/// Create a copy of Profession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nome = null,Object? descricao = null,Object? emoji = null,Object? areaConhecimento = null,Object? dimRiasec = null,Object? dimGardner = null,Object? dimValores = null,Object? cursosRelacionados = null,Object? instituicoes = null,Object? mercadoTrabalho = null,Object? salarioMedio = freezed,Object? detalhesMercado = freezed,}) {
  return _then(_Profession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,areaConhecimento: null == areaConhecimento ? _self.areaConhecimento : areaConhecimento // ignore: cast_nullable_to_non_nullable
as String,dimRiasec: null == dimRiasec ? _self._dimRiasec : dimRiasec // ignore: cast_nullable_to_non_nullable
as List<String>,dimGardner: null == dimGardner ? _self._dimGardner : dimGardner // ignore: cast_nullable_to_non_nullable
as List<String>,dimValores: null == dimValores ? _self._dimValores : dimValores // ignore: cast_nullable_to_non_nullable
as List<String>,cursosRelacionados: null == cursosRelacionados ? _self._cursosRelacionados : cursosRelacionados // ignore: cast_nullable_to_non_nullable
as List<String>,instituicoes: null == instituicoes ? _self._instituicoes : instituicoes // ignore: cast_nullable_to_non_nullable
as List<String>,mercadoTrabalho: null == mercadoTrabalho ? _self.mercadoTrabalho : mercadoTrabalho // ignore: cast_nullable_to_non_nullable
as MercadoTrabalho,salarioMedio: freezed == salarioMedio ? _self.salarioMedio : salarioMedio // ignore: cast_nullable_to_non_nullable
as String?,detalhesMercado: freezed == detalhesMercado ? _self.detalhesMercado : detalhesMercado // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
