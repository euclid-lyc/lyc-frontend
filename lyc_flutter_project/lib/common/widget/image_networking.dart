import 'package:flutter/material.dart';

class ImageNetworking extends StatelessWidget {
  final String image;

  const ImageNetworking(
    this.image, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          "assets/default_profile.png",
          fit: BoxFit.cover,
        );
      },
    );
  }
}

class ProfileImageNetworking extends StatelessWidget {
  final String image;

  const ProfileImageNetworking(
      this.image, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "assets/default_profile.png",
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}