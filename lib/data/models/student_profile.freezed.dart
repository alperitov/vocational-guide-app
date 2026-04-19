// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentProfile {

 String get uid; String get nome; String get email; DateTime? get dataNascimento; Genero? get genero; String? get provincia; String? get escola; Classe? get classe; AreaEstudo? get areaEstudo; List<String> get interesses; bool get onboardingCompleto; DateTime? get criadoEm;
/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentProfileCopyWith<StudentProfile> get copyWith => _$StudentProfileCopyWithImpl<StudentProfile>(this as StudentProfile, _$identity);

  /// Serializes this StudentProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.email, email) || other.email == email)&&(identical(other.dataNascimento, dataNascimento) || other.dataNascimento == dataNascimento)&&(identical(other.genero, genero) || other.genero == genero)&&(identical(other.provincia, provincia) || other.provincia == provincia)&&(identical(other.escola, escola) || other.escola == escola)&&(identical(other.classe, classe) || other.classe == classe)&&(identical(other.areaEstudo, areaEstudo) || other.areaEstudo == areaEstudo)&&const DeepCollectionEquality().equals(other.interesses, interesses)&&(identical(other.onboardingCompleto, onboardingCompleto) || other.onboardingCompleto == onboardingCompleto)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,nome,email,dataNascimento,genero,provincia,escola,classe,areaEstudo,const DeepCollectionEquality().hash(interesses),onboardingCompleto,criadoEm);

@override
String toString() {
  return 'StudentProfile(uid: $uid, nome: $nome, email: $email, dataNascimento: $dataNascimento, genero: $genero, provincia: $provincia, escola: $escola, classe: $classe, areaEstudo: $areaEstudo, interesses: $interesses, onboardingCompleto: $onboardingCompleto, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class $StudentProfileCopyWith<$Res>  {
  factory $StudentProfileCopyWith(StudentProfile value, $Res Function(StudentProfile) _then) = _$StudentProfileCopyWithImpl;
@useResult
$Res call({
 String uid, String nome, String email, DateTime? dataNascimento, Genero? genero, String? provincia, String? escola, Classe? classe, AreaEstudo? areaEstudo, List<String> interesses, bool onboardingCompleto, DateTime? criadoEm
});




}
/// @nodoc
class _$StudentProfileCopyWithImpl<$Res>
    implements $StudentProfileCopyWith<$Res> {
  _$StudentProfileCopyWithImpl(this._self, this._then);

  final StudentProfile _self;
  final $Res Function(StudentProfile) _then;

/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? nome = null,Object? email = null,Object? dataNascimento = freezed,Object? genero = freezed,Object? provincia = freezed,Object? escola = freezed,Object? classe = freezed,Object? areaEstudo = freezed,Object? interesses = null,Object? onboardingCompleto = null,Object? criadoEm = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dataNascimento: freezed == dataNascimento ? _self.dataNascimento : dataNascimento // ignore: cast_nullable_to_non_nullable
as DateTime?,genero: freezed == genero ? _self.genero : genero // ignore: cast_nullable_to_non_nullable
as Genero?,provincia: freezed == provincia ? _self.provincia : provincia // ignore: cast_nullable_to_non_nullable
as String?,escola: freezed == escola ? _self.escola : escola // ignore: cast_nullable_to_non_nullable
as String?,classe: freezed == classe ? _self.classe : classe // ignore: cast_nullable_to_non_nullable
as Classe?,areaEstudo: freezed == areaEstudo ? _self.areaEstudo : areaEstudo // ignore: cast_nullable_to_non_nullable
as AreaEstudo?,interesses: null == interesses ? _self.interesses : interesses // ignore: cast_nullable_to_non_nullable
as List<String>,onboardingCompleto: null == onboardingCompleto ? _self.onboardingCompleto : onboardingCompleto // ignore: cast_nullable_to_non_nullable
as bool,criadoEm: freezed == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentProfile].
extension StudentProfilePatterns on StudentProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentProfile value)  $default,){
final _that = this;
switch (_that) {
case _StudentProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentProfile value)?  $default,){
final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String nome,  String email,  DateTime? dataNascimento,  Genero? genero,  String? provincia,  String? escola,  Classe? classe,  AreaEstudo? areaEstudo,  List<String> interesses,  bool onboardingCompleto,  DateTime? criadoEm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
return $default(_that.uid,_that.nome,_that.email,_that.dataNascimento,_that.genero,_that.provincia,_that.escola,_that.classe,_that.areaEstudo,_that.interesses,_that.onboardingCompleto,_that.criadoEm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String nome,  String email,  DateTime? dataNascimento,  Genero? genero,  String? provincia,  String? escola,  Classe? classe,  AreaEstudo? areaEstudo,  List<String> interesses,  bool onboardingCompleto,  DateTime? criadoEm)  $default,) {final _that = this;
switch (_that) {
case _StudentProfile():
return $default(_that.uid,_that.nome,_that.email,_that.dataNascimento,_that.genero,_that.provincia,_that.escola,_that.classe,_that.areaEstudo,_that.interesses,_that.onboardingCompleto,_that.criadoEm);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String nome,  String email,  DateTime? dataNascimento,  Genero? genero,  String? provincia,  String? escola,  Classe? classe,  AreaEstudo? areaEstudo,  List<String> interesses,  bool onboardingCompleto,  DateTime? criadoEm)?  $default,) {final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
return $default(_that.uid,_that.nome,_that.email,_that.dataNascimento,_that.genero,_that.provincia,_that.escola,_that.classe,_that.areaEstudo,_that.interesses,_that.onboardingCompleto,_that.criadoEm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentProfile implements StudentProfile {
  const _StudentProfile({required this.uid, required this.nome, required this.email, this.dataNascimento, this.genero, this.provincia, this.escola, this.classe, this.areaEstudo, final  List<String> interesses = const [], this.onboardingCompleto = false, this.criadoEm}): _interesses = interesses;
  factory _StudentProfile.fromJson(Map<String, dynamic> json) => _$StudentProfileFromJson(json);

@override final  String uid;
@override final  String nome;
@override final  String email;
@override final  DateTime? dataNascimento;
@override final  Genero? genero;
@override final  String? provincia;
@override final  String? escola;
@override final  Classe? classe;
@override final  AreaEstudo? areaEstudo;
 final  List<String> _interesses;
@override@JsonKey() List<String> get interesses {
  if (_interesses is EqualUnmodifiableListView) return _interesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interesses);
}

@override@JsonKey() final  bool onboardingCompleto;
@override final  DateTime? criadoEm;

/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentProfileCopyWith<_StudentProfile> get copyWith => __$StudentProfileCopyWithImpl<_StudentProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.email, email) || other.email == email)&&(identical(other.dataNascimento, dataNascimento) || other.dataNascimento == dataNascimento)&&(identical(other.genero, genero) || other.genero == genero)&&(identical(other.provincia, provincia) || other.provincia == provincia)&&(identical(other.escola, escola) || other.escola == escola)&&(identical(other.classe, classe) || other.classe == classe)&&(identical(other.areaEstudo, areaEstudo) || other.areaEstudo == areaEstudo)&&const DeepCollectionEquality().equals(other._interesses, _interesses)&&(identical(other.onboardingCompleto, onboardingCompleto) || other.onboardingCompleto == onboardingCompleto)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,nome,email,dataNascimento,genero,provincia,escola,classe,areaEstudo,const DeepCollectionEquality().hash(_interesses),onboardingCompleto,criadoEm);

