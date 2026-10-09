import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class QuestionCard extends StatelessWidget {
  final String text;

  const QuestionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(context.dp(0.05)),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(context.dp(0.045)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: context.dp(0.03),
            offset: Offset(0, context.dp(0.01)),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.help_outline_rounded,
            color: scheme.primary,
            size: context.dp(0.07),
          ),
          SizedBox(width: context.dp(0.03)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: context.dp(0.047),
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
