import 'package:flutter/material.dart';
import '../../../../data/models/quiz_models.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.selectedScore,
    required this.onScoreSelected,
  });

  final QuizQuestion question;
  final int? selectedScore;
  final ValueChanged<int> onScoreSelected;

  static const _labels = [
    'Discordo\ntotalmente',
    'Discordo',
    'Neutro',
    'Concordo',
    'Concordo\ntotalmente',
  ];
  static const _dimensaoLabels = {
    RiasecDimension.realista: ('🔧', 'Realista'),
    RiasecDimension.investigativo: ('🔬', 'Investigativo'),
    RiasecDimension.artistico: ('🎨', 'Artístico'),
    RiasecDimension.social: ('🤝', 'Social'),
    RiasecDimension.empreendedor: ('🚀', 'Empreendedor'),
    RiasecDimension.convencional: ('📋', 'Convencional'),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dimInfo = _dimensaoLabels[question.dimensao]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Badge da dimensão
        Align(
          alignment: Alignment.centerLeft,
          child: Chip(
            avatar: Text(dimInfo.$1),
            label: Text(dimInfo.$2),
            backgroundColor: theme.colorScheme.secondaryContainer,
          ),
        ),
        const SizedBox(height: 24),

        // Texto da pergunta
        Text(
          question.texto,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const Spacer(),

        // Escala 1 a 5
        Text(
          'Como te identificas com esta afirmação?',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (i) {
            final score = i + 1;
            final isSelected = selectedScore == score;
            return GestureDetector(
              onTap: () => onScoreSelected(score),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 56,
                height: 72,
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$score',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _labels[i],
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurfaceVariant,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
