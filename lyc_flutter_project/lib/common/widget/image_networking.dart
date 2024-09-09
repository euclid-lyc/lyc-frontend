import 'package:flutter/material.dart';

class ImageNetworking extends StatelessWidget {
  final String image;
  final bool profile;

  const ImageNetworking(
    this.image, {
    super.key,
    this.profile = true,
  });

  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          profile ? "assets/default_profile.png" : "assets/image_not_found.png",
          fit: BoxFit.cover,
        );
      },
    );
  }
}
