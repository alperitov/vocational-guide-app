// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Course {

 String get id; String get nome; String get area; List<String> get dimensoesRiasec; List<String> get instituicoes; String get descricao; List<String> get dimGardner; List<String> get dimValores; List<String> get profissoesRelacionadas; String? get duracao; String? get requisitosMinimos;
/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseCopyWith<Course> get copyWith => _$CourseCopyWithImpl<Course>(this as Course, _$identity);

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Course&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.area, area) || other.area == area)&&const DeepCollectionEquality().equals(other.dimensoesRiasec, dimensoesRiasec)&&const DeepCollectionEquality().equals(other.instituicoes, instituicoes)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&const DeepCollectionEquality().equals(other.dimGardner, dimGardner)&&const DeepCollectionEquality().equals(other.dimValores, dimValores)&&const DeepCollectionEquality().equals(other.profissoesRelacionadas, profissoesRelacionadas)&&(identical(other.duracao, duracao) || other.duracao == duracao)&&(identical(other.requisitosMinimos, requisitosMinimos) || other.requisitosMinimos == requisitosMinimos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,area,const DeepCollectionEquality().hash(dimensoesRiasec),const DeepCollectionEquality().hash(instituicoes),descricao,const DeepCollectionEquality().hash(dimGardner),const DeepCollectionEquality().hash(dimValores),const DeepCollectionEquality().hash(profissoesRelacionadas),duracao,requisitosMinimos);

@override
String toString() {
  return 'Course(id: $id, nome: $nome, area: $area, dimensoesRiasec: $dimensoesRiasec, instituicoes: $instituicoes, descricao: $descricao, dimGardner: $dimGardner, dimValores: $dimValores, profissoesRelacionadas: $profissoesRelacionadas, duracao: $duracao, requisitosMinimos: $requisitosMinimos)';
}


}

/// @nodoc
abstract mixin class $CourseCopyWith<$Res>  {
  factory $CourseCopyWith(Course value, $Res Function(Course) _then) = _$CourseCopyWithImpl;
@useResult
$Res call({
 String id, String nome, String area, List<String> dimensoesRiasec, List<String> instituicoes, String descricao, List<String> dimGardner, List<String> dimValores, List<String> profissoesRelacionadas, String? duracao, String? requisitosMinimos
});




}
/// @nodoc
class _$CourseCopyWithImpl<$Res>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._self, this._then);

  final Course _self;
  final $Res Function(Course) _then;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nome = null,Object? area = null,Object? dimensoesRiasec = null,Object? instituicoes = null,Object? descricao = null,Object? dimGardner = null,Object? dimValores = null,Object? profissoesRelacionadas = null,Object? duracao = freezed,Object? requisitosMinimos = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,dimensoesRiasec: null == dimensoesRiasec ? _self.dimensoesRiasec : dimensoesRiasec // ignore: cast_nullable_to_non_nullable
as List<String>,instituicoes: null == instituicoes ? _self.instituicoes : instituicoes // ignore: cast_nullable_to_non_nullable
as List<String>,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,dimGardner: null == dimGardner ? _self.dimGardner : dimGardner // ignore: cast_nullable_to_non_nullable
as List<String>,dimValores: null == dimValores ? _self.dimValores : dimValores // ignore: cast_nullable_to_non_nullable
as List<String>,profissoesRelacionadas: null == profissoesRelacionadas ? _self.profissoesRelacionadas : profissoesRelacionadas // ignore: cast_nullable_to_non_nullable
as List<String>,duracao: freezed == duracao ? _self.duracao : duracao // ignore: cast_nullable_to_non_nullable
as String?,requisitosMinimos: freezed == requisitosMinimos ? _self.requisitosMinimos : requisitosMinimos // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Course].
extension CoursePatterns on Course {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Course value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Course() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Course value)  $default,){
final _that = this;
switch (_that) {
case _Course():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Course value)?  $default,){
final _that = this;
switch (_that) {
case _Course() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nome,  String area,  List<String> dimensoesRiasec,  List<String> instituicoes,  String descricao,  List<String> dimGardner,  List<String> dimValores,  List<String> profissoesRelacionadas,  String? duracao,  String? requisitosMinimos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Course() when $default != null:
return $default(_that.id,_that.nome,_that.area,_that.dimensoesRiasec,_that.instituicoes,_that.descricao,_that.dimGardner,_that.dimValores,_that.profissoesRelacionadas,_that.duracao,_that.requisitosMinimos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nome,  String area,  List<String> dimensoesRiasec,  List<String> instituicoes,  String descricao,  List<String> dimGardner,  List<String> dimValores,  List<String> profissoesRelacionadas,  String? duracao,  String? requisitosMinimos)  $default,) {final _that = this;
switch (_that) {
case _Course():
return $default(_that.id,_that.nome,_that.area,_that.dimensoesRiasec,_that.instituicoes,_that.descricao,_that.dimGardner,_that.dimValores,_that.profissoesRelacionadas,_that.duracao,_that.requisitosMinimos);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nome,  String area,  List<String> dimensoesRiasec,  List<String> instituicoes,  String descricao,  List<String> dimGardner,  List<String> dimValores,  List<String> profissoesRelacionadas,  String? duracao,  String? requisitosMinimos)?  $default,) {final _that = this;
switch (_that) {
case _Course() when $default != null:
return $default(_that.id,_that.nome,_that.area,_that.dimensoesRiasec,_that.instituicoes,_that.descricao,_that.dimGardner,_that.dimValores,_that.profissoesRelacionadas,_that.duracao,_that.requisitosMinimos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Course implements Course {
  const _Course({required this.id, required this.nome, required this.area, required final  List<String> dimensoesRiasec, required final  List<String> instituicoes, required this.descricao, final  List<String> dimGardner = const [], final  List<String> dimValores = const [], final  List<String> profissoesRelacionadas = const [], this.duracao, this.requisitosMinimos}): _dimensoesRiasec = dimensoesRiasec,_instituicoes = instituicoes,_dimGardner = dimGardner,_dimValores = dimValores,_profissoesRelacionadas = profissoesRelacionadas;
  factory _Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

@override final  String id;
@override final  String nome;
@override final  String area;
 final  List<String> _dimensoesRiasec;
@override List<String> get dimensoesRiasec {
  if (_dimensoesRiasec is EqualUnmodifiableListView) return _dimensoesRiasec;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dimensoesRiasec);
}

 final  List<String> _instituicoes;
@override List<String> get instituicoes {
  if (_instituicoes is EqualUnmodifiableListView) return _instituicoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instituicoes);
}

@override final  String descricao;
 final  List<String> _dimGardner;
@override@JsonKey() List<String> get dimGardner {
  if (_dimGardner is EqualUnmodifiableListView) return _dimGardner;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dimGardner);
}

 final  List<String> _dimValores;
@override@JsonKey() List<String> get dimValores {
  if (_dimValores is EqualUnmodifiableListView) return _dimValores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dimValores);
}

 final  List<String> _profissoesRelacionadas;
@override@JsonKey() List<String> get profissoesRelacionadas {
  if (_profissoesRelacionadas is EqualUnmodifiableListView) return _profissoesRelacionadas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profissoesRelacionadas);
}

