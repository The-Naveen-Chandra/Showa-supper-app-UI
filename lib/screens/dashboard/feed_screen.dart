import 'package:flutter/material.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      body: const Center(
        child: Text("FeedScreen"),
      ),
    );
  }
}
