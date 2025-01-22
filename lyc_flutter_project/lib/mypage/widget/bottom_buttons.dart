import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/screen/tap_view_screen.dart';

import 'package:lyc_flutter_project/mypage/screen/attendance_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/review_home_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/stamp_screen.dart';
import 'package:lyc_flutter_project/mypage/widget/custom_button_in_profile_box.dart';
import 'package:provider/provider.dart';

import '../../auth/join/Provider/login_provider.dart';

class BottomButtons extends StatelessWidget {
  final int memberId;
  final bool isLoginUser;

  const BottomButtons({
    super.key,
    required this.memberId,
    required this.isLoginUser,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoginUser) {
      return Row(
        children: [
          // 스탬프 버튼
          CustomButtonInProfileBox(
            memberId: memberId,
            text: '스탬프',
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) {
                  return const StampScreen();
                },
              ),
            },
          ),
          const SizedBox(width: 15),
          // 리뷰 버튼
          CustomButtonInProfileBox(
            memberId: memberId,
            text: '리뷰',
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ReviewHomeScreen();
              },
            )),
          ),
          const SizedBox(width: 15),
          // 출석체크 버튼
          CustomButtonInProfileBox(
            memberId: memberId,
            text: '출석체크',
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AttendanceScreen(),
                ),
              ),
            },
          ),
        ],
      );
    } else {
      return Row(
        children: [
          CustomButtonInProfileBox(
            memberId: memberId,
            text: '의뢰하기',
            onPressed: () async {
              // context.goNamed(Routes.BasicInfo.name);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TapViewScreen(
                      directorId: memberId,
                      memberId:
                          Provider.of<LoginProvider>(context, listen: false)
                              .memberId,
                  title: "의뢰서 작성하기",)
                ),
              );
            },
          ),
          const SizedBox(width: 15),
          CustomButtonInProfileBox(
            memberId: memberId,
            text: '리뷰',
            onPressed: () => {},
          ),
          const SizedBox(width: 15),
          CustomButtonInProfileBox(
            memberId: memberId,
            text: '소개카드',
            onPressed: () => {},
          ),
        ],
      );
    }
  }
}
