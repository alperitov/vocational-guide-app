export 'saude.dart';
export 'tecnologia.dart';
export 'engenharia.dart';
export 'educacao.dart';
export 'negocios.dart';
export 'direito.dart';
export 'comunicacao.dart';
export 'arquitectura.dart';
export 'ciencias_naturais.dart';
export 'turismo.dart';
export 'agricultura.dart';
export 'artes.dart';
export 'outros.dart';

import '../../../models/profession.dart';
import 'saude.dart';
import 'tecnologia.dart';
import 'engenharia.dart';
import 'educacao.dart';
import 'negocios.dart';
import 'direito.dart';
import 'comunicacao.dart';
import 'arquitectura.dart';
import 'ciencias_naturais.dart';
import 'turismo.dart';
import 'agricultura.dart';
import 'artes.dart';
import 'outros.dart';

/// Lista completa de todas as profissões (~166 profissões)
final List<Profession> kTodasProfissoes = [
  ...profissoesSaude, // 25
  ...profissoesTecnologia, // 20
  ...profissoesEngenharia, // 15
  ...profissoesEducacao, // 10
  ...profissoesNegocios, // 15
  ...profissoesDireito, // 10
  ...profissoesComunicacao, // 10
  ...profissoesArquitectura, // 8
  ...profissoesCienciasNaturais, // 10
  ...profissoesTurismo, // 8
  ...profissoesAgricultura, // 8
  ...profissoesArtes, // 8
  ...profissoesOutros, // 20
  // TOTAL: 167 profissões
];

/// Mapa de profissões por área
final Map<String, List<Profession>> kProfissoesPorArea = {
  for (var area in kAreasConhecimento)
    area: kTodasProfissoes.where((p) => p.areaConhecimento == area).toList(),
};

/// Lista de áreas disponíveis
final List<String> kAreasConhecimento = [
  'Saúde',
  'Tecnologia',
  'Engenharia',
  'Educação',
  'Negócios',
  'Direito',
  'Comunicação',
  'Arquitectura',
  'Ciências Naturais',
  'Turismo',
  'Agricultura',
  'Artes',
  'Outros',
];
