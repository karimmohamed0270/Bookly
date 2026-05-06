import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.textcolor,
    this.borderRadius,
  });

  final Color backgroundColor;
  final String text;
  final Color textcolor;
  // border radius null or by defualt
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(text, style: Styles.textSize18.copyWith(color: textcolor)),
      ),
    );
  }
}
