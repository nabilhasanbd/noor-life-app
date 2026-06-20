import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class BackgroundGlow extends StatelessWidget {
  const BackgroundGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.15),
          radius: 0.9,
          colors: [
            AppColors.primary,
            AppColors.primary,
            AppColors.glowMid,
            AppColors.glowDeep,
          ],
          stops: [0.0, 0.35, 0.7, 1.0],
        ),
      ),
    );
  }
}
