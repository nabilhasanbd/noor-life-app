import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';
import '../../home/home_screen.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/auth_illustration.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/social_login_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocus = FocusNode();
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
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
    return null;
  }

  Future<void> _handleLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _loading = false);
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  void _goToRegister() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(AppStrings.registerComingSoon)),
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
                EmailField(
                  controller: _emailController,
                  validator: _validateEmail,
                  onSubmitted: (_) => _passwordFocus.requestFocus(),
                ),
                const SizedBox(height: 16),
                PasswordField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  validator: _validatePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 24),
                PrimaryAuthButton(
                  label: AppStrings.login,
                  onPressed: _handleLogin,
                  loading: _loading,
                ),
                const SizedBox(height: 12),
                SecondaryAuthButton(
                  label: AppStrings.register,
                  onPressed: _goToRegister,
                ),
                const SizedBox(height: 20),
                const _SignUpPrompt(),
                const SizedBox(height: 28),
                SocialLoginSection(onGoogleTap: _goToRegister),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpPrompt extends StatelessWidget {
  const _SignUpPrompt();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            AppStrings.noAccountPrefix,
            style: TextStyle(color: AppColors.hintGray, fontSize: 14),
          ),
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.signUpComingSoon)),
            ),
            child: const Text(
              AppStrings.signUp,
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
