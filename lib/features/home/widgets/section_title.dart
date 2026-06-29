import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Nulshock',
        fontWeight: FontWeight.bold,
        fontSize: 18,
        height: 1.2,
        letterSpacing: 2,
        color: AppColors.sectionTitle,
      ),
    );
  }
}
