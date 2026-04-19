import '../models/course.dart';

const List<Course> kCursos = [
  // Realista
  Course(
    id: 'c01',
    nome: 'Engenharia Civil',
    area: 'Engenharia',
    dimensoesRiasec: ['realista', 'investigativo'],
    instituicoes: ['UEM', 'UCM', 'ISUTC'],
    descricao: 'Projecta e supervisiona construção de infra-estruturas.',
  ),
  Course(
    id: 'c02',
    nome: 'Engenharia Mecânica',
    area: 'Engenharia',
    dimensoesRiasec: ['realista', 'investigativo'],
    instituicoes: ['UEM', 'ISUTC'],
    descricao: 'Desenvolve e mantém sistemas mecânicos e industriais.',
  ),
  Course(
    id: 'c03',
    nome: 'Agronomia',
    area: 'Ciências Agrárias',
    dimensoesRiasec: ['realista', 'investigativo'],
    instituicoes: ['UEM', 'UniZambeze', 'UP'],
    descricao: 'Estuda técnicas de produção e gestão agrícola.',
  ),

  // Investigativo
  Course(
    id: 'c04',
    nome: 'Medicina',
    area: 'Saúde',
    dimensoesRiasec: ['investigativo', 'social'],
    instituicoes: ['UEM', 'UCM', 'UMBB'],
    descricao: 'Diagnóstico e tratamento de doenças humanas.',
  ),
  Course(
    id: 'c05',
    nome: 'Engenharia Informática',
    area: 'Tecnologia',
    dimensoesRiasec: ['investigativo', 'realista'],
    instituicoes: ['UEM', 'ISUTC', 'IPCA'],
    descricao: 'Desenvolve software e sistemas computacionais.',
  ),
  Course(
    id: 'c06',
    nome: 'Biologia',
    area: 'Ciências Naturais',
    dimensoesRiasec: ['investigativo', 'realista'],
    instituicoes: ['UEM', 'UP', 'UCM'],
    descricao: 'Estuda os seres vivos e os ecossistemas naturais.',
  ),

  // Artístico
  Course(
    id: 'c07',
    nome: 'Arquitectura',
    area: 'Artes e Design',
    dimensoesRiasec: ['artistico', 'realista'],
    instituicoes: ['UEM', 'ISUTC'],
    descricao: 'Projecta espaços e edificações com função e estética.',
  ),
  Course(
    id: 'c08',
    nome: 'Comunicação e Jornalismo',
    area: 'Comunicação',
    dimensoesRiasec: ['artistico', 'social'],
    instituicoes: ['UEM', 'ISCTEM', 'UCM'],
    descricao: 'Produz e difunde informação através dos média.',
  ),
  Course(
    id: 'c09',
    nome: 'Design Gráfico',
    area: 'Artes e Design',
    dimensoesRiasec: ['artistico', 'convencional'],
    instituicoes: ['ISCTEM', 'IPCA'],
    descricao: 'Cria identidades visuais e materiais de comunicação.',
  ),

  // Social
  Course(
    id: 'c10',
    nome: 'Ensino de Matemática',
    area: 'Educação',
    dimensoesRiasec: ['social', 'investigativo'],
    instituicoes: ['UP', 'UCM', 'UniZambeze'],
    descricao:
        'Forma professores de matemática para o ensino básico e secundário.',
  ),
  Course(
    id: 'c11',
    nome: 'Psicologia',
    area: 'Ciências Sociais',
    dimensoesRiasec: ['social', 'investigativo'],
    instituicoes: ['UEM', 'UCM'],
    descricao: 'Estuda o comportamento humano e promove saúde mental.',
  ),
  Course(
    id: 'c12',
    nome: 'Direito',
    area: 'Ciências Jurídicas',
    dimensoesRiasec: ['social', 'empreendedor'],
    instituicoes: ['UEM', 'UCM', 'ISCED'],
    descricao: 'Interpreta e aplica normas jurídicas na sociedade.',
  ),

  // Empreendedor
  Course(
    id: 'c13',
    nome: 'Gestão de Empresas',
    area: 'Negócios',
    dimensoesRiasec: ['empreendedor', 'convencional'],
    instituicoes: ['UEM', 'ISCTEM', 'UCM', 'ISPU'],
    descricao: 'Planeia e gere organizações com eficiência.',
  ),
  Course(
    id: 'c14',
    nome: 'Marketing',
    area: 'Negócios',
    dimensoesRiasec: ['empreendedor', 'artistico'],
    instituicoes: ['ISCTEM', 'ISPU', 'UCM'],
    descricao: 'Desenvolve estratégias para promover produtos e serviços.',
  ),
  Course(
    id: 'c15',
    nome: 'Relações Internacionais',
    area: 'Ciências Sociais',
    dimensoesRiasec: ['empreendedor', 'social'],
    instituicoes: ['UEM', 'ISRI'],
    descricao: 'Analisa relações entre países e organizações internacionais.',
  ),

  // Convencional
  Course(
    id: 'c16',
    nome: 'Contabilidade',
    area: 'Negócios',
    dimensoesRiasec: ['convencional', 'empreendedor'],
    instituicoes: ['UEM', 'ISCTEM', 'ISPU', 'UCM'],
    descricao: 'Regista e analisa informação financeira de organizações.',
  ),
  Course(
    id: 'c17',
    nome: 'Estatística',
    area: 'Ciências Exactas',
    dimensoesRiasec: ['convencional', 'investigativo'],
    instituicoes: ['UEM'],
    descricao: 'Recolhe e analisa dados para apoiar decisões.',
  ),
  Course(
    id: 'c18',
    nome: 'Administração Pública',
    area: 'Ciências Sociais',
    dimensoesRiasec: ['convencional', 'social'],
    instituicoes: ['UEM', 'ISAP', 'UCM'],
    descricao: 'Gere recursos e serviços do Estado de forma eficiente.',
  ),
];
