import 'package:flutter/material.dart';

class RightButtonInList extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;
  final VoidCallback onPressed;

  const RightButtonInList({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(5.0),
        ),
      ),
      child: Text(label),
    );
  }
}