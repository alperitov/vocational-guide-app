import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../models/favorite.dart';
import 'database_helper.dart';
import 'package:sqflite/sqflite.dart';

part 'favorites_repository.g.dart';

class FavoritesRepository {
  FavoritesRepository(this._db);
  final DatabaseHelper _db;

  Future<void> addFavorite(Favorite favorite) async {
    final db = await _db.database;
    await db.insert(
      'favorites',
      _toMap(favorite),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFavorite(String userId, String itemId) async {
    final db = await _db.database;
    await db.delete(
      'favorites',
      where: 'user_id = ? AND item_id = ?',
      whereArgs: [userId, itemId],
    );
  }

  Future<bool> isFavorite(String userId, String itemId) async {
    final db = await _db.database;
    final result = await db.query(
      'favorites',
      where: 'user_id = ? AND item_id = ?',
      whereArgs: [userId, itemId],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  Future<List<Favorite>> getFavoritesByUser(String userId) async {
    final db = await _db.database;
    final result = await db.query(
      'favorites',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'criado_em DESC',
    );
    return result.map(_fromMap).toList();
  }

  Future<List<Favorite>> getFavoritesByType(
    String userId,
    FavoriteType tipo,
  ) async {
    final db = await _db.database;
    final result = await db.query(
      'favorites',
      where: 'user_id = ? AND tipo = ?',
      whereArgs: [userId, tipo.name],
      orderBy: 'criado_em DESC',
    );
    return result.map(_fromMap).toList();
  }

  Map<String, dynamic> _toMap(Favorite f) => {
    'id': f.id,
    'user_id': f.userId,
    'item_id': f.itemId,
    'tipo': f.tipo.name,
    'criado_em': f.criadoEm.toIso8601String(),
    'nome': f.nome,
    'emoji': f.emoji,
    'area': f.area,
  };

  Favorite _fromMap(Map<String, dynamic> m) => Favorite(
    id: m['id'] as String,
    userId: m['user_id'] as String,
    itemId: m['item_id'] as String,
    tipo: FavoriteType.values.byName(m['tipo'] as String),
    criadoEm: DateTime.parse(m['criado_em'] as String),
    nome: m['nome'] as String?,
    emoji: m['emoji'] as String?,
    area: m['area'] as String?,
  );
}

@Riverpod(keepAlive: true)
FavoritesRepository favoritesRepository(Ref ref) =>
    FavoritesRepository(ref.watch(databaseHelperProvider));
