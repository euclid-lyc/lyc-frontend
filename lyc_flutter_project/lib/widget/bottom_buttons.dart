import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/model/member.dart';
import 'package:lyc_flutter_project/screens/review_home_screen.dart';
import 'package:lyc_flutter_project/services/temp_services.dart';
import 'package:lyc_flutter_project/widget/custom_button_in_profile_box.dart';

class BottomButtons extends StatelessWidget {
  final int memberId;

  const BottomButtons({
    super.key,
    required this.memberId,
  });

  @override
  Widget build(BuildContext context) {
    if (memberId == cur_member) {
      Member member = TempServices.getMemberById(memberId);
      return Row(
        children: [
          // 스탬프 버튼
          CustomButtonInProfileBox(
            memberId: member.id,
            text: '스탬프',
            onPressed: () => {},
          ),
          SizedBox(width: 15),
          // 리뷰 버튼
          CustomButtonInProfileBox(
            memberId: member.id,
            text: '리뷰',
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ReviewHomeScreen();
              },
            )),
          ),
          SizedBox(width: 15),
          // 출석체크 버튼
          CustomButtonInProfileBox(
            memberId: member.id,
            text: '출석체크',
            onPressed: () => {},
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
          SizedBox(width: 15),
          CustomButtonInProfileBox(
            memberId: memberId,
            text: '리뷰',
            onPressed: () => {},
          ),
          SizedBox(width: 15),
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
