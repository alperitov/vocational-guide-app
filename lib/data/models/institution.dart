import 'package:freezed_annotation/freezed_annotation.dart';

part 'institution.freezed.dart';
part 'institution.g.dart';

enum InstitutionType { publica, privada }

enum Province {
  maputoCidade,
  maputoProvincia,
  gaza,
  inhambane,
  sofala,
  manica,
  tete,
  zambezia,
  nampula,
  niassa,
  caboDelgado,
}

@freezed
sealed class Institution with _$Institution {
  const factory Institution({
    required String id,
    required String acronym, // Ex: UEM, ISUTC, UP
    required String name,
    required InstitutionType type,
    required Province province,
    String? website,
    String? logoUrl,
  }) = _Institution;

  factory Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);
}
