import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import '../features/auth/login/login_screen.dart';
import '../features/home/home_screen.dart';
import '../features/splash/splash_screen.dart';

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
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
