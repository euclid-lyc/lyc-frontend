import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CustomButtonInProfileBox extends StatelessWidget {
  final int memberId;
  final String text;
  final VoidCallback onPressed;

  const CustomButtonInProfileBox({
    super.key,
    required this.memberId,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: AppColor.lightGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff8D8371),
            ),
          )),
    );
  }
}
