import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String leftButtonLabel;
  final String rightButtonLabel;
  final VoidCallback leftButtonPressed;
  final VoidCallback rightButtonPressed;
  final Color backgroundColor;
  final Color titleColor;
  final Color leftBackgroundColor;
  final Color leftForegroundColor;
  final Color rightBackgroundColor;
  final Color rightForegroundColor;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.leftButtonLabel,
    required this.rightButtonLabel,
    required this.leftButtonPressed,
    required this.rightButtonPressed,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.leftBackgroundColor = AppColor.grey,
    this.leftForegroundColor = Colors.black,
    this.rightBackgroundColor = AppColor.deepGrey,
    this.rightForegroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 20.0,
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _CustomTextButton(
                    label: leftButtonLabel,
                    onPressed: leftButtonPressed,
                    backgroundColor: leftBackgroundColor,
                    foregroundColor: leftForegroundColor,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: _CustomTextButton(
                    label: rightButtonLabel,
                    onPressed: rightButtonPressed,
                    backgroundColor: rightBackgroundColor,
                    foregroundColor: rightForegroundColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;

  const _CustomTextButton({
    required this.onPressed,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 10.0),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ),
      child: Text(label),
    );
  }
}
