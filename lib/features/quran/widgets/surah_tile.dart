import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

/// A single Surah list row (Figma "Button" component): numbered badge,
/// surah name + english meaning with verse count, and a trailing chevron.
class SurahTile extends StatelessWidget {
  const SurahTile({
    super.key,
    required this.number,
    required this.name,
    required this.meaning,
    required this.verses,
    this.onTap,
  });

  final int number;
  final String name;
  final String meaning;
  final String verses;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
          color: AppColors.rose50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.quranRose800, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80CCCCCC),
              offset: Offset(2, -4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.rose100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$number',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.quranRose800,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        meaning,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: AppColors.mutedText,
                        ),
                      ),
                      const Text(
                        ' \u00B7 ',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.mutedText,
                        ),
                      ),
                      Text(
                        verses,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.quranRose800,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
