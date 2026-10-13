import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class AdaptiveTwoPane extends StatelessWidget {
  final Widget first;
  final Widget second;
  final CrossAxisAlignment crossAxisAlignment;

  const AdaptiveTwoPane({
    super.key,
    required this.first,
    required this.second,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    if (!context.isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          first,
          SizedBox(height: context.dp(0.05)),
          second,
        ],
      );
    }
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Expanded(child: first),
        SizedBox(width: context.dp(0.08)),
        Expanded(child: second),
      ],
    );
  }
}
