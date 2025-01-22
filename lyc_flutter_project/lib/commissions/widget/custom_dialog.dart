import 'package:flutter/material.dart';

import '../../data/app_color.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? leftButtonText;
  final String? rightButtonText;
  final VoidCallback? onLeftButtonPressed;
  final VoidCallback? onRightButtonPressed;

  const CustomDialog({
    Key? key,
    required this.title,
    this.subtitle,
    this.leftButtonText,
    this.rightButtonText,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColor.beige, // 배경색
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 타이틀
            Text(
              title,
              style: const TextStyle(
                color: Colors.black, // 타이틀 글자 색
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            if (subtitle != null)
              Text(
                subtitle!,
                style: const TextStyle(
                  color: AppColor.brown,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20.0),
            // 버튼들 (선택적)
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
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const _CustomButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  State<_CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<_CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
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
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isPressed ? Colors.yellow : AppColor.mocha, // 눌렸을 때 배경색
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: isPressed ? Colors.white : Colors.black, // 글자색
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

