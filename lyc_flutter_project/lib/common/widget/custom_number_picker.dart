import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomNumberpicker extends StatelessWidget {
  final String title;
  final int minValue;
  final int maxValue;
  final int value;
  final Function(int) onChanged;
  final int step;
  final VoidCallback? fstOnPressed;
  final VoidCallback? sndOnPressed;

  const CustomNumberpicker({
    super.key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onChanged,
    this.step = 1,
    this.fstOnPressed,
    this.sndOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
      content: NumberPicker(
        selectedTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
        ),
        minValue: minValue,
        maxValue: maxValue,
        value: value,
        onChanged: onChanged,
        step: step,
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        CustomTextButton(
          label: "취소",
          backgroundColor: AppColor.grey,
          textColor: Colors.black,
          onPressed: fstOnPressed,
        ),
        CustomTextButton(
          label: "선택",
          onPressed: sndOnPressed,
        ),
      ],
    );
  }
}
