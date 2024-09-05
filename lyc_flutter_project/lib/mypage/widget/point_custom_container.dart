import 'package:flutter/material.dart';

class PointCustomContainer extends StatelessWidget {
  final Widget child;

  const PointCustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: child,
    );
  }
}