import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CommonButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 60.0,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(AppColor.brown),
          alignment: AlignmentDirectional.center,
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}