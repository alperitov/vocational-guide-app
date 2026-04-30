import '../../models/course.dart';

const List<Course> cursosNegocios = [
  Course(
    id: 'c_gestao',
    nome: 'Gestão de Empresas',
    area: 'Economia e Gestão',
    instituicoesIds: [
      'inst_ustm',
      'inst_isctem',
      'inst_uem',
      'inst_up',
      'inst_ucm',
    ],
    descricao:
        'Forma profissionais para planear, organizar e dirigir organizações públicas ou privadas, com forte base em empreendedorismo.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Matemática)',
    dimensoesRiasec: ['empreendedor', 'convencional'],
  ),
  Course(
    id: 'c_contabilidade',
    nome: 'Contabilidade e Auditoria',
    area: 'Economia e Gestão',
    instituicoesIds: [
      'inst_ustm',
      'inst_uem',
      'inst_isctem',
      'inst_up',
      'inst_unizambeze',
    ],
    descricao:
        'Especializa o estudante na gestão financeira, fiscalidade e controlo de contas, cumprindo as normas internacionais de relato financeiro.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (SNE)',
    dimensoesRiasec: ['convencional', 'empreendedor'],
  ),
  Course(
    id: 'c_economia',
    nome: 'Economia',
    area: 'Economia e Gestão',
    instituicoesIds: ['inst_ustm', 'inst_uem', 'inst_isctem', 'inst_ucm'],
    descricao:
        'Análise de mercados, políticas macroeconómicas, desenvolvimento socioeconómico e gestão de recursos escassos.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Matemática)',
    dimensoesRiasec: ['investigativo', 'convencional'],
  ),
  Course(
    id: 'c_financas',
    nome: 'Gestão Financeira e Bancária',
    area: 'Economia e Gestão',
    instituicoesIds: ['inst_ustm', 'inst_isctem', 'inst_a_politecnica'],
    descricao:
        'Foco no mercado de capitais, análise de risco, operações bancárias e gestão de investimentos institucionais.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Matemática)',
    dimensoesRiasec: ['convencional', 'empreendedor'],
  ),
  Course(
    id: 'c_rh',
    nome: 'Gestão de Recursos Humanos',
    area: 'Economia e Gestão',
    instituicoesIds: ['inst_ustm', 'inst_up', 'inst_a_politecnica'],
    descricao:
        'Capacita para o recrutamento, selecção, formação e gestão de talentos dentro das organizações moçambicanas.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe',
    dimensoesRiasec: ['social', 'empreendedor'],
  ),
  Course(
    id: 'c_marketing',
    nome: 'Marketing e Relações Públicas',
    area: 'Comunicação e Negócios',
    instituicoesIds: ['inst_ustm', 'inst_isctem', 'inst_uem'],
    descricao:
        'Estratégias de mercado, comportamento do consumidor, publicidade e gestão de imagem corporativa.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe',
    dimensoesRiasec: ['empreendedor', 'artistico'],
  ),
  Course(
    id: 'c_turismo',
    nome: 'Gestão de Turismo e Hotelaria',
    area: 'Serviços',
    instituicoesIds: ['inst_ustm', 'inst_uem', 'inst_ucm', 'inst_up'],
    descricao:
        'Planeamento estratégico de destinos turísticos, gestão hoteleira e sustentabilidade ambiental.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Letras ou SNE)',
    dimensoesRiasec: ['social', 'empreendedor'],
  ),
];
