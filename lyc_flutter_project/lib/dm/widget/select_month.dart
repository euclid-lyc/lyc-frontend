import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';

class SelectMonth extends StatelessWidget {
  final VoidCallback onLeftArrowPressed;
  final VoidCallback onRightArrowPressed;
  final DateTime calendarDate;

  const SelectMonth({
    super.key,
    required this.onLeftArrowPressed,
    required this.onRightArrowPressed,
    required this.calendarDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onLeftArrowPressed,
          icon: const Icon(Icons.chevron_left),
          iconSize: 24,
        ),
        SizedBox(
          width: 120.0,
          child: Text(
            '${calendarDate.year.toString()}년 ${calendarDate.month.toString()}월',
            style: Typos.semibold20,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: onRightArrowPressed,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
