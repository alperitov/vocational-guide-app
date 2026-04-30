import '../../models/course.dart';

const List<Course> cursosEngenharia = [
  Course(
    id: 'c_eng_civil',
    nome: 'Engenharia Civil',
    area: 'Engenharia',
    instituicoesIds: [
      'inst_uem',
      'inst_isutc',
      'inst_unizambeze',
      'inst_isctem',
    ],
    descricao:
        'Projecto, cálculo estrutural e gestão de obras públicas e privadas, vias de comunicação e saneamento.',
    duracao: '5 Anos',
    requisitosMinimos: '12ª Classe (Física e Matemática)',
    dimensoesRiasec: ['realista', 'investigativo'],
  ),
  Course(
    id: 'c_eng_mec',
    nome: 'Engenharia Mecânica',
    area: 'Engenharia',
    instituicoesIds: ['inst_uem', 'inst_isutc'],
    descricao:
        'Concepção e manutenção de sistemas mecânicos, refrigeração, termodinâmica e processos de fabrico industrial.',
    duracao: '5 Anos',
    requisitosMinimos: '12ª Classe (Física e Matemática)',
    dimensoesRiasec: ['realista', 'investigativo'],
  ),
  Course(
    id: 'c_eng_elec',
    nome: 'Engenharia Electrotécnica',
    area: 'Engenharia',
    instituicoesIds: ['inst_uem', 'inst_isutc', 'inst_up'],
    descricao:
        'Foco em sistemas de potência, automação industrial, energias renováveis e eletrónica.',
    duracao: '5 Anos',
    requisitosMinimos: '12ª Classe (Física e Matemática)',
    dimensoesRiasec: ['realista', 'investigativo'],
  ),
  Course(
    id: 'c_eng_minas',
    nome: 'Engenharia de Minas',
    area: 'Engenharia',
    instituicoesIds: ['inst_uem'],
    descricao:
        'Pesquisa, extração e processamento de recursos minerais, área vital para a economia moçambicana.',
    duracao: '5 Anos',
    requisitosMinimos: '12ª Classe (Ciências Exatas)',
    dimensoesRiasec: ['realista', 'investigativo'],
  ),
  Course(
    id: 'c_arquitectura',
    nome: 'Arquitectura e Planeamento Físico',
    area: 'Engenharia e Construção',
    instituicoesIds: ['inst_ustm', 'inst_uem', 'inst_isctem'],
    descricao:
        'Concepção de espaços urbanos, design de edifícios e sustentabilidade ambiental.',
    duracao: '5 Anos',
    requisitosMinimos: '12ª Classe (Desenho)',
    dimensoesRiasec: ['artistico', 'investigativo'],
  ),
];
