import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/nav_item.dart';
import 'package:go_router/go_router.dart';

class MainShell extends ConsumerWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/explore') || location.startsWith('/favorites')) {
      return 1;
    }
    if (location.startsWith('/tests') ||
        location.startsWith('/history') ||
        location.startsWith('/quiz') ||
        location.startsWith('/results')) {
      return 2;
    }
    if (location.startsWith('/profile')) return 3;

    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = _currentIndex(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const accent = Color(0xff8AE04A);
    final inactive = isDark ? const Color(0xff666666) : const Color(0xffAAAAAA);
    final bgColor = isDark ? const Color(0xff1E1E2E) : const Color(0xffF8F8FF);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : const Color(0xff6155F5).withValues(alpha: 0.12),
              blurRadius: isDark ? 16 : 20,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                NavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  label: 'Início',
                  isActive: currentIndex == 0,
                  accent: accent,
                  inactive: inactive,
                  onTap: () => context.go('/home'),
                ),
                NavItem(
                  icon: Icons.explore_outlined,
                  activeIcon: Icons.explore_rounded,
                  label: 'Explorar',
                  isActive: currentIndex == 1,
                  accent: accent,
                  inactive: inactive,
                  onTap: () => context.go('/explore'),
                ),
                NavItem(
                  icon: Icons.quiz_outlined,
                  activeIcon: Icons.quiz_rounded,
                  label: 'Testes',
                  isActive: currentIndex == 2,
                  accent: accent,
                  inactive: inactive,
                  onTap: () => context.go('/tests'),
                ),
                NavItem(
                  icon: Icons.person_outline_rounded,
                  activeIcon: Icons.person_rounded,
                  label: 'Perfil',
                  isActive: currentIndex == 3,
                  accent: accent,
                  inactive: inactive,
                  onTap: () => context.go('/profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
