import 'package:flutter/material.dart';
import 'riasec_bar_chart.dart';
import 'riasec_radar_chart.dart';

class ChartTabSection extends StatefulWidget {
  const ChartTabSection({super.key, required this.resultados});
  final Map<String, double> resultados;

  @override
  State<ChartTabSection> createState() => _ChartTabSectionState();
}

class _ChartTabSectionState extends State<ChartTabSection> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Análise gráfica',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  _TabChip(
                    label: 'Perfil',
                    emoji: '🕸️',
                    isSelected: _selected == 0,
                    onTap: () => setState(() => _selected = 0),
                  ),
                  _TabChip(
                    label: 'Barras',
                    emoji: '📊',
                    isSelected: _selected == 1,
                    onTap: () => setState(() => _selected = 1),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _selected == 0
              ? RiasecRadarChart(
                  key: const ValueKey('radar'),
                  resultados: widget.resultados,
                )
              : RiasecBarChart(
                  key: const ValueKey('bar'),
                  resultados: widget.resultados,
                ),
        ),
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 13)),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Colors.white
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
