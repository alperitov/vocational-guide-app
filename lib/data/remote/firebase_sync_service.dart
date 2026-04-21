import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../local/profile_repository.dart';
import '../local/database_helper.dart';
import '../models/student_profile.dart';
import '../models/quiz_models.dart';

part 'firebase_sync_service.g.dart';

class FirebaseSyncService {
  FirebaseSyncService(this._firestore, this._profileRepo);

  final FirebaseFirestore _firestore;
  final ProfileRepository _profileRepo;

  // ── Perfil ──────────────────────────────────────────────

  Future<void> syncProfile(StudentProfile profile) async {
    try {
      await _firestore
          .collection('users')
          .doc(profile.uid)
          .set(_profileToMap(profile), SetOptions(merge: true));
    } catch (_) {
      // Falha silenciosa — SQLite já guardou
    }
  }

  Future<void> pullProfile(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) return;

      final remote = _profileFromMap(doc.data()!, uid);
      await _profileRepo.saveProfile(remote);
    } catch (_) {}
  }

  // ── Sessões do Quiz ──────────────────────────────────────

  Future<void> syncSession(QuizSession session) async {
    try {
      await _firestore
          .collection('users')
          .doc(session.userId)
          .collection('quiz_sessions')
          .doc(session.id)
          .set(_sessionToMap(session));
    } catch (_) {}
  }

  Future<void> pullSessions(String uid, Function(QuizSession) onSession) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('quiz_sessions')
          .where('completado_em', isNull: false)
          .orderBy('completado_em', descending: true)
          .get();

      for (final doc in snapshot.docs) {
        final session = _sessionFromMap(doc.data(), doc.id);
        onSession(session);
      }
    } catch (_) {}
  }

  Future<void> _syncSessionToLocal(QuizSession session) async {
    try {
      final localDb = await _profileRepo;
    } catch (_) {}
  }

  // ── Serialização do Perfil ───────────────────────────────

  Map<String, dynamic> _profileToMap(StudentProfile p) => {
    'uid': p.uid,
    'nome': p.nome,
    'email': p.email,
    'data_nascimento': p.dataNascimento?.toIso8601String(),
    'genero': p.genero?.name,
    'provincia': p.provincia,
    'escola': p.escola,
    'classe': p.classe?.name,
    'area_estudo': p.areaEstudo?.name,
    'interesses': p.interesses,
    'onboarding_completo': p.onboardingCompleto,
    'criado_em': p.criadoEm?.toIso8601String(),
    'updated_at': FieldValue.serverTimestamp(),
  };

  StudentProfile _profileFromMap(Map<String, dynamic> m, String uid) =>
      StudentProfile(
        uid: uid,
        nome: m['nome'] as String? ?? '',
        email: m['email'] as String? ?? '',
        dataNascimento: m['data_nascimento'] != null
            ? DateTime.tryParse(m['data_nascimento'] as String)
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
            ? List<String>.from(m['interesses'] as List)
            : [],
        onboardingCompleto: m['onboarding_completo'] as bool? ?? false,
        criadoEm: m['criado_em'] != null
            ? DateTime.tryParse(m['criado_em'] as String)
            : null,
      );

  // ── Serialização da Sessão ───────────────────────────────

  Map<String, dynamic> _sessionToMap(QuizSession s) => {
    'id': s.id,
    'user_id': s.userId,
    'iniciado_em': s.iniciadoEm.toIso8601String(),
    'completado_em': s.completadoEm?.toIso8601String(),
    'respostas': s.respostas,
    'resultados': s.resultados,
    'updated_at': FieldValue.serverTimestamp(),
  };

  QuizSession _sessionFromMap(Map<String, dynamic> m, String id) => QuizSession(
    id: id,
    userId: m['user_id'] as String,
    iniciadoEm: DateTime.parse(m['iniciado_em'] as String),
    completadoEm: m['completado_em'] != null
        ? DateTime.tryParse(m['completado_em'] as String)
        : null,
    respostas: m['respostas'] != null
        ? Map<String, int>.from(m['respostas'] as Map)
        : {},
    resultados: m['resultados'] != null
        ? Map<String, double>.from(
            (m['resultados'] as Map).map(
              (k, v) => MapEntry(k, (v as num).toDouble()),
            ),
          )
        : {},
  );
}

@Riverpod(keepAlive: true)
FirebaseSyncService firebaseSyncService(Ref ref) {
  return FirebaseSyncService(
    FirebaseFirestore.instance,
    ref.watch(profileRepositoryProvider),
  );
}
