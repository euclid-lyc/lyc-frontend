import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/posting/screen/posting_detail_screen.dart';

class PreviewPostingCard extends StatelessWidget {
  final int postingId;
  final String image;

  const PreviewPostingCard({
    super.key,
    required this.postingId,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 112,
      margin: const EdgeInsets.all(
        8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PostingDetailScreen(
                  postingId: postingId,
                );
              },
            ),
          ),
          child: ImageNetworking(image),
        ),
      ),
    );
  }
}
