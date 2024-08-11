import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class TitleText extends StatelessWidget {
  final String title;
  final String content;

  const TitleText({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff525252),
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            color: AppColor.deepGrey,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        )
      ],
    );
  }
}