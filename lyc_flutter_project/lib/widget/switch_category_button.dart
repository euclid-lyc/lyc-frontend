import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class SwitchCategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  SwitchCategoryButton(this.text, this.isSelected, this.onPressed,);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? AppColor.brown : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColor.brown,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}