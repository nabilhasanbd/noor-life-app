import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';
import 'google_logo.dart';

/// Social login section: an "OR CONTINUE WITH" divider followed by the
/// Google sign-in button.
class SocialLoginSection extends StatelessWidget {
  final VoidCallback? onGoogleTap;

  const SocialLoginSection({super.key, this.onGoogleTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [
            Expanded(child: Divider(color: AppColors.lightGrayBorder)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                AppStrings.orContinueWith,
                style: TextStyle(
                  color: AppColors.hintGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.lightGrayBorder)),
          ],
        ),
        const SizedBox(height: 20),
        _GoogleButton(onTap: onGoogleTap),
      ],
    );
  }
}

class _GoogleButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _GoogleButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Material(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: const BorderSide(color: AppColors.lightGrayBorder),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              GoogleLogo(size: 22),
              SizedBox(width: 12),
              Text(
                AppStrings.continueWithGoogle,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
