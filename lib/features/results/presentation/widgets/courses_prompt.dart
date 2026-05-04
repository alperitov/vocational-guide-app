import 'package:flutter/material.dart';

// Widget de prompt para mostrar cursos
class CoursesPrompt extends StatelessWidget {
  const CoursesPrompt({
    required this.onShowCourses,
    required this.onRetakeTests,
  });
  final VoidCallback onShowCourses;
  final VoidCallback onRetakeTests;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text('🎓', style: TextStyle(fontSize: 36)),
          const SizedBox(height: 12),
          Text(
            'Queres ver os cursos recomendados?',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Com base no teu perfil, identificámos cursos disponíveis em Moçambique que combinam contigo.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onRetakeTests,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Refazer testes'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: onShowCourses,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Ver cursos'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
