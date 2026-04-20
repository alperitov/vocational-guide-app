import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guivo/features/quiz/presentation/quiz_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/home/presentation/main_shell.dart';
import '../../features/onboarding/application/onboarding_providers.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/results/presentation/history_screen.dart';
import '../../features/results/presentation/results_screen.dart';

part 'app_router.g.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const quiz = '/quiz';
  static const results = '/results';
  static const profile = '/profile';
  static const history = '/history';
}

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authStateChangesProvider);
  final onboardingState = ref.watch(onboardingCompletoProvider);

  return GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) {
      // Enquanto o auth ainda está a carregar, não redireciona
      if (authState.isLoading) return null;

      final isLoggedIn = authState.valueOrNull != null;
      final isAuthRoute =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register;
      final isOnboardingRoute = state.matchedLocation == AppRoutes.onboarding;

      if (!isLoggedIn && !isAuthRoute) return AppRoutes.login;

      if (isLoggedIn && isAuthRoute) {
        // Enquanto o onboarding ainda está a carregar, aguarda
        if (onboardingState.isLoading) return null;
        final completou = onboardingState.valueOrNull ?? false;
        return completou ? AppRoutes.home : AppRoutes.onboarding;
      }

      if (isLoggedIn && !isOnboardingRoute && !isAuthRoute) {
        if (onboardingState.isLoading) return null;
        final completou = onboardingState.valueOrNull ?? false;
        if (!completou) return AppRoutes.onboarding;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.quiz,
            builder: (context, state) => const QuizScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: AppRoutes.results,
            builder: (context, state) => const ResultsScreen(),
          ),
          GoRoute(
            path: AppRoutes.history,
            builder: (context, state) => const HistoryScreen(),
          ),
        ],
      ),
    ],
  );
}
