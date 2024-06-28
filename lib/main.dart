import 'package:flutter/material.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';

import 'package:showa_supper_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showa Supper App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ConstantColors.primaryColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
