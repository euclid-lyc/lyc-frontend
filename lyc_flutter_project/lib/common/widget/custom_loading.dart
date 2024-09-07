import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CustomLoading extends StatelessWidget {
  final Color color;

  const CustomLoading({
    super.key,
    this.color = AppColor.beige,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
