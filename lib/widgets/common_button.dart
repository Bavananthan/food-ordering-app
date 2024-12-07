import 'package:flutter/material.dart';
import 'package:ecologital/provider/locator.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isColor;
  final Color colors;
  final double radius;
  const CommonButton(
      {super.key,
      required this.title,
      this.isColor = true,
      this.radius = 100,
      required this.onPressed,
      this.colors = const Color(0Xff1CAE81)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Container(
          height: 48,
          padding: const EdgeInsets.all(8),
          // margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: isColor ? colors : color.lightGray,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: isColor ? color.primaryColor : color.baseColor,
              )),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isColor ? color.primaryColor : color.baseColor,
                fontSize: texts.textSize16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
