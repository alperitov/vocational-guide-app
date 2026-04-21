import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/auth_repository.dart';
import '../../../data/remote/firebase_sync_service.dart';

part 'auth_providers.g.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthStatus build() {
    // Observa mudanças de autenticação reactivamente
    ref.listen(authStateChangesProvider, (_, next) {
      next.whenData((user) {
        state = user != null
            ? AuthStatus.authenticated
            : AuthStatus.unauthenticated;
      });
    });
    return AuthStatus.initial;
  }

  Future<String?> registerWithEmail({
    required String email,
    required String password,
  }) async {
    state = AuthStatus.loading;
    try {
      await ref
          .read(authRepositoryProvider)
          .registerWithEmail(email: email, password: password);
      state = AuthStatus.authenticated;
      return null; // null = sucesso
    } on FirebaseAuthException catch (e) {
      state = AuthStatus.error;
      return _mapFirebaseError(e.code);
    }
  }

  Future<String?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    state = AuthStatus.loading;
    try {
      final credential = await ref
          .read(authRepositoryProvider)
          .loginWithEmail(email: email, password: password);
      // Puxa dados do Firebase após login
      final uid = credential.user?.uid;
      if (uid != null) {
        ref.read(firebaseSyncServiceProvider).pullProfile(uid);
      }
      state = AuthStatus.authenticated;
      return null;
    } on FirebaseAuthException catch (e) {
      state = AuthStatus.error;
      return _mapFirebaseError(e.code);
    }
  }

  Future<String?> loginWithGoogle() async {
    state = AuthStatus.loading;
    try {
      final result = await ref.read(authRepositoryProvider).loginWithGoogle();
      if (result == null) {
        state = AuthStatus.unauthenticated;
        return null;
      }
      // Puxa dados do Firebase após login
      final uid = result.user?.uid;
      if (uid != null) {
        ref.read(firebaseSyncServiceProvider).pullProfile(uid);
      }
      state = AuthStatus.authenticated;
      return null;
    } on FirebaseAuthException catch (e) {
      state = AuthStatus.error;
      return _mapFirebaseError(e.code);
    }
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = AuthStatus.unauthenticated;
  }

  // Traduz códigos de erro do Firebase para português
  String _mapFirebaseError(String code) {
    return switch (code) {
      'user-not-found' => 'Utilizador não encontrado.',
      'wrong-password' => 'Password incorrecta.',
      'email-already-in-use' => 'Este email já está em uso.',
      'weak-password' => 'A password é muito fraca.',
      'invalid-email' => 'Email inválido.',
      'user-disabled' => 'Esta conta foi desactivada.',
      'too-many-requests' => 'Muitas tentativas. Tenta mais tarde.',
      'network-request-failed' => 'Sem conexão à internet.',
      _ => 'Ocorreu um erro. Tenta novamente.',
    };
  }
}
