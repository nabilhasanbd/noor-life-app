import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Draws the multi-colored Google "G" logo using a CustomPainter,
/// so no external asset is required.
class GoogleLogo extends StatelessWidget {
  final double size;

  const GoogleLogo({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  static const Color _blue = Color(0xFF4285F4);
  static const Color _red = Color(0xFFEA4335);
  static const Color _yellow = Color(0xFFFBBC05);
  static const Color _green = Color(0xFF34A853);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    final strokeWidth = size.width * 0.18;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Blue arc (top-right)
    paint.color = _blue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.78),
      _radians(285),
      _radians(140),
      false,
      paint,
    );

    // Red arc (top-left)
    paint.color = _red;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.78),
      _radians(65),
      _radians(140),
      false,
      paint,
    );

    // Yellow arc (bottom-left)
    paint.color = _yellow;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.78),
      _radians(205),
      _radians(80),
      false,
      paint,
    );

    // Green arc (bottom-right)
    paint.color = _green;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.78),
      _radians(5),
      _radians(60),
      false,
      paint,
    );

    // Horizontal bar (the G's stem)
    final barPaint = Paint()
      ..color = _blue
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy * 0.25),
          width: size.width * 0.42,
          height: size.height * 0.18,
        ),
        Radius.circular(strokeWidth * 0.5),
      ),
      barPaint,
    );
  }

  double _radians(double degrees) => degrees * math.pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
