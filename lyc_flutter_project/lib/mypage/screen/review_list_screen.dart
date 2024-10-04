import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/right_button_in_list.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';

class ReviewListScreen extends StatelessWidget {
  const ReviewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: '나의 리뷰',
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '작성 가능한 리뷰',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '7일 이내에 디렉팅 받은 코디에 대한 리뷰를 작성할 수 있습니다.',
              style: TextStyle(
                color: AppColor.deepGrey,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MemberList(
                    profile: "assets/ex_profile.png",
                    nickname: "karina",
                    id: "katarinabluu",
                    content: "날짜",
                    button: RightButtonInList(
                      backgroundColor: Color(0xffFFDD85),
                      foregroundColor: Colors.black,
                      label: "작성하기",
                      fontSize: 12.0,
                      // onPressed: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return AddPostingScreen(purpose: 1);
                      //     },
                      //   ),
                      // ),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
