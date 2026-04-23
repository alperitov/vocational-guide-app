import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../application/quiz_providers.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/light_theme.dart';
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

    ref.listen(quizNotifierProvider, (_, next) {
      if (next.isComplete) context.go(AppRoutes.results);
    });

    if (quizState.isLoading || quizState.session == null) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: lightGradientHeader),
          child: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    final progress = quizState.progress;
    final current = quizState.currentIndex + 1;
    final total = quizState.totalQuestions;

    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho com gradiente
          Container(
            decoration: const BoxDecoration(
              gradient: lightGradientHeader,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 12,
              left: 8,
              right: 24,
              bottom: 24,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    if (quizState.currentIndex > 0)
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => ref
                            .read(quizNotifierProvider.notifier)
                            .voltarPergunta(),
                      )
                    else
                      const SizedBox(width: 48),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Pergunta $current de $total',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${(progress * 100).toInt()}% completo',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.brain(),
                      color: Colors.white54,
                      size: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Barra de progresso
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xff8AE04A),
                      ),
                      minHeight: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Card da pergunta
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: QuestionCard(
                question: quizState.currentQuestion,
                selectedScore: quizState.currentAnswer,
                onScoreSelected: (score) =>
                    ref.read(quizNotifierProvider.notifier).responder(score),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
