import '../../models/course.dart';

const List<Course> cursosTecnologia = [
  Course(
    id: 'c_it',
    nome: 'Engenharia Informática',
    area: 'Tecnologias de Informação',
    instituicoesIds: [
      'inst_ustm',
      'inst_isutc',
      'inst_uem',
      'inst_isctem',
      'inst_unilurio',
    ],
    descricao:
        'Formação em desenvolvimento de software (web/mobile), arquitetura de sistemas e engenharia de dados.',
    duracao: '4.5 Anos',
    requisitosMinimos: '12ª Classe (Matemática e Física)',
    dimensoesRiasec: ['investigativo', 'realista'],
  ),
  Course(
    id: 'c_telecom',
    nome: 'Engenharia de Telecomunicações',
    area: 'Tecnologias de Informação',
    instituicoesIds: ['inst_ustm', 'inst_isutc', 'inst_uem'],
    descricao:
        'Projecto e gestão de infraestruturas de rede, fibra óptica, tecnologias wireless e comunicação de dados.',
    duracao: '4.5 Anos',
    requisitosMinimos: '12ª Classe (Matemática e Física)',
    dimensoesRiasec: ['realista', 'investigativo'],
  ),
  Course(
    id: 'c_ciencias_comp',
    nome: 'Ciências da Computação',
    area: 'Tecnologias de Informação',
    instituicoesIds: ['inst_uem', 'inst_up', 'inst_unizambeze'],
    descricao:
        'Foco na teoria da computação, algoritmos avançados, inteligência artificial e segurança cibernética.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Ciências Exatas)',
    dimensoesRiasec: ['investigativo', 'convencional'],
  ),
  Course(
    id: 'c_redes',
    nome: 'Engenharia de Redes e Segurança',
    area: 'Tecnologias de Informação',
    instituicoesIds: ['inst_ustm', 'inst_isutc'],
    descricao:
        'Gestão de datacenters, cibersegurança, criptografia e administração de sistemas.',
    duracao: '4 Anos',
    requisitosMinimos: '12ª Classe (Matemática e Física)',
    dimensoesRiasec: ['investigativo', 'realista'],
  ),
];
