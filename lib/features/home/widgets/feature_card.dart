import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/theme/app_colors.dart';

/// A square-ish feature tile with an SVG icon and a two-line label.
/// Matches the Figma "Frame 427320072" cards (rose/800 or teal/700 fill).
class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.iconColor = AppColors.white,
    this.iconSize = 24,
    this.fontSize = 14,
    this.onTap,
  });

  /// SVG asset path (e.g. `AppAssets.quran`).
  final String icon;
  final String label;
  final Color color;
  final Color iconColor;
  final double iconSize;
  final double fontSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withValues(alpha: 0.15),
              width: 2,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
