import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class Stamp extends StatelessWidget {
  final bool isSelected;

  const Stamp({
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? const Color(0xffFFDD85) : AppColor.grey,
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                color: Colors.black.withOpacity(0.3),
                blurRadius: 3.0),
          ]),
    );
  }
}