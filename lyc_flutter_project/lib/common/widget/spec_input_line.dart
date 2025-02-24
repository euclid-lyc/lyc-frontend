import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/spec_size_box.dart';
import '../../setting/widget/custom_text_form_field.dart';

class SpecInputLine<T> extends StatelessWidget {
  final String label;
  final String? initialValue;
  final VoidCallback? onTap;
  final int Function(T)? getValue;
  final Function(String)? onChanged;
  final bool? enabled;

  const SpecInputLine({
    super.key,
    required this.label,
    this.initialValue,
    this.onTap,
    this.getValue,
    this.onChanged,
    this.enabled=true ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: (label == "키" || label == "몸무게")
                ? CustomTextFormField(
              fillColor: const Color(0xffE9E9E9),
              focusedBorderColor: Colors.black,
              focusedBorderWidth: 1.5,
              contentPaddingVertical: 4,
              fontSize: 16,
              isDense: true,
              initialValue: initialValue ?? '',
              keyboardType: TextInputType.number,
              onChanged: onChanged!,
              enabled: enabled,
            )
                : SpecSizeBox(
              onTap: onTap!,
              getValue: getValue!,
            ),
          ),
        ],
      ),
    );
  }
}
