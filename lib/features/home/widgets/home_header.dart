import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

class _PrayerTime {
  const _PrayerTime(this.name, this.time, this.icon, {this.active = false});
  final String name;
  final String time;
  final String icon;
  final bool active;
}

const List<_PrayerTime> _prayers = [
  _PrayerTime('Fajr', '04:41', AppAssets.moonCloud, active: true),
  _PrayerTime('Dhuhr', '04:41', AppAssets.sun),
  _PrayerTime('Asr', '04:41', AppAssets.sunCloud),
  _PrayerTime('Maghrib', '04:41', AppAssets.moonCloud),
  _PrayerTime('Isha', '04:41', AppAssets.moon),
];

/// The rounded teal header with greeting, next-prayer countdown and the
/// five daily prayer times.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.teal700, AppColors.headerOverlay],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          child: Column(
            children: [
              _buildStatusBar(),
              const SizedBox(height: 28),
              _buildGreeting(),
              const SizedBox(height: 40),
              _buildNextPrayer(),
              const SizedBox(height: 24),
              _buildPrayerRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Row(
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
            color: AppColors.white,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0x1AE5E7EB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            AppAssets.bellDot,
            width: 22,
            height: 22,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return Column(
      children: [
        Text(
          AppStrings.greeting,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Neue Machina',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            height: 1.25,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.teal700,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.calendar,
                width: 16,
                height: 16,
                colorFilter:
                    const ColorFilter.mode(AppColors.teal50, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              const Text(
                AppStrings.hijriDate,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFCCFBF1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNextPrayer() {
    return Column(
      children: [
        Text(
          AppStrings.nextPrayerTime,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 40,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.nextPrayerLabel,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.slate50,
          ),
        ),
      ],
    );
  }

  Widget _buildPrayerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _prayers.map((p) {
        final color = p.active ? AppColors.white : AppColors.inactiveLabel;
        final timeColor =
            p.active ? AppColors.white : AppColors.slate50;
        final iconColor = p.active ? AppColors.white : AppColors.slate50;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              p.name,
              style: TextStyle(
                fontSize: 15,
                fontWeight: p.active ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            SvgPicture.asset(
              p.icon,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
            const SizedBox(height: 8),
            Text(
              p.time,
              style: TextStyle(
                fontSize: 15,
                fontWeight: p.active ? FontWeight.w600 : FontWeight.w400,
                color: timeColor,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
