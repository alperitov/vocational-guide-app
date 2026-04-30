import '../../models/course.dart';

const List<Course> cursosSaude = [
  Course(
    id: 'c_medicina',
    nome: 'Medicina',
    area: 'Saúde',
    instituicoesIds: ['inst_uem', 'inst_ucm', 'inst_isctem', 'inst_unilurio'],
    descricao:
        'Formação médica rigorosa focada no diagnóstico, tratamento e prevenção de doenças no contexto tropical.',
    duracao: '6-7 Anos',
    requisitosMinimos: '12ª Classe (Biologia e Química)',
    dimensoesRiasec: ['investigativo', 'social'],
  ),
  Course(
    id: 'c_farmacia',
    nome: 'Farmácia',
    area: 'Saúde',
    instituicoesIds: ['inst_uem', 'inst_isctem', 'inst_unilurio'],
    descricao:
        'Desenvolvimento, produção, controlo de qualidade e dispensa de medicamentos.',
    duracao: '4.5 Anos',
    requisitosMinimos: '12ª Classe (Biologia e Química)',
    dimensoesRiasec: ['investigativo', 'convencional'],
  ),
  Course(
    id: 'c_med_dentaria',
    nome: 'Medicina Dentária',
    area: 'Saúde',
    instituicoesIds: ['inst_isctem', 'inst_uem', 'inst_unilurio'],
    descricao:
        'Prevenção, diagnóstico e tratamento de patologias da cavidade oral, maxilares e estruturas anexas.',
    duracao: '5 Anos',
    requisitosMinimos: '12ª Classe (Biologia)',
    dimensoesRiasec: ['realista', 'investigativo'],
  ),
  Course(
    id: 'c_enfermagem',
    nome: 'Enfermagem Geral',
    area: 'Saúde',
    instituicoesIds: ['inst_ucm', 'inst_up', 'inst_unilurio'],
    descricao:
        'Prestação de cuidados de saúde diretos, promoção de saúde pública e gestão de unidades de atendimento.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Biologia)',
    dimensoesRiasec: ['social', 'realista'],
  ),
  Course(
    id: 'c_nutricao',
    nome: 'Nutrição',
    area: 'Saúde',
    instituicoesIds: ['inst_unilurio', 'inst_uem'],
    descricao:
        'Estudo dos alimentos e do seu impacto na saúde humana, atuando na prevenção de doenças crónicas e desnutrição.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Biologia e Química)',
    dimensoesRiasec: ['social', 'investigativo'],
  ),
];
