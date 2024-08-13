import 'package:flutter/material.dart';

class PointSubTitle extends StatelessWidget {
  final String label;

  const PointSubTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
