import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/mypage/widget/closet_element.dart';
import 'package:lyc_flutter_project/screens/posting_detail_screen.dart';

class MyClosetList extends StatelessWidget {
  const MyClosetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const PostingDetailScreen(
                  id: 1,
                  isCloset: true,
                  isMyposting: true,
                );
              },
            ),
          ),
          child: const ClosetElement(
            title: "정열의 레드 붉은 상어파의 티샤쓰",
            image: "assets/ex_myCloset1.jpg",
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16.0);
      },
    );
  }
}
