import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/quiz_models.dart';

class RiasecRadarChart extends StatelessWidget {
  const RiasecRadarChart({super.key, required this.resultados});

  final Map<String, double> resultados;

  static const _labels = [
    'Realista',
    'Investigativo',
    'Artístico',
    'Social',
    'Empreendedor',
    'Convencional',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dims = RiasecDimension.values;

    return AspectRatio(
      aspectRatio: 1,
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,
          tickCount: 4,
          ticksTextStyle: theme.textTheme.labelSmall!,
          gridBorderData: BorderSide(
            color: theme.colorScheme.outlineVariant,
            width: 1,
          ),
          tickBorderData: BorderSide(
            color: theme.colorScheme.outlineVariant,
            width: 1,
          ),
          radarBorderData: BorderSide(
            color: theme.colorScheme.outline,
            width: 2,
          ),
          titleTextStyle: theme.textTheme.labelSmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          getTitle: (index, angle) =>
              RadarChartTitle(text: _labels[index], angle: angle),
          dataSets: [
            RadarDataSet(
              fillColor: theme.colorScheme.primary.withValues(alpha: 0.2),
              borderColor: theme.colorScheme.primary,
              borderWidth: 2,
              entryRadius: 4,
              dataEntries: dims.map((dim) {
                final score = resultados[dim.name] ?? 0;
                return RadarEntry(value: score);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
