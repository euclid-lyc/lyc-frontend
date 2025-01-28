import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';

import '../../data/app_color.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? leftButtonText;
  final String? rightButtonText;
  final VoidCallback? onLeftButtonPressed;
  final VoidCallback? onRightButtonPressed;

  const CustomDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.leftButtonText,
    this.rightButtonText,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.beige,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Text(
              title,
              style: AppTextStyle.littleTitle,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) const SizedBox(height: 12),
            if (subtitle != null)
              Text(
                subtitle!,
                style: AppTextStyle.labelTextStyle
                    .copyWith(fontSize: 14, color: AppColor.brown),
                textAlign: TextAlign.center,
              ),
            if (leftButtonText != null || rightButtonText != null)
              const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (leftButtonText != null)
                  _CustomButton(
                    text: leftButtonText!,
                    onPressed: onLeftButtonPressed,
                  ),
                if (rightButtonText != null)
                  _CustomButton(
                    text: rightButtonText!,
                    onPressed: onRightButtonPressed,
                  ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const _CustomButton({super.key, required this.text, this.onPressed});

  @override
  State<_CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<_CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    VoidCallback? onPressed = widget.onPressed;
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        if (onPressed != null) {
          onPressed();
        }
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isPressed ? Colors.yellow : AppColor.mocha,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: isPressed ? Colors.white : Colors.black, // 글자색
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
