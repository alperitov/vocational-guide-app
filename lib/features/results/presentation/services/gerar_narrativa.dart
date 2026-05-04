import '../../application/results_providers.dart';
import '../widgets/results_constants.dart';

String _riasecDesc(String d) => switch (d) {
  'realista' => 'prática e orientada para o trabalho manual e técnico',
  'investigativo' =>
    'analítica e curiosa, que gosta de investigar e resolver problemas',
  'artistico' => 'criativa e expressiva, que valoriza a liberdade e inovação',
  'social' =>
    'empática e comunicativa, que encontra satisfação em ajudar outros',
  'empreendedor' => 'ambiciosa e líder, com aptidão para gerir e persuadir',
  'convencional' => 'organizada e metódica, que prefere estrutura e precisão',
  _ => 'versátil e multifacetada',
};

String _gardnerDesc(String d) => switch (d) {
  'linguistica' => 'linguística e verbal',
  'logico_matematica' => 'lógico-matemática',
  'espacial' => 'visual e espacial',
  'musical' => 'musical e auditiva',
  'corporal_cinestesica' => 'corporal e cinestésica',
  'naturalista' => 'naturalista e científica',
  'interpessoal' => 'interpessoal e social',
  'intrapessoal' => 'intrapessoal e reflexiva',
  _ => 'diversificada',
};

String _valoresDesc(String d) => switch (d) {
  'autonomia' => 'a liberdade e independência no trabalho',
  'prestigio' => 'o reconhecimento e o prestígio social',
  'seguranca' => 'a estabilidade e segurança profissional',
  'ajuda_social' => 'o impacto positivo na sociedade',
  'criatividade' => 'a criatividade e a inovação constante',
  'remuneracao' => 'uma boa remuneração e sucesso financeiro',
  _ => 'o equilíbrio entre vários aspectos',
};

String gerarNarrativa(CombinedProfile profile) {
  if (!profile.isComplete) return '';
  final topRiasec = profile.topRiasec;
  final top2Riasec =
      (profile.riasec.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value)))
          .take(2)
          .map((e) => dimensaoNomes[e.key] ?? e.key)
          .toList();
  final topGardner = profile.topGardner;
  final top2Gardner =
      (profile.gardner.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value)))
          .take(2)
          .map((e) => gardnerNomes[e.key] ?? e.key)
          .toList();
  final topValores = profile.topValores;

  return 'És uma pessoa ${_riasecDesc(topRiasec)}. '
      'Tens uma inteligência predominantemente ${_gardnerDesc(topGardner)}, '
      'o que significa que aprendes e te destacas melhor nessa área. '
      'No trabalho, o que mais valorizas é ${_valoresDesc(topValores)}.\n\n'
      'Com base neste perfil, tens maior potencial nas áreas de '
      '${top2Riasec.join(' e ')} — profissões que combinam '
      '${top2Gardner.join(' e ')} com ${_valoresDesc(topValores).split(' ').first}.';
}
