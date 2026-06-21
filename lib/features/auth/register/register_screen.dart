import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/network/api_exceptions.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../home/home_screen.dart';
import '../login/login_screen.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/auth_illustration.dart';
import '../widgets/email_field.dart';
import '../widgets/name_field.dart';
import '../widgets/password_field.dart';
import '../widgets/social_login_section.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, this.authRepository});

  static const String routeName = '/register';

  final AuthRepository? authRepository;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final AuthRepository _auth =
      widget.authRepository ?? AuthRepositoryImpl();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();

  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if ((value ?? '').trim().isEmpty) return AppStrings.nameRequired;
    return null;
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return AppStrings.emailRequired;
    final regex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
    if (!regex.hasMatch(email)) return AppStrings.emailInvalid;
    return null;
  }

  String? _validatePassword(String? value) {
    if ((value ?? '').isEmpty) return AppStrings.passwordRequired;
    if ((value ?? '').length < 6) return AppStrings.passwordTooShort;
    return null;
  }

  String? _validateConfirm(String? value) {
    if ((value ?? '').isEmpty) return AppStrings.passwordRequired;
    if (value != _passwordController.text) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  }

  Future<void> _handleRegister() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _loading = true);
    try {
      await _auth.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName,
        (route) => false,
      );
    } on ApiException catch (e) {
      _showError(e.message);
    } catch (_) {
      _showError(AppStrings.registerFailed);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red.shade700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                const Center(child: AuthIllustration()),
                const SizedBox(height: 32),
                NameField(
                  controller: _nameController,
                  validator: _validateName,
                  onSubmitted: (_) => _emailFocus.requestFocus(),
                ),
                const SizedBox(height: 16),
                EmailField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  validator: _validateEmail,
                  onSubmitted: (_) => _passwordFocus.requestFocus(),
                ),
                const SizedBox(height: 16),
                PasswordField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  validator: _validatePassword,
                  onSubmitted: (_) => _confirmFocus.requestFocus(),
                ),
                const SizedBox(height: 16),
                PasswordField(
                  controller: _confirmController,
                  focusNode: _confirmFocus,
                  hintText: AppStrings.confirmPasswordHint,
                  validator: _validateConfirm,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 24),
                PrimaryAuthButton(
                  label: AppStrings.createAccount,
                  onPressed: _handleRegister,
                  loading: _loading,
                ),
                const SizedBox(height: 12),
                SecondaryAuthButton(
                  label: AppStrings.login,
                  onPressed: _goToLogin,
                ),
                const SizedBox(height: 20),
                const _LoginPrompt(onTap: null),
                const SizedBox(height: 28),
                SocialLoginSection(onGoogleTap: _goToLogin),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginPrompt extends StatelessWidget {
  final VoidCallback? onTap;

  const _LoginPrompt({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            AppStrings.haveAccountPrefix,
            style: TextStyle(color: AppColors.hintGray, fontSize: 14),
          ),
          GestureDetector(
            onTap: onTap ??
                () => Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName),
            child: const Text(
              AppStrings.login,
              style: TextStyle(
                color: AppColors.teal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
