import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_profile.freezed.dart';
part 'student_profile.g.dart';

enum Genero { masculino, feminino, prefiroNaoDizer }

enum Classe { oitava, nona, decima, decimaPrimeira, decimaSegunda }

enum AreaEstudo { ciencias, letras, artes, comercial, outro }

@freezed
sealed class StudentProfile with _$StudentProfile {
  const factory StudentProfile({
    required String uid,
    required String nome,
    required String email,
    DateTime? dataNascimento,
    Genero? genero,
    String? provincia,
    String? escola,
    Classe? classe,
    AreaEstudo? areaEstudo,
    @Default([]) List<String> interesses,
    @Default(false) bool onboardingCompleto,
    DateTime? criadoEm,
  }) = _StudentProfile;

  factory StudentProfile.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileFromJson(json);
}
