import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class TwoButtons extends StatelessWidget {
  final String fstLabel;
  final Color fstBackColor;
  final Color fstForeColor;
  final String scdLabel;
  final Color scdBackColor;
  final Color scdForeColor;
  final VoidCallback fstOnPressed;
  final VoidCallback scdOnPressed;

  const TwoButtons({
    super.key,
    this.fstLabel = "취소",
    this.fstBackColor = AppColor.grey,
    this.fstForeColor = Colors.black,
    this.scdLabel = "저장",
    this.scdBackColor = AppColor.beige,
    this.scdForeColor = Colors.white,
    required this.fstOnPressed,
    required this.scdOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: fstBackColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: fstOnPressed,
              child: Text(
                fstLabel,
                style: TextStyle(
                  color: fstForeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: scdBackColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: scdOnPressed,
              child: Text(
                '저장',
                style: TextStyle(
                  color: scdForeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
