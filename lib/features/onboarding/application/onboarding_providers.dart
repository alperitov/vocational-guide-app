import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/student_profile.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../data/local/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/remote/firebase_sync_service.dart';

part 'onboarding_providers.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  StudentProfile build() {
    final user = ref.read(authRepositoryProvider).currentUser;
    // Recarrega o utilizador para garantir que o displayName está actualizado
    user?.reload();
    return StudentProfile(
      uid: user?.uid ?? '',
      nome: user?.displayName ?? '',
      email: user?.email ?? '',
      criadoEm: DateTime.now(),
    );
  }

  void updateNome(String nome) => state = state.copyWith(nome: nome);
  void updateDataNascimento(DateTime data) =>
      state = state.copyWith(dataNascimento: data);
  void updateGenero(Genero genero) => state = state.copyWith(genero: genero);
  void updateProvincia(String provincia) =>
      state = state.copyWith(provincia: provincia);
  void updateEscola(String escola) => state = state.copyWith(escola: escola);
  void updateClasse(Classe classe) => state = state.copyWith(classe: classe);
  void updateAreaEstudo(AreaEstudo area) =>
      state = state.copyWith(areaEstudo: area);

  void toggleInteresse(String interesse) {
    final lista = List<String>.from(state.interesses);
    lista.contains(interesse) ? lista.remove(interesse) : lista.add(interesse);
    state = state.copyWith(interesses: lista);
  }

  Future<void> guardarPerfil() async {
    final perfil = state.copyWith(
      onboardingCompleto: true,
      criadoEm: state.criadoEm ?? DateTime.now(),
    );
    state = perfil;
    // Guarda localmente
    await ref.read(profileRepositoryProvider).saveProfile(perfil);
    // Sincroniza com Firebase em background
    ref.read(firebaseSyncServiceProvider).syncProfile(perfil);
  }
}

// Provider para verificar se o onboarding está completo
@riverpod
Future<bool> onboardingCompleto(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return false;
  final profile = await ref
      .read(profileRepositoryProvider)
      .getProfile(user.uid);
  return profile?.onboardingCompleto ?? false;
}
