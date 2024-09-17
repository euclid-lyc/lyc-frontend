import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class InfoTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hint;
  final int maxLines;
  final bool obscureText;
  final Color fillColor;
  final double borderRadius;

  const InfoTextFormField({
    super.key,
    this.onChanged,
    this.initialValue,
    this.readOnly = false,
    this.controller,
    this.hint,
    this.maxLines = 1,
    this.obscureText = false,
    this.fillColor = Colors.white,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide.none,
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        maxLines: maxLines,
        onChanged: onChanged,
        readOnly: readOnly,
        obscureText: obscureText,
        initialValue: initialValue,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          overflow: TextOverflow.ellipsis,
        ),
        controller: controller,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            overflow: TextOverflow.ellipsis
          ),
          filled: true,
          fillColor: fillColor,
          border: baseBorder,
          enabledBorder: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              width: 4.0,
              color: AppColor.brown,
            ),
          ),
        ),
      ),
    );
  }
}