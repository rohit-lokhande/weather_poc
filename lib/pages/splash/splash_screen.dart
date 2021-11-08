import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_poc/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          alignment: Alignment.center,
          child: const FlutterLogo(
            size: 280.0,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAndToNamed(AppRoutes.HOME);
      });
    });

    _initAnimationControllers();
    super.initState();
  }

  void _initAnimationControllers() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
      value: 0.1,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );
    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
