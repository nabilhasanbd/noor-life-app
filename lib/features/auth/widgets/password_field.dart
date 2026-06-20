import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

/// Rounded outlined password input field with a lock prefix icon and a
/// visibility toggle suffix.
class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  const PasswordField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText = AppStrings.passwordHint,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: widget.validator,
      obscureText: _obscure,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.lock_outline, color: AppColors.teal),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: AppColors.teal,
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
        border: _outlineBorder,
        enabledBorder: _outlineBorder,
        focusedBorder: _focusBorder,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
