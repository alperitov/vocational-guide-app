// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Institution {

 String get id; String get acronym;// Ex: UEM, ISUTC, UP
 String get name; InstitutionType get type; Province get province; String? get website; String? get logoUrl;
/// Create a copy of Institution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstitutionCopyWith<Institution> get copyWith => _$InstitutionCopyWithImpl<Institution>(this as Institution, _$identity);

  /// Serializes this Institution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Institution&&(identical(other.id, id) || other.id == id)&&(identical(other.acronym, acronym) || other.acronym == acronym)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.province, province) || other.province == province)&&(identical(other.website, website) || other.website == website)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,acronym,name,type,province,website,logoUrl);

@override
String toString() {
  return 'Institution(id: $id, acronym: $acronym, name: $name, type: $type, province: $province, website: $website, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $InstitutionCopyWith<$Res>  {
  factory $InstitutionCopyWith(Institution value, $Res Function(Institution) _then) = _$InstitutionCopyWithImpl;
@useResult
$Res call({
 String id, String acronym, String name, InstitutionType type, Province province, String? website, String? logoUrl
});




}
/// @nodoc
class _$InstitutionCopyWithImpl<$Res>
    implements $InstitutionCopyWith<$Res> {
  _$InstitutionCopyWithImpl(this._self, this._then);

  final Institution _self;
  final $Res Function(Institution) _then;

/// Create a copy of Institution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? acronym = null,Object? name = null,Object? type = null,Object? province = null,Object? website = freezed,Object? logoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,acronym: null == acronym ? _self.acronym : acronym // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InstitutionType,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as Province,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Institution].
extension InstitutionPatterns on Institution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Institution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Institution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Institution value)  $default,){
final _that = this;
switch (_that) {
case _Institution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Institution value)?  $default,){
final _that = this;
switch (_that) {
case _Institution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String acronym,  String name,  InstitutionType type,  Province province,  String? website,  String? logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Institution() when $default != null:
return $default(_that.id,_that.acronym,_that.name,_that.type,_that.province,_that.website,_that.logoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String acronym,  String name,  InstitutionType type,  Province province,  String? website,  String? logoUrl)  $default,) {final _that = this;
switch (_that) {
case _Institution():
return $default(_that.id,_that.acronym,_that.name,_that.type,_that.province,_that.website,_that.logoUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String acronym,  String name,  InstitutionType type,  Province province,  String? website,  String? logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _Institution() when $default != null:
return $default(_that.id,_that.acronym,_that.name,_that.type,_that.province,_that.website,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Institution implements Institution {
  const _Institution({required this.id, required this.acronym, required this.name, required this.type, required this.province, this.website, this.logoUrl});
  factory _Institution.fromJson(Map<String, dynamic> json) => _$InstitutionFromJson(json);

@override final  String id;
@override final  String acronym;
// Ex: UEM, ISUTC, UP
@override final  String name;
@override final  InstitutionType type;
@override final  Province province;
@override final  String? website;
@override final  String? logoUrl;

/// Create a copy of Institution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstitutionCopyWith<_Institution> get copyWith => __$InstitutionCopyWithImpl<_Institution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstitutionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Institution&&(identical(other.id, id) || other.id == id)&&(identical(other.acronym, acronym) || other.acronym == acronym)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.province, province) || other.province == province)&&(identical(other.website, website) || other.website == website)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,acronym,name,type,province,website,logoUrl);

@override
String toString() {
  return 'Institution(id: $id, acronym: $acronym, name: $name, type: $type, province: $province, website: $website, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$InstitutionCopyWith<$Res> implements $InstitutionCopyWith<$Res> {
  factory _$InstitutionCopyWith(_Institution value, $Res Function(_Institution) _then) = __$InstitutionCopyWithImpl;
@override @useResult
$Res call({
 String id, String acronym, String name, InstitutionType type, Province province, String? website, String? logoUrl
});




}
/// @nodoc
class __$InstitutionCopyWithImpl<$Res>
    implements _$InstitutionCopyWith<$Res> {
  __$InstitutionCopyWithImpl(this._self, this._then);

  final _Institution _self;
  final $Res Function(_Institution) _then;

/// Create a copy of Institution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? acronym = null,Object? name = null,Object? type = null,Object? province = null,Object? website = freezed,Object? logoUrl = freezed,}) {
  return _then(_Institution(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,acronym: null == acronym ? _self.acronym : acronym // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InstitutionType,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as Province,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
