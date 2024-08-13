import 'package:flutter/material.dart';

class ClosetElement extends StatelessWidget {
  final String title;
  final String image;

  const ClosetElement({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
