import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/mypage/model/profile.dart';
import 'package:lyc_flutter_project/mypage/screen/follow_list_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class ProfileBox extends StatelessWidget {
  final int memberId;
  final String nickName;
  final String loginId;
  final int follower;
  final int following;
  final String profileImage;

  const ProfileBox({
    super.key,
    required this.memberId,
    required this.nickName,
    required this.loginId,
    required this.follower,
    required this.following,
    required this.profileImage,
  });

  factory ProfileBox.fromModel({required Profile profile}) {
    return ProfileBox(
      memberId: profile.memberId,
      nickName: profile.nickname,
      loginId: profile.loginId,
      follower: profile.follower,
      following: profile.following,
      profileImage: profile.profileImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 사진
          Expanded(
            flex: 5,
            child: ProfileImageNetworking(profileImage),
          ),
          // 이름, 아이디, 팔로워, 팔로잉
          const SizedBox(width: 20),
          Expanded(
            flex: 8,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 이름
                  Text(
                    nickName,
                    style: Typos.extraBold18,
                  ),
                  // 아이디
                  Text(
                    "@$loginId",
                    style: Typos.regular12.copyWith(
                      color: const Color(0xff414141),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  // 팔로워
                  GestureDetector(
                    onTap: () {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowListScreen(
                            follower: true,
                            memberId: memberId,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "팔로워: $follower",
                      style: Typos.regular14.copyWith(
                        color: const Color(0xff414141),
                      ),
                    ),
                  ),
                  // 팔로잉
                  GestureDetector(
                    onTap: () {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowListScreen(
                            follower: false,
                            memberId: memberId,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "팔로잉: $following",
                      style: Typos.regular14.copyWith(
                        color: const Color(0xff414141),
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
