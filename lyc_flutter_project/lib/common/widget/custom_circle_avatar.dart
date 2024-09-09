import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatefulWidget {
  final String image;

  const CustomCircleAvatar({
    super.key,
    required this.image,
  });

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: double.infinity,
      backgroundImage: isError
          ? const AssetImage("assets/default_profile.png")
          : NetworkImage(widget.image),
      onBackgroundImageError: (exception, stackTrace) {
        setState(() {
          isError = true;
        });
      },
    );
  }
}
