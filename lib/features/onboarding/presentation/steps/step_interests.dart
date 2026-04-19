import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_providers.dart';

class StepInterests extends ConsumerWidget {
  const StepInterests({super.key});

  static const _interesses = [
    ('💻', 'Tecnologia'),
    ('🏥', 'Saúde'),
    ('📐', 'Engenharia'),
    ('🎓', 'Educação'),
    ('⚖️', 'Direito'),
    ('💰', 'Negócios'),
    ('🌱', 'Ambiente'),
    ('🎨', 'Artes e Design'),
    ('✈️', 'Turismo'),
    ('🌾', 'Agricultura'),
    ('🔬', 'Ciências'),
    ('📰', 'Jornalismo'),
    ('🏗️', 'Construção'),
    ('🤝', 'Serviço Social'),
    ('⚽', 'Desporto'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interesses = ref.watch(
      onboardingNotifierProvider.select((p) => p.interesses),
    );
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Os teus interesses',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Selecciona as áreas que mais te interessam',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${interesses.length} seleccionado(s)',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _interesses.map((item) {
              final emoji = item.$1;
              final label = item.$2;
              final selected = interesses.contains(label);
              return FilterChip(
                avatar: Text(emoji),
                label: Text(label),
                selected: selected,
                onSelected: (_) => notifier.toggleInteresse(label),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
