import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../../data/local/favorites_repository.dart';
import '../../../data/models/favorite.dart';
import '../../../features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'favorites_providers.g.dart';

@riverpod
Future<List<Favorite>> userFavorites(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return [];
  return ref.read(favoritesRepositoryProvider).getFavoritesByUser(user.uid);
}

@riverpod
Future<bool> isFavorite(Ref ref, String itemId) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return false;
  return ref.read(favoritesRepositoryProvider).isFavorite(user.uid, itemId);
}

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  Future<List<Favorite>> build() async {
    final user = ref.watch(authStateChangesProvider).valueOrNull;
    if (user == null) return [];
    return ref.read(favoritesRepositoryProvider).getFavoritesByUser(user.uid);
  }

  Future<void> toggle({
    required String itemId,
    required FavoriteType tipo,
    required String nome,
    required String emoji,
    required String area,
  }) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) return;

    final repo = ref.read(favoritesRepositoryProvider);
    final existe = await repo.isFavorite(user.uid, itemId);

    if (existe) {
      await repo.removeFavorite(user.uid, itemId);
    } else {
      await repo.addFavorite(
        Favorite(
          id: const Uuid().v4(),
          userId: user.uid,
          itemId: itemId,
          tipo: tipo,
          criadoEm: DateTime.now(),
          nome: nome,
          emoji: emoji,
          area: area,
        ),
      );
    }

    ref.invalidateSelf();
    ref.invalidate(isFavoriteProvider(itemId));
  }
}
