import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType inputType;
  final ValueChanged<String> onChanged;

  const CustomInputField({super.key,
    required this.label,
    required this.hint,
    required this.inputType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label,
              style: AppTextStyle.labelTextStyle.copyWith(fontSize: 14),
            ),
          ),
          Container(
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintText: hint,
                  hintStyle: AppTextStyle.hint.copyWith(fontSize: 14),
                  border: InputBorder.none,
                ),
                keyboardType: inputType,
              ),
            ),
          )
        ],
      ),
    );
  }
}
