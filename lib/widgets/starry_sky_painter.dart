import 'dart:math';
import 'package:flutter/material.dart';

class StarrySkyPainter extends CustomPainter {
  final int starCount;
  final Color starColor;

  const StarrySkyPainter({
    this.starCount = 60,
    this.starColor = const Color(0x66FFFFFF),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = starColor;
    final rng = Random(7);

    for (int i = 0; i < starCount; i++) {
      final double x = rng.nextDouble() * size.width;
      final double y = rng.nextDouble() * size.height * 0.7;
      final double r = rng.nextDouble() * 1.2 + 0.3;
      final double opacity = 0.3 + rng.nextDouble() * 0.5;
      canvas.drawCircle(
        Offset(x, y),
        r,
        paint..color = starColor.withValues(alpha: opacity),
      );
    }
  }

  @override
  bool shouldRepaint(covariant StarrySkyPainter oldDelegate) =>
      starCount != oldDelegate.starCount || starColor != oldDelegate.starColor;
}
