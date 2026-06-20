import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

/// Rounded outlined email input field with an email prefix icon.
class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  const EmailField({
    super.key,
    this.controller,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: AppStrings.emailHint,
        prefixIcon: Icon(Icons.email_outlined, color: AppColors.teal),
        border: _outlineBorder,
        enabledBorder: _outlineBorder,
        focusedBorder: _focusBorder,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    );
  }

  static const OutlineInputBorder _outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: AppColors.lightGrayBorder),
  );

  static const OutlineInputBorder _focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: AppColors.teal, width: 1.5),
  );
}
