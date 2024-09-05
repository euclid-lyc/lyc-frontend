import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class PointInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const PointInputField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var baseBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      borderSide: BorderSide(
        color: AppColor.grey,
        width: 1.0,
      ),
    );

    return TextFormField(
      onChanged: onChanged,
      autofocus: true,
      keyboardType: TextInputType.number,
      cursorColor: AppColor.brown,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        labelText: "충전금액",
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        hintText: "얼마를 충전할까요?",
        hintStyle: const TextStyle(
          color: AppColor.brown,
          fontSize: 14.0,
        ),
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: AppColor.brown,
            width: 2.0,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
      inputFormatters: <TextInputFormatter>[
        CurrencyInputFormatter(), // Use the custom formatter
      ],
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'ko_KR', // Korean locale
    symbol: '￦', // Currency symbol
    decimalDigits: 0, // No decimal places
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final double value = double.parse(cleanText);
    final String newText = currencyFormat.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
