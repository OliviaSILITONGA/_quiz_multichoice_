import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/page_container.dart';
import '../widgets/primary_button.dart';
import 'quiz_screen.dart';
import 'review_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  void _openReview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ReviewScreen()),
    );
  }

  void _retry(BuildContext context) {
    final quiz = context.read<QuizProvider>();
    quiz.startQuiz(quiz.userName);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  void _goHome(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  String _message(int score) {
    if (score >= 80) return 'Luar biasa! Pemahamanmu sangat baik.';
    if (score >= 60) return 'Bagus! Sedikit lagi pasti sempurna.';
    return 'Tetap semangat, coba ulangi kuisnya!';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: PageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.emoji_events_rounded,
              size: context.dp(0.28),
              color: Colors.amber.shade600,
            ),
            SizedBox(height: context.dp(0.03)),
            Text(
              'Kuis Selesai!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.dp(0.065),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: context.dp(0.01)),
            Text(
              quiz.userName,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: context.dp(0.045),
                color: scheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: context.dp(0.05)),
            Container(
              padding: EdgeInsets.all(context.dp(0.06)),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(context.dp(0.05)),
              ),
              child: Column(
                children: [
                  Text(
                    'Skor Akhir',
                    style: TextStyle(fontSize: context.dp(0.04)),
                  ),
                  Text(
                    '${quiz.score}',
                    style: TextStyle(
                      fontSize: context.dp(0.18),
                      fontWeight: FontWeight.w700,
                      color: scheme.primary,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    '${quiz.correctCount} dari ${quiz.totalQuestions} jawaban benar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.dp(0.04),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.dp(0.04)),
            Text(
              _message(quiz.score),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: context.dp(0.04)),
            ),
            SizedBox(height: context.dp(0.06)),
            PrimaryButton(
              label: 'Lihat Pembahasan',
              icon: Icons.menu_book_rounded,
              onPressed: () => _openReview(context),
            ),
            SizedBox(height: context.dp(0.03)),
            PrimaryButton(
              label: 'Ulangi Kuis',
              icon: Icons.refresh_rounded,
              isOutlined: true,
              onPressed: () => _retry(context),
            ),
            SizedBox(height: context.dp(0.03)),
            PrimaryButton(
              label: 'Kembali ke Beranda',
              icon: Icons.home_rounded,
              isOutlined: true,
              onPressed: () => _goHome(context),
            ),
          ],
        ),
      ),
    );
  }
}