@override final  String? duracao;
@override final  String? requisitosMinimos;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseCopyWith<_Course> get copyWith => __$CourseCopyWithImpl<_Course>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Course&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.area, area) || other.area == area)&&const DeepCollectionEquality().equals(other._dimensoesRiasec, _dimensoesRiasec)&&const DeepCollectionEquality().equals(other._instituicoes, _instituicoes)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&const DeepCollectionEquality().equals(other._dimGardner, _dimGardner)&&const DeepCollectionEquality().equals(other._dimValores, _dimValores)&&const DeepCollectionEquality().equals(other._profissoesRelacionadas, _profissoesRelacionadas)&&(identical(other.duracao, duracao) || other.duracao == duracao)&&(identical(other.requisitosMinimos, requisitosMinimos) || other.requisitosMinimos == requisitosMinimos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,area,const DeepCollectionEquality().hash(_dimensoesRiasec),const DeepCollectionEquality().hash(_instituicoes),descricao,const DeepCollectionEquality().hash(_dimGardner),const DeepCollectionEquality().hash(_dimValores),const DeepCollectionEquality().hash(_profissoesRelacionadas),duracao,requisitosMinimos);

@override
String toString() {
  return 'Course(id: $id, nome: $nome, area: $area, dimensoesRiasec: $dimensoesRiasec, instituicoes: $instituicoes, descricao: $descricao, dimGardner: $dimGardner, dimValores: $dimValores, profissoesRelacionadas: $profissoesRelacionadas, duracao: $duracao, requisitosMinimos: $requisitosMinimos)';
}


}

/// @nodoc
abstract mixin class _$CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$CourseCopyWith(_Course value, $Res Function(_Course) _then) = __$CourseCopyWithImpl;
@override @useResult
$Res call({
 String id, String nome, String area, List<String> dimensoesRiasec, List<String> instituicoes, String descricao, List<String> dimGardner, List<String> dimValores, List<String> profissoesRelacionadas, String? duracao, String? requisitosMinimos
});




}
/// @nodoc
class __$CourseCopyWithImpl<$Res>
    implements _$CourseCopyWith<$Res> {
  __$CourseCopyWithImpl(this._self, this._then);

  final _Course _self;
  final $Res Function(_Course) _then;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nome = null,Object? area = null,Object? dimensoesRiasec = null,Object? instituicoes = null,Object? descricao = null,Object? dimGardner = null,Object? dimValores = null,Object? profissoesRelacionadas = null,Object? duracao = freezed,Object? requisitosMinimos = freezed,}) {
  return _then(_Course(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,dimensoesRiasec: null == dimensoesRiasec ? _self._dimensoesRiasec : dimensoesRiasec // ignore: cast_nullable_to_non_nullable
as List<String>,instituicoes: null == instituicoes ? _self._instituicoes : instituicoes // ignore: cast_nullable_to_non_nullable
as List<String>,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,dimGardner: null == dimGardner ? _self._dimGardner : dimGardner // ignore: cast_nullable_to_non_nullable
as List<String>,dimValores: null == dimValores ? _self._dimValores : dimValores // ignore: cast_nullable_to_non_nullable
as List<String>,profissoesRelacionadas: null == profissoesRelacionadas ? _self._profissoesRelacionadas : profissoesRelacionadas // ignore: cast_nullable_to_non_nullable
as List<String>,duracao: freezed == duracao ? _self.duracao : duracao // ignore: cast_nullable_to_non_nullable
as String?,requisitosMinimos: freezed == requisitosMinimos ? _self.requisitosMinimos : requisitosMinimos // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
