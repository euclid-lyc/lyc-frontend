import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CommonButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 60.0,
      width: double.infinity,
      child: CustomTextButton(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        textColor: AppColor.brown,
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
        borderRadius: 20.0,
        overlayColor: AppColor.grey,
        label: label,
      ),
    );
  }
}
