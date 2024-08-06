import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PointTitle extends StatelessWidget {
  final int point;
  final MainAxisAlignment mainAxisAlignment;

  const PointTitle({
    super.key,
    required this.point,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###,###');
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        SvgPicture.asset('assets/icon_point.svg'),
        const SizedBox(width: 16.0),
        Text(
          f.format(point),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ],
    );
  }
}
