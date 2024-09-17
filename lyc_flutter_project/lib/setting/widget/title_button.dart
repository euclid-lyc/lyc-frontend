import 'package:flutter/material.dart';

class TitleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String note;
  final Color backgroundColor;
  final Color foregroundColor;

  const TitleButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.note = "",
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                Text(
                  note,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
