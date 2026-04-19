// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizQuestion {

 String get id; String get texto; RiasecDimension get dimensao;
/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionCopyWith<QuizQuestion> get copyWith => _$QuizQuestionCopyWithImpl<QuizQuestion>(this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.dimensao, dimensao) || other.dimensao == dimensao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,texto,dimensao);

@override
String toString() {
  return 'QuizQuestion(id: $id, texto: $texto, dimensao: $dimensao)';
}


}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res>  {
  factory $QuizQuestionCopyWith(QuizQuestion value, $Res Function(QuizQuestion) _then) = _$QuizQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String texto, RiasecDimension dimensao
});




}
/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? texto = null,Object? dimensao = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,dimensao: null == dimensao ? _self.dimensao : dimensao // ignore: cast_nullable_to_non_nullable
as RiasecDimension,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestion].
extension QuizQuestionPatterns on QuizQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String texto,  RiasecDimension dimensao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.texto,_that.dimensao);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String texto,  RiasecDimension dimensao)  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that.id,_that.texto,_that.dimensao);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String texto,  RiasecDimension dimensao)?  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.texto,_that.dimensao);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion({required this.id, required this.texto, required this.dimensao});
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

@override final  String id;
@override final  String texto;
@override final  RiasecDimension dimensao;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQuestionCopyWith<_QuizQuestion> get copyWith => __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.dimensao, dimensao) || other.dimensao == dimensao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,texto,dimensao);

@override
String toString() {
  return 'QuizQuestion(id: $id, texto: $texto, dimensao: $dimensao)';
}


}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res> implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(_QuizQuestion value, $Res Function(_QuizQuestion) _then) = __$QuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String texto, RiasecDimension dimensao
});




}
/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? texto = null,Object? dimensao = null,}) {
  return _then(_QuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,dimensao: null == dimensao ? _self.dimensao : dimensao // ignore: cast_nullable_to_non_nullable
as RiasecDimension,
  ));
}


}


/// @nodoc
mixin _$QuizSession {

 String get id; String get userId; DateTime get iniciadoEm; DateTime? get completadoEm; Map<String, int> get respostas; Map<String, double> get resultados;
/// Create a copy of QuizSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizSessionCopyWith<QuizSession> get copyWith => _$QuizSessionCopyWithImpl<QuizSession>(this as QuizSession, _$identity);

  /// Serializes this QuizSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.iniciadoEm, iniciadoEm) || other.iniciadoEm == iniciadoEm)&&(identical(other.completadoEm, completadoEm) || other.completadoEm == completadoEm)&&const DeepCollectionEquality().equals(other.respostas, respostas)&&const DeepCollectionEquality().equals(other.resultados, resultados));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,iniciadoEm,completadoEm,const DeepCollectionEquality().hash(respostas),const DeepCollectionEquality().hash(resultados));

@override
String toString() {
  return 'QuizSession(id: $id, userId: $userId, iniciadoEm: $iniciadoEm, completadoEm: $completadoEm, respostas: $respostas, resultados: $resultados)';
}


}

