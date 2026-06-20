import 'package:flutter/material.dart';

class MosqueSilhouettePainter extends CustomPainter {
  final Color color;

  const MosqueSilhouettePainter({this.color = const Color(0xFF00332B)});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;
    final baseY = h * 0.92;

    final path = Path();

    // Ground line
    path.moveTo(0, baseY);

    // Left minaret
    _drawMinaret(path, w * 0.12, baseY, w * 0.018, h * 0.55);

    // Left smaller dome cluster
    _drawDome(path, w * 0.27, baseY, w * 0.06, h * 0.16);
    path.lineTo(w * 0.32, baseY);

    // Central main dome base
    path.lineTo(w * 0.36, baseY);
    path.lineTo(w * 0.36, h * 0.62);
    // Central main dome (onion dome)
    _drawOnionDome(path, w * 0.5, h * 0.62, w * 0.14, h * 0.24);
    path.lineTo(w * 0.64, baseY);

    // Right smaller dome cluster
    _drawDome(path, w * 0.73, baseY, w * 0.06, h * 0.16);
    path.lineTo(w * 0.78, baseY);

    // Central finial above main dome
    _drawFinial(path, w * 0.5, h * 0.38, w * 0.008, h * 0.05);

    // Right minaret
    _drawMinaret(path, w * 0.88, baseY, w * 0.018, h * 0.55);

    // Close along ground to right edge
    path.lineTo(w, baseY);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  void _drawMinaret(Path path, double cx, double baseY, double halfW, double topY) {
    // Shaft
    path.lineTo(cx - halfW, baseY);
    path.lineTo(cx - halfW, topY + halfW * 2);
    // Balcony
    path.lineTo(cx - halfW * 1.6, topY + halfW * 2);
    path.lineTo(cx - halfW * 1.6, topY + halfW);
    path.lineTo(cx - halfW, topY + halfW);
    // Tapered top to point
    path.lineTo(cx, topY);
    path.lineTo(cx + halfW, topY + halfW);
    path.lineTo(cx + halfW * 1.6, topY + halfW);
    path.lineTo(cx + halfW * 1.6, topY + halfW * 2);
    path.lineTo(cx + halfW, topY + halfW * 2);
    path.lineTo(cx + halfW, baseY);
  }

  void _drawDome(Path path, double cx, double baseY, double halfW, double domeH) {
    final topY = baseY - domeH;
    path.lineTo(cx - halfW, baseY);
    path.lineTo(cx - halfW, baseY - domeH * 0.15);
    path.quadraticBezierTo(cx, topY - domeH * 0.25, cx + halfW, baseY - domeH * 0.15);
    path.lineTo(cx + halfW, baseY);
  }

  void _drawOnionDome(Path path, double cx, double baseY, double halfW, double domeH) {
    final neckY = baseY - domeH * 0.12;
    final crownY = baseY - domeH * 0.85;
    path.lineTo(cx - halfW, baseY);
    path.lineTo(cx - halfW, neckY);
    // Bulge out then up to crown
    path.quadraticBezierTo(
      cx - halfW * 1.5,
      baseY - domeH * 0.45,
      cx,
      crownY,
    );
    path.quadraticBezierTo(
      cx + halfW * 1.5,
      baseY - domeH * 0.45,
      cx + halfW,
      neckY,
    );
    path.lineTo(cx + halfW, baseY);
  }

  void _drawFinial(Path path, double cx, double baseY, double halfW, double h) {
    path.moveTo(cx - halfW, baseY);
    path.lineTo(cx - halfW, baseY - h * 0.4);
    path.lineTo(cx, baseY - h);
    path.lineTo(cx + halfW, baseY - h * 0.4);
    path.lineTo(cx + halfW, baseY);
  }

  @override
  bool shouldRepaint(covariant MosqueSilhouettePainter oldDelegate) =>
      color != oldDelegate.color;
}
