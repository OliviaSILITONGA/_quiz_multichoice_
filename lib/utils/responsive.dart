import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  /// Ukuran dinamis berdasarkan sisi terpendek layar (di-clamp untuk tablet).
  double dp(double factor) {
    final base = MediaQuery.sizeOf(this).shortestSide
        .clamp(320.0, 600.0)
        .toDouble();
    return base * factor;
  }

  /// Layar lebar: tablet landscape, browser/desktop.
  bool get isWide => MediaQuery.sizeOf(this).width >= 840;
}
