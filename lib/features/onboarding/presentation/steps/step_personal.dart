import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_providers.dart';
import '../../../../data/models/student_profile.dart';

class StepPersonal extends ConsumerWidget {
  const StepPersonal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dados pessoais',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Conta-nos um pouco sobre ti',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          // Mostra o nome mas não permite editar aqui
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      profile.nome.isNotEmpty ? profile.nome : 'Não definido',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Data de nascimento
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: theme.colorScheme.outline),
            ),
            title: Text(
              profile.dataNascimento == null
                  ? 'Data de nascimento'
                  : '${profile.dataNascimento!.day}/${profile.dataNascimento!.month}/${profile.dataNascimento!.year}',
              style: profile.dataNascimento == null
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    )
                  : null,
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final data = await showDatePicker(
                context: context,
                initialDate: DateTime(2005),
                firstDate: DateTime(1990),
                lastDate: DateTime.now(),
              );
              if (data != null) notifier.updateDataNascimento(data);
            },
          ),
          const SizedBox(height: 20),

          // Género
          Text('Género', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: Genero.values.map((g) {
              final labels = {
                Genero.masculino: 'Masculino',
                Genero.feminino: 'Feminino',
                Genero.prefiroNaoDizer: 'Prefiro não dizer',
              };
              return ChoiceChip(
                label: Text(labels[g]!),
                selected: profile.genero == g,
                onSelected: (_) => notifier.updateGenero(g),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
