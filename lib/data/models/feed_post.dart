import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_post.freezed.dart';
part 'feed_post.g.dart';

enum PostTipo { edital, bolsa, evento, noticia, programa }

@freezed
sealed class FeedPost with _$FeedPost {
  const factory FeedPost({
    required String id,
    required String instituicao,
    required String titulo,
    required String descricao,
    required PostTipo tipo,
    required DateTime dataPublicacao,
    DateTime? dataExpiracao,
    String? url,
    String? imagemUrl,
    String? logoInstituicao,
  }) = _FeedPost;

  factory FeedPost.fromJson(Map<String, dynamic> json) =>
      _$FeedPostFromJson(json);
}
