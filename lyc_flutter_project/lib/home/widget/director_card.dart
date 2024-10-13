import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class DirectorCard extends StatelessWidget {
  final String image;
  final String name;

  // final int memberId;

  const DirectorCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: RoundImage(
            image: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          name,
          style: const TextStyle(
            color: AppColor.deepGrey,
          ),
        ),
      ],
    );
  }
}
