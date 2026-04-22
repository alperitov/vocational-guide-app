// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudentProfile _$StudentProfileFromJson(Map<String, dynamic> json) =>
    _StudentProfile(
      uid: json['uid'] as String,
      nome: json['nome'] as String,
      email: json['email'] as String,
      dataNascimento: json['dataNascimento'] == null
          ? null
          : DateTime.parse(json['dataNascimento'] as String),
      genero: $enumDecodeNullable(_$GeneroEnumMap, json['genero']),
      provincia: json['provincia'] as String?,
      escola: json['escola'] as String?,
      classe: $enumDecodeNullable(_$ClasseEnumMap, json['classe']),
      areaEstudo: $enumDecodeNullable(_$AreaEstudoEnumMap, json['areaEstudo']),
      interesses:
          (json['interesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      onboardingCompleto: json['onboardingCompleto'] as bool? ?? false,
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
    );

Map<String, dynamic> _$StudentProfileToJson(_StudentProfile instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nome': instance.nome,
      'email': instance.email,
      'dataNascimento': instance.dataNascimento?.toIso8601String(),
      'genero': _$GeneroEnumMap[instance.genero],
      'provincia': instance.provincia,
      'escola': instance.escola,
      'classe': _$ClasseEnumMap[instance.classe],
      'areaEstudo': _$AreaEstudoEnumMap[instance.areaEstudo],
      'interesses': instance.interesses,
      'onboardingCompleto': instance.onboardingCompleto,
      'criadoEm': instance.criadoEm?.toIso8601String(),
    };

const _$GeneroEnumMap = {
  Genero.masculino: 'masculino',
  Genero.feminino: 'feminino',
  Genero.prefiroNaoDizer: 'prefiroNaoDizer',
};

const _$ClasseEnumMap = {
  Classe.oitava: 'oitava',
  Classe.nona: 'nona',
  Classe.decima: 'decima',
  Classe.decimaPrimeira: 'decimaPrimeira',
  Classe.decimaSegunda: 'decimaSegunda',
};

const _$AreaEstudoEnumMap = {
  AreaEstudo.ciencias: 'ciencias',
  AreaEstudo.letras: 'letras',
  AreaEstudo.artes: 'artes',
  AreaEstudo.comercial: 'comercial',
  AreaEstudo.outro: 'outro',
};
