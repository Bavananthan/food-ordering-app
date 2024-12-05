import 'package:flutter/material.dart';
import 'package:ecologital/provider/locator.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color colors;
  const CommonButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.colors = const Color(0Xff1CAE81)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: color.primaryColor,
              fontSize: texts.textSize16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
