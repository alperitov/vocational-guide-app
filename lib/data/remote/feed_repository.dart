import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:guivo/data/models/feed_post.dart';

part 'feed_repository.g.dart';

class FeedRepository {
  FeedRepository(this._firestore);
  final FirebaseFirestore _firestore;

  List<FeedPost> _feedFallback() => [
    FeedPost(
      id: 'f1',
      instituicao: 'Universidade Eduardo Mondlane',
      titulo: 'Inscrições abertas 2025',
      descricao:
          'A UEM abre inscrições para o ano lectivo 2025. Candidaturas para todas as faculdades de 15 de Janeiro a 28 de Fevereiro.',
      tipo: PostTipo.edital,
      dataPublicacao: DateTime.now(),
      url: 'https://www.uem.mz',
      logoInstituicao: '🏛️',
    ),
    FeedPost(
      id: 'f2',
      instituicao: 'Universidade Católica de Moçambique',
      titulo: 'Bolsas de estudo disponíveis',
      descricao:
          'A UCM disponibiliza bolsas parciais para estudantes com mérito académico. Candidaturas até 31 de Janeiro.',
      tipo: PostTipo.bolsa,
      dataPublicacao: DateTime.now().subtract(const Duration(days: 2)),
      logoInstituicao: '🎓',
    ),
    FeedPost(
      id: 'f3',
      instituicao: 'ISUTC',
      titulo: 'Feira de Carreiras 2025',
      descricao:
          'O ISUTC realiza a sua feira anual de carreiras com participação de mais de 30 empresas moçambicanas.',
      tipo: PostTipo.evento,
      dataPublicacao: DateTime.now().subtract(const Duration(days: 5)),
      dataExpiracao: DateTime.now().add(const Duration(days: 10)),
      logoInstituicao: '💼',
    ),
  ];

  Stream<List<FeedPost>> getFeedStream() async* {
    try {
      await for (final snap
          in _firestore
              .collection('feed')
              .snapshots()
              .timeout(const Duration(seconds: 6))) {
        final posts = snap.docs
            .map((doc) => _fromMap(doc.data(), doc.id))
            .toList();
        if (posts.isEmpty) {
          yield _feedFallback();
        } else {
          posts.sort((a, b) => b.dataPublicacao.compareTo(a.dataPublicacao));
          yield posts;
        }
      }
    } catch (_) {
      yield _feedFallback();
    }
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
