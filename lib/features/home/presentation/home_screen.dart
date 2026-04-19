import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../data/local/profile_repository.dart';
import '../../../features/auth/data/auth_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guivo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saudação
            Text(
              'Olá, ${user?.displayName?.split(' ').first ?? 'Estudante'} 👋',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Vamos descobrir o teu caminho profissional',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),

            // Card principal — iniciar quiz
            Card(
              elevation: 0,
              color: theme.colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.psychology_rounded,
                      size: 40,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Teste Vocacional',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Descobre as áreas profissionais mais adequadas ao teu perfil através do modelo RIASEC.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FilledButton.tonal(
                      onPressed: () => context.go(AppRoutes.quiz),
                      child: const Text('Iniciar teste'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Secção — O que é o RIASEC
            Text(
              'Como funciona?',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ..._riasecCards(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _riasecCards(BuildContext context) {
    final theme = Theme.of(context);
    final items = [
      (Icons.build_rounded, 'Realista', 'Trabalho prático e manual'),
      (
        Icons.science_rounded,
        'Investigativo',
        'Análise e resolução de problemas',
      ),
      (Icons.palette_rounded, 'Artístico', 'Criatividade e expressão'),
      (Icons.people_rounded, 'Social', 'Ajudar e ensinar pessoas'),
      (Icons.trending_up_rounded, 'Empreendedor', 'Liderança e negócios'),
      (Icons.list_alt_rounded, 'Convencional', 'Organização e dados'),
    ];

    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
          leading: Icon(item.$1, color: theme.colorScheme.primary),
          title: Text(
            item.$2,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(item.$3),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
        ),
      );
    }).toList();
  }
}
