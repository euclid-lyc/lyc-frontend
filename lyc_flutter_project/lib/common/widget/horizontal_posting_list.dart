import 'package:flutter/material.dart';

class HorizontalPostingList extends StatelessWidget {
  const HorizontalPostingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < 10; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: 190,
              width: 135,
            ),
        ],
      ),
    );
  }
}
