import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';

class SelectMonth extends StatelessWidget {
  const SelectMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
          iconSize: 24,
        ),
        const SizedBox(
          width: 120.0,
          child: Text(
            '4월',
            style: Typos.semibold20,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
