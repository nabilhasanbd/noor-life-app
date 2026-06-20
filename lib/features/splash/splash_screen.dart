import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import 'widgets/background_glow.dart';
import 'widgets/brand_row.dart';
import 'widgets/clouds_layer.dart';
import 'widgets/crescent_moon.dart';
import 'widgets/mosque_silhouette_painter.dart';
import 'widgets/starry_sky_painter.dart';

class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;
  final Duration duration;

  const SplashScreen({
    super.key,
    this.nextScreen,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;
  late final Animation<double> _scaleIn;
  Timer? _navTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _scaleIn = Tween<double>(begin: 0.82, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
    _navTimer = Timer(widget.duration, _goNext);
  }

  void _goNext() {
    if (!mounted || widget.nextScreen == null) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => widget.nextScreen!),
    );
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.primary,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const BackgroundGlow(),
            const CustomPaint(painter: StarrySkyPainter()),
            const CloudsLayer(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: height * 0.5,
              child: const CustomPaint(
                painter: MosqueSilhouettePainter(),
              ),
            ),
            Positioned(
              bottom: height * 0.33,
              left: 0,
              right: 0,
              child: const Center(child: CrescentMoon(size: 54)),
            ),
            Center(
              child: FadeTransition(
                opacity: _fadeIn,
                child: ScaleTransition(
                  scale: _scaleIn,
                  child: const BrandRow(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
