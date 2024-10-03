import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final String? initialValue;
  final String? hint;
  final int maxLines;
  final bool obscureText;
  final Color fillColor;
  final double borderRadius;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autoValidateMode;
  final FormFieldSetter<String>? onSaved;
  final Color focusedBorderColor;
  final double focusedBorderWidth;
  final double contentPaddingVertical;
  final double contentPaddingHorizontal;
  final double fontSize;
  final bool isDense;
  final double containerMargin;
  final TextInputType? keyboardType;
  final String? labelText;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.initialValue,
    this.readOnly = false,
    this.hint,
    this.maxLines = 1,
    this.obscureText = false,
    this.fillColor = Colors.white,
    this.borderRadius = 20.0,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.onSaved,
    this.focusedBorderColor = AppColor.brown,
    this.focusedBorderWidth = 2.5,
    this.contentPaddingVertical = 16.0,
    this.contentPaddingHorizontal = 20.0,
    this.fontSize = 16.0,
    this.isDense = false,
    this.containerMargin = 8.0,
    this.keyboardType = TextInputType.text,
    this.labelText,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
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
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide.none,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.containerMargin),
      child: TextFormField(
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        controller: _controller,
        validator: widget.validator,
        autovalidateMode: widget.autoValidateMode,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        obscureText: widget.obscureText,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: widget.fontSize,
          overflow: TextOverflow.ellipsis,
        ),
        onSaved: widget.onSaved,
        cursorColor: widget.focusedBorderColor,
        decoration: InputDecoration(
          labelText: _isFocused ? widget.labelText : null,
          labelStyle: TextStyle(
            color: widget.focusedBorderColor,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
          isDense: widget.isDense,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.contentPaddingHorizontal,
            vertical: widget.contentPaddingVertical,
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: widget.fontSize,
            overflow: TextOverflow.ellipsis,
          ),
          filled: true,
          fillColor: widget.fillColor,
          border: baseBorder,
          enabledBorder: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: BorderSide(
              color: widget.focusedBorderColor,
              width: widget.focusedBorderWidth,
            ),
          ),
          errorBorder: baseBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: baseBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.5,
            ),
          ),
          errorStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        cursorWidth: 2.5,
        cursorRadius: const Radius.circular(
          20.0,
        ),
      ),
    );
  }
}
