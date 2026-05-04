import '../../application/results_providers.dart';

List<Map<String, String>> areasPorRiasec(String d) => switch (d) {
  'realista' => [
    {
      'emoji': '⚙️',
      'area': 'Engenharia e Construção',
      'motivo':
          'O teu perfil prático e técnico combina naturalmente com esta área.',
    },
    {
      'emoji': '🌾',
      'area': 'Agricultura e Meio Ambiente',
      'motivo':
          'A tua preferência por actividades ao ar livre é uma vantagem aqui.',
    },
  ],
  'investigativo' => [
    {
      'emoji': '🔬',
      'area': 'Ciências e Investigação',
      'motivo':
          'A tua mente analítica e curiosidade científica são ideais aqui.',
    },
    {
      'emoji': '💻',
      'area': 'Tecnologia e Informática',
      'motivo': 'A resolução de problemas complexos é o core desta área.',
    },
  ],
  'artistico' => [
    {
      'emoji': '🎨',
      'area': 'Artes, Design e Comunicação',
      'motivo': 'A tua criatividade e expressão são os pilares desta área.',
    },
    {
      'emoji': '🏛️',
      'area': 'Arquitectura e Urbanismo',
      'motivo': 'Combina criatividade com impacto visual e espacial.',
    },
  ],
  'social' => [
    {
      'emoji': '🏥',
      'area': 'Saúde e Bem-estar',
      'motivo': 'A tua empatia e vontade de ajudar são essenciais nesta área.',
    },
    {
      'emoji': '📚',
      'area': 'Educação e Serviço Social',
      'motivo': 'O teu perfil social é o mais valorizado nestas profissões.',
    },
  ],
  'empreendedor' => [
    {
      'emoji': '📈',
      'area': 'Gestão e Negócios',
      'motivo': 'A tua liderança e ambição são activos valiosos nesta área.',
    },
    {
      'emoji': '⚖️',
      'area': 'Direito e Relações Internacionais',
      'motivo': 'A tua capacidade de persuasão destaca-te nesta área.',
    },
  ],
  'convencional' => [
    {
      'emoji': '💰',
      'area': 'Contabilidade e Finanças',
      'motivo': 'A tua precisão e organização são essenciais nesta área.',
    },
    {
      'emoji': '🏦',
      'area': 'Administração e Gestão Pública',
      'motivo': 'O teu perfil metódico é muito valorizado nestas funções.',
    },
  ],
  _ => [],
};

List<Map<String, String>> gerarAreas(CombinedProfile profile) {
  final topRiasec = profile.topRiasec;
  final topGardner = profile.topGardner;
  final areas = <Map<String, String>>[];
  areas.addAll(areasPorRiasec(topRiasec));
  if (topGardner == 'logico_matematica' || topGardner == 'espacial') {
    areas.add({
      'emoji': '💻',
      'area': 'Tecnologia e Informática',
      'motivo':
          'A tua inteligência lógico-matemática/espacial é ideal para esta área.',
    });
  }
  if (topGardner == 'interpessoal' || topGardner == 'linguistica') {
    areas.add({
      'emoji': '🎓',
      'area': 'Educação e Serviço Social',
      'motivo':
          'A tua inteligência interpessoal/linguística destaca-te nesta área.',
    });
  }
  if (topGardner == 'naturalista') {
    areas.add({
      'emoji': '🌿',
      'area': 'Agricultura e Meio Ambiente',
      'motivo': 'A tua inteligência naturalista é uma vantagem nesta área.',
    });
  }
  final seen = <String>{};
  return areas.where((a) => seen.add(a['area']!)).take(4).toList();
}
