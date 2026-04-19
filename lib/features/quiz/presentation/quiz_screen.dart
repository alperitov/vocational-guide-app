import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/quiz_providers.dart';
import '../../../core/router/app_router.dart';
import 'widgets/question_card.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(quizNotifierProvider.notifier).iniciarQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizNotifierProvider);
    final theme = Theme.of(context);

    // Navega para resultados quando completo
    ref.listen(quizNotifierProvider, (_, next) {
      if (next.isComplete) context.go(AppRoutes.results);
    });

    if (quizState.isLoading || quizState.session == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pergunta ${quizState.currentIndex + 1} de ${quizState.totalQuestions}',
        ),
        leading: quizState.currentIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () =>
                    ref.read(quizNotifierProvider.notifier).voltarPergunta(),
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Barra de progresso
              LinearProgressIndicator(
                value: quizState.progress,
                borderRadius: BorderRadius.circular(8),
                minHeight: 8,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${(quizState.progress * 100).toInt()}% completo',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Card da pergunta
              Expanded(
                child: QuestionCard(
                  question: quizState.currentQuestion,
                  selectedScore: quizState.currentAnswer,
                  onScoreSelected: (score) =>
                      ref.read(quizNotifierProvider.notifier).responder(score),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
