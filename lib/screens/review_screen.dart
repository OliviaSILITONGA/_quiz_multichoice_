import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/page_container.dart';
import '../widgets/primary_button.dart';
import '../widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembahasan',
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
            Text(
              '${quiz.correctCount} dari ${quiz.totalQuestions} jawaban benar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.dp(0.042),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.dp(0.05)),
            for (var i = 0; i < quiz.totalQuestions; i++)
              ReviewCard(
                number: i + 1,
                question: quiz.questions[i],
                selectedIndex: quiz.answerAt(i),
              ),
            PrimaryButton(
              label: 'Kembali ke Skor',
              icon: Icons.arrow_back_rounded,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
