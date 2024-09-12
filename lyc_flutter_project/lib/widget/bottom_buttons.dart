import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/mypage/screen/attendance_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/review_home_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/stamp_screen.dart';
import 'package:lyc_flutter_project/mypage/widget/custom_button_in_profile_box.dart';

class BottomButtons extends StatelessWidget {
  final int memberId;

  const BottomButtons({
    super.key,
    required this.memberId,
  });

  @override
  Widget build(BuildContext context) {
    if (memberId == cur_member) {
      return Row(
        children: [
          // 스탬프 버튼
          CustomButtonInProfileBox(
            memberId: cur_member,
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
            memberId: cur_member,
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
            memberId: cur_member,
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
            onPressed: () => {},
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
