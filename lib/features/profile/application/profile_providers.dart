import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/local/profile_repository.dart';
import '../../../data/models/student_profile.dart';
import '../../../features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'profile_providers.g.dart';

@riverpod
Future<StudentProfile?> studentProfile(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return null;
  return ref.read(profileRepositoryProvider).getProfile(user.uid);
}

@riverpod
class ProfileEditorNotifier extends _$ProfileEditorNotifier {
  @override
  AsyncValue<StudentProfile?> build() {
    final profile = ref.watch(studentProfileProvider);
    return profile;
  }

  Future<void> saveProfile(StudentProfile profile) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(profileRepositoryProvider).saveProfile(profile);
      ref.invalidate(studentProfileProvider);
      state = AsyncValue.data(profile);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
