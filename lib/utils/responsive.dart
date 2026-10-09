import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  /// Ukuran dinamis berdasarkan sisi terpendek layar, jadi tetap konsisten
  /// saat rotasi. Di-clamp supaya tidak terlalu kecil/besar di tablet.
  double dp(double factor) {
    final base = MediaQuery.sizeOf(this).shortestSide
        .clamp(320.0, 600.0)
        .toDouble();
    return base * factor;
  }
}
