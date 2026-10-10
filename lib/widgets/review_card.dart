import 'package:flutter/material.dart';

import '../models/question.dart';
import '../utils/responsive.dart';

class ReviewCard extends StatelessWidget {
  final int number;
  final Question question;
  final int? selectedIndex;

  const ReviewCard({
    super.key,
    required this.number,
    required this.question,
    required this.selectedIndex,
  });

  bool get _isCorrect => selectedIndex == question.correctIndex;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final statusColor = _isCorrect ? Colors.green.shade600 : scheme.error;

    return Container(
      margin: EdgeInsets.only(bottom: context.dp(0.05)),
      padding: EdgeInsets.all(context.dp(0.045)),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(context.dp(0.045)),
        border: Border.all(color: statusColor.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Soal $number',
                  style: TextStyle(
                    fontSize: context.dp(0.037),
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ),
              _StatusChip(isCorrect: _isCorrect, color: statusColor),
            ],
          ),
          SizedBox(height: context.dp(0.025)),
          Text(
            question.text,
            style: TextStyle(
              fontSize: context.dp(0.043),
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          SizedBox(height: context.dp(0.035)),
          for (var i = 0; i < question.options.length; i++)
            _OptionRow(
              label: String.fromCharCode(65 + i),
              text: question.options[i],
              isCorrectOption: i == question.correctIndex,
              isSelected: i == selectedIndex,
            ),
          SizedBox(height: context.dp(0.01)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.dp(0.04)),
            decoration: BoxDecoration(
              color: scheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(context.dp(0.035)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!_isCorrect && selectedIndex != null) ...[
                  _ExplanationLine(
                    icon: Icons.cancel_rounded,
                    color: scheme.error,
                    title: 'Kenapa jawabanmu salah',
                    text: question.optionExplanations[selectedIndex!],
                  ),
                  SizedBox(height: context.dp(0.03)),
                ],
                _ExplanationLine(
                  icon: Icons.check_circle_rounded,
                  color: Colors.green.shade600,
                  title: 'Kenapa jawaban ini benar',
                  text: question.optionExplanations[question.correctIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isCorrect;
  final Color color;

  const _StatusChip({required this.isCorrect, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.dp(0.03),
        vertical: context.dp(0.012),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(context.dp(0.05)),
      ),
      child: Text(
        isCorrect ? 'Benar' : 'Salah',
        style: TextStyle(
          fontSize: context.dp(0.035),
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  final String label;
  final String text;
  final bool isCorrectOption;
  final bool isSelected;

  const _OptionRow({
    required this.label,
    required this.text,
    required this.isCorrectOption,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isWrongSelected = isSelected && !isCorrectOption;

    Color borderColor = scheme.outlineVariant;
    Color? bgColor;
    IconData? icon;
    Color? iconColor;

    if (isCorrectOption) {
      borderColor = Colors.green.shade600;
      bgColor = Colors.green.shade50;
      icon = Icons.check_circle_rounded;
      iconColor = Colors.green.shade600;
    } else if (isWrongSelected) {
      borderColor = scheme.error;
      bgColor = scheme.errorContainer.withValues(alpha: 0.4);
      icon = Icons.cancel_rounded;
      iconColor = scheme.error;
    }

    return Container(
      margin: EdgeInsets.only(bottom: context.dp(0.02)),
      padding: EdgeInsets.all(context.dp(0.03)),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(context.dp(0.03)),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Text(
            '$label.',
            style: TextStyle(
              fontSize: context.dp(0.038),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: context.dp(0.025)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontSize: context.dp(0.038))),
                if (isSelected)
                  Text(
                    'Jawabanmu',
                    style: TextStyle(
                      fontSize: context.dp(0.031),
                      fontWeight: FontWeight.w600,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
          if (icon != null)
            Icon(icon, color: iconColor, size: context.dp(0.06)),
        ],
      ),
    );
  }
}

class _ExplanationLine extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String text;

  const _ExplanationLine({
    required this.icon,
    required this.color,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: context.dp(0.055)),
        SizedBox(width: context.dp(0.025)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: context.dp(0.037),
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
              SizedBox(height: context.dp(0.008)),
              Text(
                text,
                style: TextStyle(fontSize: context.dp(0.037), height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
