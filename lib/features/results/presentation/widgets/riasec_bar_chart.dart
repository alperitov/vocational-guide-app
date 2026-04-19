import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/quiz_models.dart';

class RiasecBarChart extends StatelessWidget {
  const RiasecBarChart({super.key, required this.resultados});

  final Map<String, double> resultados;

  static const _labels = {
    'realista': 'R',
    'investigativo': 'I',
    'artistico': 'A',
    'social': 'S',
    'empreendedor': 'E',
    'convencional': 'C',
  };

  static const _cores = [
    Color(0xFF4CAF50),
    Color(0xFF2196F3),
    Color(0xFF9C27B0),
    Color(0xFFFF9800),
    Color(0xFFF44336),
    Color(0xFF00BCD4),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dims = RiasecDimension.values;

    return AspectRatio(
      aspectRatio: 1.4,
      child: BarChart(
        BarChartData(
          maxY: 100,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final dim = dims[groupIndex];
                return BarTooltipItem(
                  '${dim.name}\n${rod.toY.toStringAsFixed(0)}%',
                  TextStyle(color: theme.colorScheme.onSurface),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (value, meta) => Text(
                  '${value.toInt()}%',
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final dim = dims[value.toInt()];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _labels[dim.name] ?? '',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: 25,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: theme.colorScheme.outlineVariant, strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(dims.length, (i) {
            final dim = dims[i];
            final score = resultados[dim.name] ?? 0;
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: score,
                  color: _cores[i],
                  width: 28,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
