import 'package:flutter/material.dart';

class RightButtonInList extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;
  final VoidCallback onPressed;
  final FontWeight fontWeight;
  final double fontSize;
  final double padding;

  const RightButtonInList({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.label,
    required this.onPressed,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 14.0,
    this.padding = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.all(padding),
        ),
      ),
      child: Text(label),
    );
  }
}