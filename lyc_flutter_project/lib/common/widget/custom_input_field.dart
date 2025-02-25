import 'package:flutter/material.dart';

import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';

class CustomInputField extends StatefulWidget {
  final String? label;
  final String hint;
  final TextInputType? inputType;
  final ValueChanged<String> onChanged;
  final String? initialValue;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final bool? filled;
  final bool? obscure;

  const CustomInputField({
    super.key,
    this.label,
    required this.hint,
    this.inputType = TextInputType.text,
    required this.onChanged,
    this.initialValue,
    this.controller,
    this.maxLines,
    this.minLines,
    this.fillColor,
    this.filled = true,
    this.obscure = false,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      _controller = widget.controller;
    }
  }

  @override
  void dispose() {
    if (_controller != widget.controller) {
      _controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                widget.label!,
                style: AppTextStyle.labelTextStyle.copyWith(fontSize: 14),
              ),
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              obscureText: widget.obscure ?? false,
              controller: _controller,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                hintText: widget.hint,
                hintStyle: AppTextStyle.hint.copyWith(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                fillColor: widget.fillColor ?? AppColor.lightGrey,
                filled: widget.filled,
              ),
              keyboardType: widget.inputType,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
