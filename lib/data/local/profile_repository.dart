import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/student_profile.dart';
import 'database_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository(this._db);

  final DatabaseHelper _db;

  Future<void> saveProfile(StudentProfile profile) async {
    final db = await _db.database;
    await db.insert(
      'student_profiles',
      _toMap(profile),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<StudentProfile?> getProfile(String uid) async {
    final db = await _db.database;
    final result = await db.query(
      'student_profiles',
      where: 'uid = ?',
      whereArgs: [uid],
      limit: 1,
    );
    if (result.isEmpty) return null;
    return _fromMap(result.first);
  }

  Future<void> deleteProfile(String uid) async {
    final db = await _db.database;
    await db.delete('student_profiles', where: 'uid = ?', whereArgs: [uid]);
  }

  Map<String, dynamic> _toMap(StudentProfile p) => {
    'uid': p.uid,
    'nome': p.nome,
    'email': p.email,
    'data_nascimento': p.dataNascimento?.toIso8601String(),
    'genero': p.genero?.name,
    'provincia': p.provincia,
    'escola': p.escola,
    'classe': p.classe?.name,
    'area_estudo': p.areaEstudo?.name,
    'interesses': jsonEncode(p.interesses),
    'onboarding_completo': p.onboardingCompleto ? 1 : 0,
    'criado_em': p.criadoEm?.toIso8601String(),
  };

  StudentProfile _fromMap(Map<String, dynamic> m) => StudentProfile(
    uid: m['uid'] as String,
    nome: m['nome'] as String,
    email: m['email'] as String,
    dataNascimento: m['data_nascimento'] != null
        ? DateTime.parse(m['data_nascimento'] as String)
        : null,
    genero: m['genero'] != null
        ? Genero.values.byName(m['genero'] as String)
        : null,
    provincia: m['provincia'] as String?,
    escola: m['escola'] as String?,
    classe: m['classe'] != null
        ? Classe.values.byName(m['classe'] as String)
        : null,
    areaEstudo: m['area_estudo'] != null
        ? AreaEstudo.values.byName(m['area_estudo'] as String)
        : null,
    interesses: m['interesses'] != null
        ? List<String>.from(jsonDecode(m['interesses'] as String))
        : [],
    onboardingCompleto: (m['onboarding_completo'] as int) == 1,
    criadoEm: m['criado_em'] != null
        ? DateTime.parse(m['criado_em'] as String)
        : null,
  );
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(databaseHelperProvider));
}
