import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class TodayTemp extends StatelessWidget {
  final int minTemp;
  final int maxTemp;

  const TodayTemp({
    super.key,
    required this.minTemp,
    required this.maxTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$minTemp°C~$maxTemp°C",
      style: const TextStyle(
        color: AppColor.brown,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      ),
    );
  }
}
