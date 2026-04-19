import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_providers.dart';
import '../../../../data/models/student_profile.dart';
import '../../../../data/models/provincia.dart';

class StepAcademic extends ConsumerStatefulWidget {
  const StepAcademic({super.key});

  @override
  ConsumerState<StepAcademic> createState() => _StepAcademicState();
}

class _StepAcademicState extends ConsumerState<StepAcademic> {
  late final TextEditingController _escolaController;

  @override
  void initState() {
    super.initState();
    final escola = ref.read(onboardingNotifierProvider).escola ?? '';
    _escolaController = TextEditingController(text: escola);
  }

  @override
  void dispose() {
    _escolaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    final theme = Theme.of(context);

    final classeLabels = {
      Classe.decima: '10ª Classe',
      Classe.decimaPrimeira: '11ª Classe',
      Classe.decimaSegunda: '12ª Classe',
    };

    final areaLabels = {
      AreaEstudo.ciencias: '🔬 Ciências',
      AreaEstudo.letras: '📚 Letras',
      AreaEstudo.artes: '🎨 Artes',
      AreaEstudo.comercial: '💼 Comercial',
      AreaEstudo.outro: '🔄 Outro',
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dados académicos',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ajuda-nos a conhecer o teu percurso escolar',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          // Província
          DropdownButtonFormField<String>(
            initialValue: profile.provincia,
            decoration: InputDecoration(
              labelText: 'Província',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
            items: Provincias.lista
                .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                .toList(),
            onChanged: (v) => v != null ? notifier.updateProvincia(v) : null,
          ),
          const SizedBox(height: 20),

          // Escola
          TextFormField(
            controller: _escolaController,
            decoration: InputDecoration(
              labelText: 'Nome da escola',
              hintText: 'Ex: Escola Secundária da Matola',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
            onChanged: notifier.updateEscola,
          ),
          const SizedBox(height: 20),

          // Classe
          Text('Classe actual', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: Classe.values.map((c) {
              return ChoiceChip(
                label: Text(classeLabels[c]!),
                selected: profile.classe == c,
                onSelected: (_) => notifier.updateClasse(c),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Área de estudo
          Text('Área de estudo', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: AreaEstudo.values.map((a) {
              return ChoiceChip(
                label: Text(areaLabels[a]!),
                selected: profile.areaEstudo == a,
                onSelected: (_) => notifier.updateAreaEstudo(a),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
