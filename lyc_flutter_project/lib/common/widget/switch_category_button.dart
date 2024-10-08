import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class SwitchCategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const SwitchCategoryButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    this.color = AppColor.brown,
    this.size = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: isSelected ? color : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : color,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              fontSize: size,
            ),
          ),
        ),
      ),
    );
  }
}
