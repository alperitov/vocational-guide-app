import 'package:flutter/material.dart';
import 'area_card.dart';

class RecommendedAreas extends StatelessWidget {
  const RecommendedAreas({
    super.key,
    required this.areas,
    required this.onAreaTap,
  });

  final List<Map<String, String>> areas;
  final Function(String area) onAreaTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Áreas recomendadas para ti',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Com base no teu perfil combinado',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        ...areas.map(
          (area) => AreaCard(
            emoji: area['emoji']!,
            area: area['area']!,
            motivo: area['motivo']!,
            onTap: () => onAreaTap(area['area']!),
          ),
        ),
      ],
    );
  }
}
