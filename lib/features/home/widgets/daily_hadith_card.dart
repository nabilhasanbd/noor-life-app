import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

/// The "AI ASSISTANT" / Daily Hadith white card.
class DailyHadithCard extends StatelessWidget {
  const DailyHadithCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.fileStar,
                width: 30,
                height: 30,
                colorFilter:
                    const ColorFilter.mode(AppColors.teal600, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.dailyHadithTitle,
                      style: const TextStyle(
                        fontFamily: 'Nulshock',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.teal600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppStrings.dailyHadithSource,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.copy,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                        AppColors.blueGray, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(
                    AppAssets.calendar,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                        AppColors.blueGray, BlendMode.srcIn),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            AppStrings.dailyHadithText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Newsreader',
              fontSize: 17,
              height: 1.35,
              letterSpacing: 0.5,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.dailyHadithAttribution,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}
