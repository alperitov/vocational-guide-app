import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:guivo/data/models/feed_post.dart';

part 'feed_repository.g.dart';

class FeedRepository {
  FeedRepository(this._firestore);
  final FirebaseFirestore _firestore;

  List<FeedPost> _feedFallback() => [
    // USTM — Destaque principal
    FeedPost(
      id: 'f_ustm_1',
      instituicao: 'Universidade São Tomás de Moçambique',
      titulo: 'Candidaturas 2026 Abertas — USTM',
      descricao:
          'A USTM abre candidaturas para o ano lectivo 2026 em todos os cursos de Licenciatura, incluindo Gestão de Empresas, Direito, Informática, Ciências de Saúde e Arquitectura. Inscrições presenciais e online até 28 de Fevereiro.',
      tipo: PostTipo.edital,
      dataPublicacao: DateTime(2026, 1, 10),
      dataExpiracao: DateTime(2026, 2, 28),
      url: 'https://www.ustm.ac.mz',
      logoInstituicao: '🏛️',
    ),
    FeedPost(
      id: 'f_ustm_2',
      instituicao: 'Universidade São Tomás de Moçambique',
      titulo: 'Bolsas de Mérito USTM 2026',
      descricao:
          'A USTM disponibiliza bolsas de estudo parciais (50% de desconto) para estudantes com média igual ou superior a 16 valores no ensino secundário. Candidaturas abertas até 15 de Março de 2026.',
      tipo: PostTipo.bolsa,
      dataPublicacao: DateTime(2026, 1, 20),
      dataExpiracao: DateTime(2026, 3, 15),
      url: 'https://www.ustm.ac.mz',
      logoInstituicao: '🎓',
    ),
    FeedPost(
      id: 'f_ustm_3',
      instituicao: 'Universidade São Tomás de Moçambique',
      titulo: 'Orientação Vocacional com a App Guivo',
      descricao:
          'A USTM em parceria com a equipa Guivo promove uma sessão de orientação vocacional para alunos do 12.º ano. Utiliza a app Guivo para descobrir o teu perfil e receber orientação personalizada. Evento gratuito e aberto a todos.',
      tipo: PostTipo.evento,
      dataPublicacao: DateTime(2026, 2, 5),
      dataExpiracao: DateTime(2026, 2, 20),
      url: 'https://www.ustm.ac.mz',
      logoInstituicao: '🎯',
    ),
    FeedPost(
      id: 'f_ustm_4',
      instituicao: 'Universidade São Tomás de Moçambique',
      titulo: 'Programa de Pós-Graduação em Gestão — USTM',
      descricao:
          'A USTM lança o Mestrado em Gestão de Negócios com especialização em Finanças, Marketing Digital e Recursos Humanos. Candidaturas abertas para profissionais e recém-licenciados.',
      tipo: PostTipo.programa,
      dataPublicacao: DateTime(2026, 1, 25),
      dataExpiracao: DateTime(2026, 3, 30),
      url: 'https://www.ustm.ac.mz',
      logoInstituicao: '📚',
    ),
    FeedPost(
      id: 'f_ustm_5',
      instituicao: 'Universidade São Tomás de Moçambique',
      titulo: 'Feira de Empregabilidade USTM 2026',
      descricao:
          'A USTM realiza a sua Feira de Empregabilidade anual com a participação de mais de 40 empresas nacionais e internacionais. Oportunidade única para estágios, empregos e networking profissional.',
      tipo: PostTipo.evento,
      dataPublicacao: DateTime(2026, 3, 10),
      dataExpiracao: DateTime(2026, 3, 25),
      url: 'https://www.ustm.ac.mz',
      logoInstituicao: '💼',
    ),
    FeedPost(
      id: 'f_ustm_6',
      instituicao: 'Universidade São Tomás de Moçambique',
      titulo: 'Jornadas Científicas de TI e Inovação',
      descricao:
          'A Faculdade de Ciências e Tecnologia da USTM promove as Jornadas Científicas 2026 com palestras sobre Inteligência Artificial, Cibersegurança e Transformação Digital em Moçambique.',
      tipo: PostTipo.evento,
      dataPublicacao: DateTime(2026, 4, 5),
      dataExpiracao: DateTime(2026, 4, 18),
      url: 'https://www.ustm.ac.mz',
      logoInstituicao: '💻',
    ),
    FeedPost(
      id: 'f_ustm_7',
      instituicao: 'Universidade São Tomás de Moçambique',
      titulo: 'Semana Cultural USTM — Arte e Ciência',
      descricao:
          'Celebração da diversidade cultural moçambicana com exposições de arte, conferências científicas, desporto universitário e actividades culturais abertas à comunidade.',
      tipo: PostTipo.evento,
      dataPublicacao: DateTime(2026, 5, 1),
      dataExpiracao: DateTime(2026, 5, 10),
      url: 'https://www.ustm.ac.mz',
      logoInstituicao: '🎨',
    ),
    // Outras instituições
    FeedPost(
      id: 'f_uem_1',
      instituicao: 'Universidade Eduardo Mondlane',
      titulo: 'Inscrições Abertas — UEM 2026',
      descricao:
          'A UEM abre candidaturas para o ano lectivo 2026 para todas as faculdades. Destaque para os novos cursos de Engenharia de Software e Ciências Ambientais.',
      tipo: PostTipo.edital,
      dataPublicacao: DateTime(2026, 1, 8),
      dataExpiracao: DateTime(2026, 2, 28),
      url: 'https://www.uem.mz',
      logoInstituicao: '🏛️',
    ),
    FeedPost(
      id: 'f_ucm_1',
      instituicao: 'Universidade Católica de Moçambique',
      titulo: 'Bolsas Parciais UCM 2026',
      descricao:
          'A UCM disponibiliza bolsas de estudo parciais para estudantes com mérito académico nos cursos de Medicina, Direito e Educação. Candidaturas até 31 de Janeiro.',
      tipo: PostTipo.bolsa,
      dataPublicacao: DateTime(2026, 1, 5),
      dataExpiracao: DateTime(2026, 1, 31),
      url: 'https://www.ucm.ac.mz',
      logoInstituicao: '✝️',
    ),
    FeedPost(
      id: 'f_isutc_1',
      instituicao: 'ISUTC',
      titulo: 'Novos Cursos de Engenharia — ISUTC',
      descricao:
          'O ISUTC lança os cursos de Engenharia Electrónica e Telecomunicações e Engenharia de Energias Renováveis para o ano lectivo 2026.',
      tipo: PostTipo.noticia,
      dataPublicacao: DateTime(2026, 1, 12),
      url: 'https://www.isutc.ac.mz',
      logoInstituicao: '⚡',
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
    try {
      final snap = await _firestore
          .collection('feed')
          .orderBy('dataPublicacao', descending: true)
          .limit(20)
          .get();
      if (snap.docs.isEmpty) return _feedFallback();
      return snap.docs.map((doc) => _fromMap(doc.data(), doc.id)).toList();
    } catch (_) {
      return _feedFallback();
    }
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
