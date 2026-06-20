import 'package:flutter/material.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/theme/app_colors.dart';

class BrandRow extends StatelessWidget {
  const BrandRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 16),
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NUR',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    height: 1.0,
                  ),
                ),
                Text(
                  'PATH',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
