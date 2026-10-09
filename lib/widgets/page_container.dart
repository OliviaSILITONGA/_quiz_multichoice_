import 'package:flutter/material.dart';

import '../utils/responsive.dart';

/// Pembungkus halaman: aman dari notch, bisa di-scroll (anti overflow,
/// termasuk saat landscape), dan lebarnya dibatasi di layar besar.
class PageContainer extends StatelessWidget {
  final Widget child;
  final bool centerVertically;

  const PageContainer({
    super.key,
    required this.child,
    this.centerVertically = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: centerVertically ? Alignment.center : Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.dp(0.06)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: child,
          ),
        ),
      ),
    );
  }
}
