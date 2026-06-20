import 'package:flutter/material.dart';

class CloudsLayer extends StatelessWidget {
  const CloudsLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: size.height * 0.35,
      child: Stack(
        children: [
          _cloud(
            top: size.height * 0.12,
            left: -size.width * 0.1,
            width: size.width * 0.6,
            opacity: 0.10,
          ),
          _cloud(
            top: size.height * 0.18,
            right: -size.width * 0.1,
            width: size.width * 0.7,
            opacity: 0.08,
          ),
          _cloud(
            top: size.height * 0.06,
            left: size.width * 0.25,
            width: size.width * 0.5,
            opacity: 0.06,
          ),
        ],
      ),
    );
  }

  Widget _cloud({
    double? top,
    double? left,
    double? right,
    required double width,
    required double opacity,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: width,
        height: width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.3),
          color: Colors.tealAccent.withValues(alpha: opacity),
          boxShadow: [
            BoxShadow(
              color: Colors.tealAccent.withValues(alpha: opacity * 0.6),
              blurRadius: width * 0.25,
              spreadRadius: width * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
