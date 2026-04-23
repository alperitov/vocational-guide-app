import 'package:flutter/material.dart';
import 'results_constants.dart';

class TopDimensions extends StatelessWidget {
  const TopDimensions({super.key, required this.resultados});

  final Map<String, double> resultados;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sorted = resultados.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'As tuas 3 dimensões principais',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 16),
        ...sorted.take(3).map((entry) {
          final cor = dimensaoCores[entry.key] ?? theme.colorScheme.primary;
          final emoji = dimensaoEmojis[entry.key] ?? '🎯';
          final nome = dimensaoNomes[entry.key] ?? entry.key;
          final percent = entry.value.toStringAsFixed(0);

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cor.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: cor.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  Text(emoji, style: const TextStyle(fontSize: 28)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '$percent%',
                              style: TextStyle(
                                color: cor,
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: entry.value / 100,
                            backgroundColor: cor.withValues(alpha: 0.15),
                            valueColor: AlwaysStoppedAnimation(cor),
                            minHeight: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
