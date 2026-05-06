import 'package:flutter/material.dart';

class TestResultsSection extends StatelessWidget {
  const TestResultsSection({
    super.key,
    required this.titulo,
    required this.emoji,
    required this.resultados,
    required this.nomes,
    required this.emojis,
    required this.cores,
  });

  final String titulo;
  final String emoji;
  final Map<String, double> resultados;
  final Map<String, String> nomes;
  final Map<String, String> emojis;
  final Map<String, Color> cores;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sorted = resultados.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final top3 = sorted.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            Text(
              titulo,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...top3.map((entry) {
          final cor = cores[entry.key] ?? theme.colorScheme.primary;
          final nome = nomes[entry.key] ?? entry.key;
          final emojiStr = emojis[entry.key] ?? '';

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text(emojiStr, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
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
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            '${entry.value.toStringAsFixed(0)}%',
                            style: TextStyle(
                              color: cor,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: entry.value / 100,
                          backgroundColor: cor.withValues(alpha: 0.12),
                          valueColor: AlwaysStoppedAnimation(cor),
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
