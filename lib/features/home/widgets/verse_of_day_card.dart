import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

/// The rose "Verse of the Day" card.
class VerseOfDayCard extends StatelessWidget {
  const VerseOfDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9F1239), Color(0xFF7A0E2C)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              AppAssets.quran,
              width: 22,
              height: 22,
              colorFilter:
                  const ColorFilter.mode(AppColors.lightBlue, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.verseOfTheDayTitle,
            style: const TextStyle(
              fontFamily: 'Nulshock',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 2,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            AppStrings.verseArabic,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 22,
              height: 1.5,
              letterSpacing: 2,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0x80F43F5E), width: 1),
              ),
            ),
            child: Column(
              children: [
                Text(
                  AppStrings.verseTranslation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  AppStrings.verseReference,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.verseRef,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
