import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final Image image;

  const RoundImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: image,
      ),
    );
  }
}
