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

  static const _scaleOptions = [
    (
      score: 1,
      label: 'Discordo totalmente',
      emoji: '😕',
      color: Color(0xffF44336),
    ),
    (score: 2, label: 'Discordo', emoji: '🤔', color: Color(0xffFF9800)),
    (score: 3, label: 'Neutro', emoji: '😐', color: Color(0xffFFC107)),
    (score: 4, label: 'Concordo', emoji: '🙂', color: Color(0xff8BC34A)),
    (
      score: 5,
      label: 'Concordo totalmente',
      emoji: '😄',
      color: Color(0xff4CAF50),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Pergunta — ocupa o espaço disponível
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              question.texto,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                height: 1.5,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // Instrução
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            'Como te identificas com esta afirmação?',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Opções verticais
        Expanded(
          flex: 3,
          child: Column(
            children: _scaleOptions.map((option) {
              final isSelected = selectedScore == option.score;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: GestureDetector(
                    onTap: () => onScoreSelected(option.score),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? option.color
                            : option.color.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? option.color
                              : option.color.withValues(alpha: 0.25),
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: option.color.withValues(alpha: 0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          // Número
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white.withValues(alpha: 0.25)
                                  : option.color.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${option.score}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: isSelected
                                      ? Colors.white
                                      : option.color,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Label
                          Expanded(
                            child: Text(
                              option.label,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: isSelected
                                    ? Colors.white
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          // Emoji
                          Text(
                            option.emoji,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
