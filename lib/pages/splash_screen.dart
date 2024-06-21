import 'dart:async';
import 'package:flutter/material.dart';

import 'package:showa_supper_app/pages/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _colorController;
  late AnimationController _circleController;
  late Animation<double> _colorAnimation;
  late Animation<double> _circleAnimation;

  @override
  void initState() {
    super.initState();

    _colorController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _circleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _colorAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );

    _circleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _circleController, curve: Curves.easeInOut),
    );

    _colorController.forward();
    _circleController.forward();

    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _colorController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return Container(
                  color:
                      Colors.blue.shade900.withOpacity(_colorAnimation.value),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _circleAnimation,
              builder: (context, child) {
                return ClipOval(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        _circleAnimation.value,
                    height: MediaQuery.of(context).size.width *
                        _circleAnimation.value,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900
                          .withOpacity(_circleAnimation.value),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _circleController,
              builder: (context, child) {
                return Opacity(
                  opacity: 1.0 - _circleAnimation.value,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/showa_logo_trans.png'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
