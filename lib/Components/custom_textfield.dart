import 'package:flutter/material.dart';

import '../Theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 22),
      decoration: const BoxDecoration(color: kTextfieldBackground),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: kHintColor),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
