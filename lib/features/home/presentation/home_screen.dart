import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/light_theme.dart';
import '../../../data/models/quiz_models.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../features/onboarding/application/onboarding_providers.dart';
import '../../../features/results/application/results_providers.dart';
import '../../../features/results/presentation/widgets/results_constants.dart';

// Provider para foto local
final _homePhotoProvider = FutureProvider.autoDispose<String?>((ref) async {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('photo_${user.uid}');
});

String _getInitials(String? displayName) {
  if (displayName == null || displayName.isEmpty) return 'E';
  final parts = displayName.trim().split(' ');
  if (parts.length == 1) return parts[0][0].toUpperCase();
  return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    final sessionAsync = ref.watch(latestQuizSessionProvider);
    final photoAsync = ref.watch(_homePhotoProvider);
    final theme = Theme.of(context);

    ref.listen(onboardingCompletoProvider, (_, next) {
      next.whenData((completou) {
        if (!completou && context.mounted) {
          context.go(AppRoutes.onboarding);
        }
      });
    });

    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho
          Container(
            decoration: const BoxDecoration(
              gradient: lightGradientHeader,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: Row(
              children: [
                // Avatar → abre perfil
                GestureDetector(
                  onTap: () => context.go(AppRoutes.profile),
                  child:
                      photoAsync.whenOrNull(
                        data: (path) => path != null
                            ? CircleAvatar(
                                radius: 24,
                                backgroundImage: FileImage(File(path)),
                              )
                            : null,
                      ) ??
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xffFFA95C),
                        child: Text(
                          _getInitials(user?.displayName),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bem-vindo',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      Text(
                        user?.displayName?.split(' ').first ?? 'Estudante',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Conteúdo
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card principal
                  sessionAsync.when(
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                    data: (session) {
                      final temResultados =
                          session != null && session.resultados.isNotEmpty;

                      if (temResultados) {
                        // Mostra o perfil dominante
                        final sorted = session.resultados.entries.toList()
                          ..sort((a, b) => b.value.compareTo(a.value));
                        final topDim = sorted.first.key;
                        final topColor = dimensaoCores[topDim] ?? primaryColor;

                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                topColor,
                                topColor.withValues(alpha: 0.7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'O teu perfil',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${dimensaoEmojis[topDim]} ${dimensaoNomes[topDim]}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    OutlinedButton(
                                      onPressed: () =>
                                          context.go(AppRoutes.results),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        side: const BorderSide(
                                          color: Colors.white54,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text(
                                        'Ver resultados',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                dimensaoEmojis[topDim] ?? '🎯',
                                style: const TextStyle(fontSize: 56),
                              ),
                            ],
                          ),
                        );
                      }

                      // Sem resultados — convida a fazer o teste
                      return Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff6155F5), Color(0xff9B8FF8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Descobre a melhor carreira para o teu perfil',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () => context.go(AppRoutes.quiz),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff8AE04A),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'Fazer Teste',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text('🎯', style: TextStyle(fontSize: 56)),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Secção RIASEC informativa
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perfis vocacionais',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...dimensaoNomes.entries.map((entry) {
                    final cor =
                        dimensaoCores[entry.key] ?? theme.colorScheme.primary;
                    final emoji = dimensaoEmojis[entry.key] ?? '🎯';
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: cor.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: cor.withValues(alpha: 0.2)),
                        ),
                        child: Row(
                          children: [
                            Text(emoji, style: const TextStyle(fontSize: 22)),
                            const SizedBox(width: 12),
                            Text(
                              entry.value,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
