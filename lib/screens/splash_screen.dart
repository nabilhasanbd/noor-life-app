import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/crescent_moon.dart';
import '../widgets/mosque_silhouette_painter.dart';
import '../widgets/starry_sky_painter.dart';

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
  static const Color _bg = Color(0xFF004D40);

  late final AnimationController _controller;
  late final Animation<double> _fadeIn;
  late final Animation<double> _scaleIn;
  Timer? _navTimer;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _bg,
      ),
    );

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
    if (!mounted) return;
    if (widget.nextScreen != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.nextScreen!),
      );
    }
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: _bg,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Solid background + radial glow
            _buildBackgroundGlow(),

            // 2. Sparse stars
            const CustomPaint(painter: StarrySkyPainter()),

            // 3. Soft translucent clouds at the bottom
            _buildClouds(),

            // 4. Mosque silhouette
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height * 0.5,
              child: CustomPaint(
                painter: const MosqueSilhouettePainter(
                  color: Color(0xFF00332B),
                ),
              ),
            ),

            // 5. Crescent moon above central dome
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.33,
              left: 0,
              right: 0,
              child: const Center(child: CrescentMoon(size: 54)),
            ),

            // 6. Brand focal point (logo + text)
            Center(
              child: FadeTransition(
                opacity: _fadeIn,
                child: ScaleTransition(
                  scale: _scaleIn,
                  child: const _BrandRow(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundGlow() {
    return Container(
      decoration: BoxDecoration(
        color: _bg,
        gradient: RadialGradient(
          center: const Alignment(0, -0.15),
          radius: 0.9,
          colors: [
            _bg,
            _bg,
            const Color(0xFF00382F),
            const Color(0xFF002923),
          ],
          stops: const [0.0, 0.35, 0.7, 1.0],
        ),
      ),
    );
  }

  Widget _buildClouds() {
    final size = MediaQuery.of(context).size;
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: size.height * 0.35,
      child: Stack(
        children: [
            _cloud(
            top: size.height * 0.12,
            left: -size.width * 0.1,
            width: size.width * 0.6,
            opacity: 0.10,
          ),
          _cloud(
            top: size.height * 0.18,
            right: -size.width * 0.1,
            width: size.width * 0.7,
            opacity: 0.08,
          ),
          _cloud(
            top: size.height * 0.06,
            left: size.width * 0.25,
            width: size.width * 0.5,
            opacity: 0.06,
          ),
        ],
      ),
    );
  }

  Widget _cloud({
    double? top,
    double? left,
    double? right,
    required double width,
    required double opacity,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: width,
        height: width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.3),
          color: Colors.tealAccent.withValues(alpha: opacity),
          boxShadow: [
            BoxShadow(
              color: Colors.tealAccent.withValues(alpha: opacity * 0.6),
              blurRadius: width * 0.25,
              spreadRadius: width * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandRow extends StatelessWidget {
  const _BrandRow();

  static const Color _gold = Color(0xFFE9C46A);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/NUR-PATH-LGOO.png',
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 16),
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NUR',
                  style: TextStyle(
                    color: _gold,
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    height: 1.0,
                  ),
                ),
                Text(
                  'PATH',
                  style: TextStyle(
                    color: _gold,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