@override
String toString() {
  return 'StudentProfile(uid: $uid, nome: $nome, email: $email, dataNascimento: $dataNascimento, genero: $genero, provincia: $provincia, escola: $escola, classe: $classe, areaEstudo: $areaEstudo, interesses: $interesses, onboardingCompleto: $onboardingCompleto, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class _$StudentProfileCopyWith<$Res> implements $StudentProfileCopyWith<$Res> {
  factory _$StudentProfileCopyWith(_StudentProfile value, $Res Function(_StudentProfile) _then) = __$StudentProfileCopyWithImpl;
@override @useResult
$Res call({
 String uid, String nome, String email, DateTime? dataNascimento, Genero? genero, String? provincia, String? escola, Classe? classe, AreaEstudo? areaEstudo, List<String> interesses, bool onboardingCompleto, DateTime? criadoEm
});




}
/// @nodoc
class __$StudentProfileCopyWithImpl<$Res>
    implements _$StudentProfileCopyWith<$Res> {
  __$StudentProfileCopyWithImpl(this._self, this._then);

  final _StudentProfile _self;
  final $Res Function(_StudentProfile) _then;

/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? nome = null,Object? email = null,Object? dataNascimento = freezed,Object? genero = freezed,Object? provincia = freezed,Object? escola = freezed,Object? classe = freezed,Object? areaEstudo = freezed,Object? interesses = null,Object? onboardingCompleto = null,Object? criadoEm = freezed,}) {
  return _then(_StudentProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dataNascimento: freezed == dataNascimento ? _self.dataNascimento : dataNascimento // ignore: cast_nullable_to_non_nullable
as DateTime?,genero: freezed == genero ? _self.genero : genero // ignore: cast_nullable_to_non_nullable
as Genero?,provincia: freezed == provincia ? _self.provincia : provincia // ignore: cast_nullable_to_non_nullable
as String?,escola: freezed == escola ? _self.escola : escola // ignore: cast_nullable_to_non_nullable
as String?,classe: freezed == classe ? _self.classe : classe // ignore: cast_nullable_to_non_nullable
as Classe?,areaEstudo: freezed == areaEstudo ? _self.areaEstudo : areaEstudo // ignore: cast_nullable_to_non_nullable
as AreaEstudo?,interesses: null == interesses ? _self._interesses : interesses // ignore: cast_nullable_to_non_nullable
as List<String>,onboardingCompleto: null == onboardingCompleto ? _self.onboardingCompleto : onboardingCompleto // ignore: cast_nullable_to_non_nullable
as bool,criadoEm: freezed == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
