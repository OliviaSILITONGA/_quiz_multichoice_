import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/answer_option.dart';
import '../widgets/page_container.dart';
import '../widgets/primary_button.dart';
import '../widgets/question_card.dart';
import '../widgets/quiz_progress_bar.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  void _finish(BuildContext context) {
    context.read<QuizProvider>().finish();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final question = quiz.currentQuestion;

    VoidCallback? nextAction;
    if (quiz.hasAnswered) {
      nextAction = quiz.isLastQuestion ? () => _finish(context) : quiz.next;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo, ${quiz.userName}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: context.dp(0.048),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: PageContainer(
        centerVertically: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuizProgressBar(
              current: quiz.currentIndex + 1,
              total: quiz.totalQuestions,
            ),
            SizedBox(height: context.dp(0.05)),
            QuestionCard(text: question.text),
            SizedBox(height: context.dp(0.05)),
            for (var i = 0; i < question.options.length; i++)
              AnswerOption(
                label: String.fromCharCode(65 + i),
                text: question.options[i],
                isSelected: quiz.selectedAnswer == i,
                onTap: () => quiz.selectAnswer(i),
              ),
            SizedBox(height: context.dp(0.03)),
            Row(
              children: [
                if (!quiz.isFirstQuestion) ...[
                  Expanded(
                    child: PrimaryButton(
                      label: 'Sebelumnya',
                      icon: Icons.arrow_back_rounded,
                      isOutlined: true,
                      onPressed: quiz.previous,
                    ),
                  ),
                  SizedBox(width: context.dp(0.03)),
                ],
                Expanded(
                  child: PrimaryButton(
                    label: quiz.isLastQuestion ? 'Selesai' : 'Selanjutnya',
                    icon: quiz.isLastQuestion
                        ? Icons.flag_rounded
                        : Icons.arrow_forward_rounded,
                    onPressed: nextAction,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
