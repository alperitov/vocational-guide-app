import '../../../data/models/quiz_models.dart';

const List<QuizQuestion> kQuizQuestions = [
  // REALISTA (R) — trabalho prático, ferramentas, natureza
  QuizQuestion(
    id: 'R1',
    dimensao: RiasecDimension.realista,
    texto: 'Gosto de trabalhar com ferramentas, máquinas ou equipamentos.',
  ),
  QuizQuestion(
    id: 'R2',
    dimensao: RiasecDimension.realista,
    texto:
        'Prefiro actividades ao ar livre a trabalhar dentro de um escritório.',
  ),
  QuizQuestion(
    id: 'R3',
    dimensao: RiasecDimension.realista,
    texto: 'Tenho facilidade em montar, reparar ou construir coisas.',
  ),
  QuizQuestion(
    id: 'R4',
    dimensao: RiasecDimension.realista,
    texto: 'Gosto de actividades físicas que exigem destreza manual.',
  ),
  QuizQuestion(
    id: 'R5',
    dimensao: RiasecDimension.realista,
    texto: 'Interessa-me trabalhar com animais, plantas ou recursos naturais.',
  ),

  // INVESTIGATIVO (I) — ciência, análise, pesquisa
  QuizQuestion(
    id: 'I1',
    dimensao: RiasecDimension.investigativo,
    texto: 'Gosto de resolver problemas complexos que exigem muito raciocínio.',
  ),
  QuizQuestion(
    id: 'I2',
    dimensao: RiasecDimension.investigativo,
    texto:
        'Tenho curiosidade em perceber como as coisas funcionam cientificamente.',
  ),
  QuizQuestion(
    id: 'I3',
    dimensao: RiasecDimension.investigativo,
    texto: 'Prefiro investigar e analisar dados a tomar decisões rápidas.',
  ),
  QuizQuestion(
    id: 'I4',
    dimensao: RiasecDimension.investigativo,
    texto: 'Gosto de ler sobre ciência, tecnologia ou temas académicos.',
  ),
  QuizQuestion(
    id: 'I5',
    dimensao: RiasecDimension.investigativo,
    texto:
        'Sinto-me confortável a trabalhar de forma independente em problemas difíceis.',
  ),

  // ARTÍSTICO (A) — criatividade, expressão, arte
  QuizQuestion(
    id: 'A1',
    dimensao: RiasecDimension.artistico,
    texto:
        'Gosto de me expressar através da música, escrita, desenho ou teatro.',
  ),
  QuizQuestion(
    id: 'A2',
    dimensao: RiasecDimension.artistico,
    texto: 'Prefiro trabalhos que me dêem liberdade criativa.',
  ),
  QuizQuestion(
    id: 'A3',
    dimensao: RiasecDimension.artistico,
    texto: 'Tenho facilidade em imaginar e criar coisas originais.',
  ),
  QuizQuestion(
    id: 'A4',
    dimensao: RiasecDimension.artistico,
    texto: 'Valorizo a beleza, o design e a estética no meu dia a dia.',
  ),
  QuizQuestion(
    id: 'A5',
    dimensao: RiasecDimension.artistico,
    texto: 'Gosto de trabalhos onde posso usar a imaginação livremente.',
  ),

  // SOCIAL (S) — pessoas, ensino, ajuda
  QuizQuestion(
    id: 'S1',
    dimensao: RiasecDimension.social,
    texto: 'Gosto de ajudar os outros a resolver os seus problemas.',
  ),
  QuizQuestion(
    id: 'S2',
    dimensao: RiasecDimension.social,
    texto: 'Sinto satisfação quando ensino ou explico algo a alguém.',
  ),
  QuizQuestion(
    id: 'S3',
    dimensao: RiasecDimension.social,
    texto: 'Prefiro trabalhar em equipa a trabalhar sozinho.',
  ),
  QuizQuestion(
    id: 'S4',
    dimensao: RiasecDimension.social,
    texto: 'Tenho facilidade em comunicar e criar empatia com as pessoas.',
  ),
  QuizQuestion(
    id: 'S5',
    dimensao: RiasecDimension.social,
    texto:
        'Interessa-me trabalhar em áreas que contribuem para o bem-estar da comunidade.',
  ),

  // EMPREENDEDOR (E) — liderança, persuasão, negócios
  QuizQuestion(
    id: 'E1',
    dimensao: RiasecDimension.empreendedor,
    texto: 'Gosto de liderar grupos e tomar decisões importantes.',
  ),
  QuizQuestion(
    id: 'E2',
    dimensao: RiasecDimension.empreendedor,
    texto: 'Tenho facilidade em convencer e influenciar outras pessoas.',
  ),
  QuizQuestion(
    id: 'E3',
    dimensao: RiasecDimension.empreendedor,
    texto: 'Interessa-me criar e gerir o meu próprio negócio.',
  ),
  QuizQuestion(
    id: 'E4',
    dimensao: RiasecDimension.empreendedor,
    texto: 'Gosto de competir e atingir metas e objectivos ambiciosos.',
  ),
  QuizQuestion(
    id: 'E5',
    dimensao: RiasecDimension.empreendedor,
    texto: 'Sinto-me bem em situações que exigem iniciativa e coragem.',
  ),

  // CONVENCIONAL (C) — organização, dados, procedimentos
  QuizQuestion(
    id: 'C1',
    dimensao: RiasecDimension.convencional,
    texto: 'Gosto de trabalhos organizados com regras e procedimentos claros.',
  ),
  QuizQuestion(
    id: 'C2',
    dimensao: RiasecDimension.convencional,
    texto: 'Tenho facilidade em trabalhar com números, tabelas e dados.',
  ),
  QuizQuestion(
    id: 'C3',
    dimensao: RiasecDimension.convencional,
    texto: 'Prefiro tarefas bem definidas a situações ambíguas e incertas.',
  ),
  QuizQuestion(
    id: 'C4',
    dimensao: RiasecDimension.convencional,
    texto: 'Gosto de manter registos, arquivos e informação organizada.',
  ),
  QuizQuestion(
    id: 'C5',
    dimensao: RiasecDimension.convencional,
    texto: 'Sinto-me confortável a seguir instruções detalhadas com precisão.',
  ),
];
