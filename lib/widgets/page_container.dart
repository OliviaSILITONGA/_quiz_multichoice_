import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final bool centerVertically;
  final double? maxWidth;

  const PageContainer({
    super.key,
    required this.child,
    this.centerVertically = true,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final width = maxWidth ?? (context.isWide ? 1000.0 : 600.0);

    return SafeArea(
      child: Align(
        alignment: centerVertically ? Alignment.center : Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.dp(0.06)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: child,
          ),
        ),
      ),
    );
  }
}
