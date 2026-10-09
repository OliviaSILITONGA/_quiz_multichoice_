import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class AnswerOption extends StatelessWidget {
  final String label;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.label,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(context.dp(0.035));

    return Padding(
      padding: EdgeInsets.only(bottom: context.dp(0.03)),
      child: Material(
        color: isSelected ? scheme.primaryContainer : scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: isSelected ? scheme.primary : scheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(context.dp(0.04)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: context.dp(0.04),
                  backgroundColor: isSelected
                      ? scheme.primary
                      : scheme.surfaceContainerHighest,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: context.dp(0.035),
                      fontWeight: FontWeight.w700,
                      color: isSelected ? scheme.onPrimary : scheme.onSurface,
                    ),
                  ),
                ),
                SizedBox(width: context.dp(0.03)),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: context.dp(0.04)),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: scheme.primary,
                    size: context.dp(0.06),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
