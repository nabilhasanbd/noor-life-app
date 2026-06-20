import 'package:flutter/material.dart';

import '../../../app/constants/app_assets.dart';

/// Top illustration for the auth screens. Occupies ~27% of the screen height.
class AuthIllustration extends StatelessWidget {
  const AuthIllustration({super.key});

  static const double _heightFactor = 0.27;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Image.asset(
      AppAssets.loginIllustration,
      height: screenHeight * _heightFactor,
      fit: BoxFit.contain,
    );
  }
}
