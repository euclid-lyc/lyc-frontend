import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color backgroundColor;
  final Color overlayColor;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.label,
    this.borderRadius = 20.0,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.w500,
    this.textColor = Colors.white,
    this.backgroundColor = AppColor.brown,
    this.overlayColor = Colors.brown,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: overlayColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
