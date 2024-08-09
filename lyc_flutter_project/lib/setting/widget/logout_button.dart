import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class LogoutButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LogoutButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColor.grey),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: Text(label),
    );
  }
}