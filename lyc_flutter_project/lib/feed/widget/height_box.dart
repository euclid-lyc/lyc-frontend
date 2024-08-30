import 'package:flutter/material.dart';

class HeightBox extends StatelessWidget {
  final double height;

  const HeightBox({super.key, this.height = 16.0});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height));
  }
}
