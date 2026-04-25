import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

enum FavoriteType { curso, profissao }

@freezed
sealed class Favorite with _$Favorite {
  const factory Favorite({
    required String id,
    required String userId,
    required String itemId,
    required FavoriteType tipo,
    required DateTime criadoEm,
    String? nome,
    String? emoji,
    String? area,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
