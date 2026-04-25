import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/light_theme.dart';
import '../../../data/remote/feed_repository.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../features/onboarding/application/onboarding_providers.dart';
import '../../../features/results/application/results_providers.dart';
import '../../../features/results/presentation/widgets/results_constants.dart';
import 'widgets/feed_card.dart';

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
    final feedAsync = ref.watch(feedStreamProvider);
    final theme = Theme.of(context);

    ref.listen(onboardingCompletoProvider, (_, next) {
      next.whenData((completou) {
        if (!completou && context.mounted) {
          context.go(AppRoutes.onboarding);
        }
      });
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Cabeçalho
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: lightGradientHeader,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.go(AppRoutes.profile),
                        child:
                            photoAsync.whenOrNull(
                              data: (path) => path != null
                                  ? CircleAvatar(
                                      radius: 22,
                                      backgroundImage: FileImage(File(path)),
                                    )
                                  : null,
                            ) ??
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: const Color(0xffFFA95C),
                              child: Text(
                                _getInitials(user?.displayName),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
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
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              user?.displayName?.split(' ').first ??
                                  'Estudante',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: PhosphorIcon(
                          PhosphorIcons.bell(),
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Card do perfil/teste
                  sessionAsync.when(
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                    data: (session) {
                      final temResultados =
                          session != null && session.resultados.isNotEmpty;

                      if (temResultados) {
                        final sorted = session.resultados.entries.toList()
                          ..sort((a, b) => b.value.compareTo(a.value));
                        final topDim = sorted.first.key;
                        final topColor = dimensaoCores[topDim] ?? primaryColor;

                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                dimensaoEmojis[topDim] ?? '🎯',
                                style: const TextStyle(fontSize: 36),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'O teu perfil',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      dimensaoNomes[topDim] ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () => context.go(AppRoutes.results),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.white54),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                ),
                                child: const Text(
                                  'Ver',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text('🎯', style: TextStyle(fontSize: 32)),
                            const SizedBox(width: 14),
                            const Expanded(
                              child: Text(
                                'Faz o teste e descobre o teu perfil vocacional',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => context.go(AppRoutes.quiz),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff8AE04A),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                              child: const Text(
                                'Iniciar',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Feed
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Novidades',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      PhosphorIcon(
                        PhosphorIcons.newspaper(),
                        color: theme.colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  feedAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(
                      child: Column(
                        children: [
                          PhosphorIcon(
                            PhosphorIcons.wifiX(),
                            size: 40,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sem conexão ao feed',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    data: (posts) {
                      if (posts.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              children: [
                                const Text(
                                  '📭',
                                  style: TextStyle(fontSize: 48),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Nenhuma publicação ainda',
                                  style: theme.textTheme.titleSmall,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'As instituições publicarão editais, bolsas e eventos aqui',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Column(
                        children: posts
                            .map((post) => FeedCard(post: post))
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
