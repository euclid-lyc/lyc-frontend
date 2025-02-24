import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

import '../../../styles/app_text_style.dart';

class JoinTextFormField extends StatefulWidget {
  final String hint;
  final String labelText;
  final FormFieldSetter<String> onChanged;
  final FormFieldValidator<String> validator;
  final AutovalidateMode autoValidateMode;
  final bool? obscureText;
  final TextInputType? keyboardType;

  const JoinTextFormField({
    super.key,
    required this.hint,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  _JoinTextFormFieldState createState() => _JoinTextFormFieldState();
}

class _JoinTextFormFieldState extends State<JoinTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isValid = true;  // 유효성 검사 상태를 저장할 변수

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(listener);
  }

  void listener() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(listener);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.labelText,
              style: AppTextStyle.labelTextStyle.copyWith(fontSize: 14),
            ),
          ),
          TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            maxLines: 1,
            style: AppTextStyle.hint.copyWith(color: Colors.black, fontSize: 14),
            onChanged: (text) {
              widget.onChanged(text);
              setState(() {
                _isValid = widget.validator(text) == null;
              });
            },
            validator: widget.validator,
            autovalidateMode: widget.autoValidateMode,
            obscureText: widget.obscureText ?? false,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              hintText: widget.hint,
              hintStyle: AppTextStyle.hint.copyWith(fontSize: 14),
              border: baseBorder,
              filled: true,
              fillColor: AppColor.lightGrey,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),
              errorStyle: AppTextStyle.hint.copyWith(color: Colors.red),
              errorBorder: _isValid
                  ? baseBorder
                  : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: _isFocused ? AppColor.brown : AppColor.lightGrey,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
