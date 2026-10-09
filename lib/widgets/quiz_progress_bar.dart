import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class QuizProgressBar extends StatelessWidget {
  final int current; // mulai dari 1
  final int total;

  const QuizProgressBar({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Soal $current dari $total',
              style: TextStyle(
                fontSize: context.dp(0.037),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${(current / total * 100).round()}%',
              style: TextStyle(
                fontSize: context.dp(0.037),
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: context.dp(0.02)),
        ClipRRect(
          borderRadius: BorderRadius.circular(context.dp(0.02)),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: context.dp(0.025),
          ),
        ),
      ],
    );
  }
}
