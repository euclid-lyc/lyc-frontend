import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/screen/follow_list_screen.dart';
import 'package:lyc_flutter_project/mypage/widget/icons_in_profile_box.dart';
import 'package:lyc_flutter_project/widget/bottom_buttons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class ProfileBox extends StatelessWidget {
  final bool isMypage;
  final int memberId;
  final BlockProvider blockProvider;
  final FollowProvider followProvider;
  final NotifyProvider notifyProvider;

  const ProfileBox({
    super.key,
    this.isMypage = true,
    required this.memberId,
    required this.blockProvider,
    required this.followProvider,
    required this.notifyProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.beige,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          // 프로필 박스
          Expanded(
            flex: 12,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // 사진
                  Expanded(
                      flex: 5,
                      child: RoundImage(
                        image: "assets/ex_profile.png",
                      )),
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
                  // 우측 버튼(공유 포인트/팔로우 차단 신고)
                  Expanded(
                    flex: 5,
                    child: IconsInProfileBox(
                      memberId: 1,
                      isMypage: isMypage,
                      blockProvider: blockProvider,
                      followProvider: followProvider,
                      notifyProvider: notifyProvider,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // 하단 버튼(스탬프 리뷰 출석체크/의뢰하기 리뷰 소개카드)
          const Expanded(
            flex: 4,
            child: BottomButtons(
              memberId: 1,

            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
