import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: -0.1,
    color: Colors.white,
  );

  static const TextStyle hint = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.5,
    letterSpacing: -0.1,
    color: AppColor.deepGrey,
  );

  static const TextStyle littleTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.1,
    letterSpacing: -0.1,
    color: Colors.black,
  );

  static const TextStyle button = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.3,
    letterSpacing: -0.1,
    color: Colors.white,
  );

  static const TextStyle labelTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.5,
    letterSpacing: -0.1,
    color: Colors.black,
  );

  static const TextStyle linkTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    decoration: TextDecoration.underline,
    height: 1,
    letterSpacing: -0.1,
    color: Colors.black,
    decorationColor: Colors.black,
  );

  static const TextStyle otherLoginTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.5,
    letterSpacing: -0.1,
    color: Color(0xFF718096),
  );
}
