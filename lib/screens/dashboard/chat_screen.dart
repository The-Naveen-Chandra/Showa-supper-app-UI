import 'package:flutter/material.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      body: const Center(
        child: Text("ChatScreen"),
      ),
    );
  }
}
