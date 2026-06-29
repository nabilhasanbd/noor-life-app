import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

/// A single daily-dhikr counter card.
/// Two of these sit side-by-side in a row (Figma "Frame 427320062").
class DhikrCard extends StatelessWidget {
  const DhikrCard({
    super.key,
    required this.arabic,
    required this.transliteration,
    required this.count,
  });

  final String arabic;
  final String transliteration;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.teal50,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              arabic,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                height: 1.3,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              transliteration,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.secondaryText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.rose800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A row holding two [DhikrCard]s separated by an 8px gap.
class DhikrCardPair extends StatelessWidget {
  const DhikrCardPair({
    super.key,
    required this.first,
    required this.second,
  });

  final DhikrCard first;
  final DhikrCard second;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        first,
        const SizedBox(width: 8),
        second,
      ],
    );
  }
}
