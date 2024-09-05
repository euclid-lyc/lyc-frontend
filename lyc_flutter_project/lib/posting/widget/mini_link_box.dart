import 'package:flutter/material.dart';

class MiniLinkBox extends StatelessWidget {
  final String index;

  const MiniLinkBox({super.key, required this.index,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff252525),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        '링크$index',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
