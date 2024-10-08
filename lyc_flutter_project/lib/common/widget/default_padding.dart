import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  final Widget child;
  final double bottom;

  const DefaultPadding({super.key, required this.child, this.bottom = 100});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, bottom),
      child: child,
    );
  }
}
