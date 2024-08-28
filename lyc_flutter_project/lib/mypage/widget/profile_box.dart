import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:lyc_flutter_project/mypage/screen/follow_list_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 사진
          Expanded(
              flex: 5,
              child: RoundImage(
                image: "assets/ex_profile.png",
              ),),
          // 이름, 아이디, 팔로워, 팔로잉
          const SizedBox(width: 20),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // 이름
                  Text(
                    "karina",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // 아이디
                  Text("@katarinabluu"),
                  const Text(
                    '\n',
                    style: TextStyle(fontSize: 4),
                  ),
                  // 팔로워
                  GestureDetector(
                    onTap: () {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const FollowListScreen(follower: true),
                        ),
                      );
                    },
                    child: Text(
                      "팔로워: 100",
                      style: TextStyle(color: Color(0xff414141)),
                    ),
                  ),
                  // 팔로잉
                  GestureDetector(
                    onTap: () {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const FollowListScreen(follower: false),
                        ),
                      );
                    },
                    child: Text(
                      "팔로잉: 100",
                      style: TextStyle(
                        color: Color(0xff414141),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
