import 'package:flutter/material.dart';

class PointCustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const PointCustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: color,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(label),
    );
  }
}
