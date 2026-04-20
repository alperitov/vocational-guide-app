import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../../data/local/database_helper.dart';
import '../../../data/models/quiz_models.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  QuizRepository(this._db);
  final DatabaseHelper _db;

  Future<QuizSession> createSession(String userId) async {
    final session = QuizSession(
      id: const Uuid().v4(),
      userId: userId,
      iniciadoEm: DateTime.now(),
    );
    final db = await _db.database;
    await db.insert('quiz_sessions', _toMap(session));
    return session;
  }

  Future<void> deleteSession(String sessionId) async {
    final db = await _db.database;
    await db.delete('quiz_sessions', where: 'id = ?', whereArgs: [sessionId]);
  }

  Future<void> deleteAllSessions(String userId) async {
    final db = await _db.database;
    await db.delete('quiz_sessions', where: 'user_id = ?', whereArgs: [userId]);
  }

  Future<void> saveSession(QuizSession session) async {
    final db = await _db.database;
    await db.update(
      'quiz_sessions',
      _toMap(session),
      where: 'id = ?',
      whereArgs: [session.id],
    );
  }

  Future<List<QuizSession>> getSessionsByUser(String userId) async {
    final db = await _db.database;
    final result = await db.query(
      'quiz_sessions',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'iniciado_em DESC',
    );
    return result.map(_fromMap).toList();
  }

  Future<QuizSession?> getLatestSession(String userId) async {
    final sessions = await getSessionsByUser(userId);
    return sessions.isEmpty ? null : sessions.first;
  }

  Map<String, dynamic> _toMap(QuizSession s) => {
    'id': s.id,
    'user_id': s.userId,
    'iniciado_em': s.iniciadoEm.toIso8601String(),
    'completado_em': s.completadoEm?.toIso8601String(),
    'respostas': jsonEncode(s.respostas),
    'resultados': jsonEncode(s.resultados),
  };

  QuizSession _fromMap(Map<String, dynamic> m) => QuizSession(
    id: m['id'] as String,
    userId: m['user_id'] as String,
    iniciadoEm: DateTime.parse(m['iniciado_em'] as String),
    completadoEm: m['completado_em'] != null
        ? DateTime.parse(m['completado_em'] as String)
        : null,
    respostas: Map<String, int>.from(
      jsonDecode(m['respostas'] as String) as Map,
    ),
    resultados: Map<String, double>.from(
      jsonDecode(m['resultados'] as String) as Map,
    ),
  );
}

@Riverpod(keepAlive: true)
QuizRepository quizRepository(Ref ref) =>
    QuizRepository(ref.watch(databaseHelperProvider));
