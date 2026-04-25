import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:guivo/data/models/feed_post.dart';

part 'feed_repository.g.dart';

class FeedRepository {
  FeedRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Stream<List<FeedPost>> getFeedStream() {
    return _firestore
        .collection('feed')
        .orderBy('dataPublicacao', descending: true)
        .limit(20)
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((doc) => _fromMap(doc.data(), doc.id)).toList(),
        );
  }

  Future<List<FeedPost>> getFeedOnce() async {
    final snap = await _firestore
        .collection('feed')
        .orderBy('dataPublicacao', descending: true)
        .limit(20)
        .get();
    return snap.docs.map((doc) => _fromMap(doc.data(), doc.id)).toList();
  }

  FeedPost _fromMap(Map<String, dynamic> m, String id) => FeedPost(
    id: id,
    instituicao: m['instituicao'] as String,
    titulo: m['titulo'] as String,
    descricao: m['descricao'] as String,
    tipo: PostTipo.values.byName(m['tipo'] as String),
    dataPublicacao: (m['dataPublicacao'] as Timestamp).toDate(),
    dataExpiracao: m['dataExpiracao'] != null
        ? (m['dataExpiracao'] as Timestamp).toDate()
        : null,
    url: m['url'] as String?,
    imagemUrl: m['imagemUrl'] as String?,
    logoInstituicao: m['logoInstituicao'] as String?,
  );
}

@Riverpod(keepAlive: true)
FeedRepository feedRepository(Ref ref) =>
    FeedRepository(FirebaseFirestore.instance);

@riverpod
Stream<List<FeedPost>> feedStream(Ref ref) =>
    ref.watch(feedRepositoryProvider).getFeedStream();
