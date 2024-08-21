import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/mypage/widget/closet_element.dart';
import 'package:lyc_flutter_project/posting/screen/add_clothes_posting_screen.dart';
import 'package:lyc_flutter_project/posting/screen/posting_detail_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MyClosetList extends StatelessWidget {
  const MyClosetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return GestureDetector(
            onTap: () => pushWithoutNavBar(
              context,
              MaterialPageRoute(
                builder: (context) => const AddClothesPostingScreen(),
              ),
            ),
            child: const ClosetElement(
              title: "옷 추가",
              image: "",
              isFst: true,
            ),
          );
        } else {
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
        }
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16.0);
      },
    );
  }
}
