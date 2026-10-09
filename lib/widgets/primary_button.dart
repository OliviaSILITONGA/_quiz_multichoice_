import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isOutlined;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(context.dp(0.035)),
    );
    final textStyle = TextStyle(
      fontSize: context.dp(0.04),
      fontWeight: FontWeight.w600,
    );

    final content = FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: context.dp(0.055)),
            SizedBox(width: context.dp(0.02)),
          ],
          Text(label),
        ],
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: context.dp(0.14),
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shape: shape,
                textStyle: textStyle,
              ),
              child: content,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shape: shape,
                textStyle: textStyle,
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: content,
            ),
    );
  }
}
