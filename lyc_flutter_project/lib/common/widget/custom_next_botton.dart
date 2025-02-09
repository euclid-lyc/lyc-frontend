import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';

class CustomNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;


  const CustomNextButton({super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColor.beige,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: SizedBox(
        width: 232,
        child: Text(
          text,
          style: AppTextStyle.button,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}