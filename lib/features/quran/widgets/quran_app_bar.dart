import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

/// Top status bar for the Quran page: brand logo, app name and the
/// notification bell (Figma "Status bar - iPhone").
class QuranAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuranAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.zinc200, width: 1),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AppAssets.logo,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            AppStrings.appNameShort,
            style: const TextStyle(
              fontFamily: 'Neue Machina',
              fontWeight: FontWeight.w800,
              fontSize: 20,
              letterSpacing: 2,
              color: AppColors.primaryText,
            ),
          ),
          const Spacer(),
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.teal100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.bellDot,
                  width: 20,
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(AppColors.quranTeal, BlendMode.srcIn),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: AppColors.rose500,
                      shape: BoxShape.circle,
                    ),
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
