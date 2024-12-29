import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class ActiveState extends StatelessWidget {
  const ActiveState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.active,
          ),
          height: 15.0,
          width: 15.0,
        ),
        const Text(
          "활동중",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
