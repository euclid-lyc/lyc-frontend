import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.brown,
      backgroundColor: Colors.white,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
