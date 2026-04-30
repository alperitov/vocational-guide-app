import '../../models/course.dart';

const List<Course> cursosSociais = [
  Course(
    id: 'c_direito',
    nome: 'Direito',
    area: 'Ciências Jurídicas',
    instituicoesIds: [
      'inst_ustm',
      'inst_uem',
      'inst_isctem',
      'inst_ucm',
      'inst_a_politecnica',
    ],
    descricao:
        'Estudo do ordenamento jurídico moçambicano e internacional. Prepara magistrados, advogados e consultores legais.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Letras)',
    dimensoesRiasec: ['social', 'empreendedor'],
  ),
  Course(
    id: 'c_psicologia_cli',
    nome: 'Psicologia Clínica',
    area: 'Ciências Sociais',
    instituicoesIds: ['inst_ustm', 'inst_uem', 'inst_up'],
    descricao:
        'Avaliação, diagnóstico e intervenção terapêutica para promover a saúde mental e bem-estar dos indivíduos.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Letras ou Ciências)',
    dimensoesRiasec: ['social', 'investigativo'],
  ),
  Course(
    id: 'c_psicologia_org',
    nome: 'Psicologia Organizacional',
    area: 'Ciências Sociais',
    instituicoesIds: ['inst_ustm', 'inst_up'],
    descricao:
        'Estudo do comportamento humano no ambiente corporativo, focado no clima organizacional e ergonomia.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe',
    dimensoesRiasec: ['social', 'convencional'],
  ),
  Course(
    id: 'c_sociologia',
    nome: 'Sociologia',
    area: 'Ciências Sociais',
    instituicoesIds: ['inst_ustm', 'inst_uem', 'inst_up', 'inst_ucm'],
    descricao:
        'Análise das estruturas sociais, dinâmicas culturais, desigualdades e fenómenos comunitários em Moçambique.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Letras)',
    dimensoesRiasec: ['investigativo', 'social'],
  ),
  Course(
    id: 'c_ri',
    nome: 'Relações Internacionais e Diplomacia',
    area: 'Ciências Sociais',
    instituicoesIds: [
      'inst_isri',
      'inst_ustm',
      'inst_uem',
      'inst_a_politecnica',
    ],
    descricao:
        'Compreensão da política externa, direito internacional, integração regional (SADC) e negociações diplomáticas.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Letras)',
    dimensoesRiasec: ['social', 'empreendedor'],
  ),
  Course(
    id: 'c_jornalismo',
    nome: 'Jornalismo e Comunicação',
    area: 'Ciências da Comunicação',
    instituicoesIds: ['inst_uem', 'inst_up', 'inst_a_politecnica'],
    descricao:
        'Técnicas de reportagem, edição multimédia, assessoria de imprensa e ética na comunicação de massas.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Letras)',
    dimensoesRiasec: ['artistico', 'social'],
  ),
];
