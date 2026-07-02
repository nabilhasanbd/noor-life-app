import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import '../features/auth/login/login_screen.dart';
import '../features/auth/register/register_screen.dart';
import '../features/home/home_screen.dart';
import '../features/quran/quran_screen.dart';
import '../features/splash/splash_screen.dart';
import '../features/ai_chat/ai_chat_screen.dart';

class NoorLifeApp extends StatelessWidget {
  const NoorLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noor Life',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const SplashScreen(nextScreen: LoginScreen()),
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranScreen.routeName: (_) => const QuranScreen(),
        AiChatScreen.routeName: (_) => const AiChatScreen(),
      },
    );
  }
}
