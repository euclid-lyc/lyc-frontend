import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final double borderRadius;
  final double fontSize;

  const CustomTextButton({
    required this.label,
    this.borderRadius = 20.0,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        overlayColor: Colors.brown,
        backgroundColor: AppColor.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