/// @nodoc
abstract mixin class $QuizSessionCopyWith<$Res>  {
  factory $QuizSessionCopyWith(QuizSession value, $Res Function(QuizSession) _then) = _$QuizSessionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime iniciadoEm, DateTime? completadoEm, Map<String, int> respostas, Map<String, double> resultados
});




}
/// @nodoc
class _$QuizSessionCopyWithImpl<$Res>
    implements $QuizSessionCopyWith<$Res> {
  _$QuizSessionCopyWithImpl(this._self, this._then);

  final QuizSession _self;
  final $Res Function(QuizSession) _then;

/// Create a copy of QuizSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? iniciadoEm = null,Object? completadoEm = freezed,Object? respostas = null,Object? resultados = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,iniciadoEm: null == iniciadoEm ? _self.iniciadoEm : iniciadoEm // ignore: cast_nullable_to_non_nullable
as DateTime,completadoEm: freezed == completadoEm ? _self.completadoEm : completadoEm // ignore: cast_nullable_to_non_nullable
as DateTime?,respostas: null == respostas ? _self.respostas : respostas // ignore: cast_nullable_to_non_nullable
as Map<String, int>,resultados: null == resultados ? _self.resultados : resultados // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizSession].
extension QuizSessionPatterns on QuizSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizSession value)  $default,){
final _that = this;
switch (_that) {
case _QuizSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizSession value)?  $default,){
final _that = this;
switch (_that) {
case _QuizSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime iniciadoEm,  DateTime? completadoEm,  Map<String, int> respostas,  Map<String, double> resultados)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizSession() when $default != null:
return $default(_that.id,_that.userId,_that.iniciadoEm,_that.completadoEm,_that.respostas,_that.resultados);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime iniciadoEm,  DateTime? completadoEm,  Map<String, int> respostas,  Map<String, double> resultados)  $default,) {final _that = this;
switch (_that) {
case _QuizSession():
return $default(_that.id,_that.userId,_that.iniciadoEm,_that.completadoEm,_that.respostas,_that.resultados);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DateTime iniciadoEm,  DateTime? completadoEm,  Map<String, int> respostas,  Map<String, double> resultados)?  $default,) {final _that = this;
switch (_that) {
case _QuizSession() when $default != null:
return $default(_that.id,_that.userId,_that.iniciadoEm,_that.completadoEm,_that.respostas,_that.resultados);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizSession implements QuizSession {
  const _QuizSession({required this.id, required this.userId, required this.iniciadoEm, this.completadoEm, final  Map<String, int> respostas = const {}, final  Map<String, double> resultados = const {}}): _respostas = respostas,_resultados = resultados;
  factory _QuizSession.fromJson(Map<String, dynamic> json) => _$QuizSessionFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DateTime iniciadoEm;
@override final  DateTime? completadoEm;
 final  Map<String, int> _respostas;
@override@JsonKey() Map<String, int> get respostas {
  if (_respostas is EqualUnmodifiableMapView) return _respostas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respostas);
}

 final  Map<String, double> _resultados;
@override@JsonKey() Map<String, double> get resultados {
  if (_resultados is EqualUnmodifiableMapView) return _resultados;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_resultados);
}


/// Create a copy of QuizSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizSessionCopyWith<_QuizSession> get copyWith => __$QuizSessionCopyWithImpl<_QuizSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.iniciadoEm, iniciadoEm) || other.iniciadoEm == iniciadoEm)&&(identical(other.completadoEm, completadoEm) || other.completadoEm == completadoEm)&&const DeepCollectionEquality().equals(other._respostas, _respostas)&&const DeepCollectionEquality().equals(other._resultados, _resultados));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,iniciadoEm,completadoEm,const DeepCollectionEquality().hash(_respostas),const DeepCollectionEquality().hash(_resultados));

@override
String toString() {
  return 'QuizSession(id: $id, userId: $userId, iniciadoEm: $iniciadoEm, completadoEm: $completadoEm, respostas: $respostas, resultados: $resultados)';
}


}

/// @nodoc
abstract mixin class _$QuizSessionCopyWith<$Res> implements $QuizSessionCopyWith<$Res> {
  factory _$QuizSessionCopyWith(_QuizSession value, $Res Function(_QuizSession) _then) = __$QuizSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime iniciadoEm, DateTime? completadoEm, Map<String, int> respostas, Map<String, double> resultados
});




}
/// @nodoc
class __$QuizSessionCopyWithImpl<$Res>
    implements _$QuizSessionCopyWith<$Res> {
  __$QuizSessionCopyWithImpl(this._self, this._then);

  final _QuizSession _self;
  final $Res Function(_QuizSession) _then;

/// Create a copy of QuizSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? iniciadoEm = null,Object? completadoEm = freezed,Object? respostas = null,Object? resultados = null,}) {
  return _then(_QuizSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,iniciadoEm: null == iniciadoEm ? _self.iniciadoEm : iniciadoEm // ignore: cast_nullable_to_non_nullable
as DateTime,completadoEm: freezed == completadoEm ? _self.completadoEm : completadoEm // ignore: cast_nullable_to_non_nullable
as DateTime?,respostas: null == respostas ? _self._respostas : respostas // ignore: cast_nullable_to_non_nullable
as Map<String, int>,resultados: null == resultados ? _self._resultados : resultados // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
