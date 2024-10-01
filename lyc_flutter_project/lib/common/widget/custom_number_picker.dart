import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class CustomNumberPicker<T extends ChangeNotifier> extends StatelessWidget {
  final String title;
  final int minValue;
  final int maxValue;
  final int step;
  final int Function(T) getValue;
  final void Function(T, int) updateValue;
  final VoidCallback? fstOnPressed;
  final VoidCallback? scdOnPressed;

  const CustomNumberPicker({
    super.key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    this.step = 1,
    required this.getValue,
    required this.updateValue,
    this.fstOnPressed,
    this.scdOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, provider, child) {
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
            value: getValue(provider),
            onChanged: (newValue) => updateValue(provider, newValue),
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
              onPressed: scdOnPressed,
            ),
          ],
        );
      },
    );
  }
}