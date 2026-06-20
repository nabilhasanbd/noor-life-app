import 'package:flutter/material.dart';

class CrescentMoon extends StatelessWidget {
  final Color color;
  final double size;

  const CrescentMoon({
    super.key,
    this.color = const Color(0x5580CBC4),
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Full disc
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.5),
                  blurRadius: size * 0.5,
                  spreadRadius: size * 0.05,
                ),
              ],
            ),
          ),
          // Offset disc to carve crescent (background color)
          Transform.translate(
            offset: Offset(size * 0.28, -size * 0.05),
            child: Container(
              width: size * 0.92,
              height: size * 0.92,
              decoration: const BoxDecoration(
                color: Color(0xFF004D40),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
