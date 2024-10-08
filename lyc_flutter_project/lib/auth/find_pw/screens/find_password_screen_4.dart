import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

import '../../../styles/app_text_style.dart';
import '../../join/screens/login_screen.dart';


class FindPasswordScreen4 extends StatelessWidget {
  const FindPasswordScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "비밀번호 찾기"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              // 최대 너비 설정
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.fromLTRB(22, 28.5, 22, 0),
              width: 296,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 7, 43.5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Step 3. 비밀번호 재설정',
                      style: app_text_style.littleTitle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 49),
                    decoration: BoxDecoration(
                      color: Color(0xFFBBBBBB),
                      borderRadius: BorderRadius.circular(62),
                    ),
                    width: 124,
                    height: 124,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icon_fanfare.svg',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(4, 0, 0, 18.5),
                    child: Text(
                      '비밀번호가 성공적으로 변경되었습니다.',
                      textAlign: TextAlign.center,
                      style: app_text_style.otherLoginTextStyle
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.5), // 위 여백 설정
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>LoginScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: SizedBox(
                        width: 230,
                        child: Text(
                          '로그인 화면으로 돌아가기',
                          style: app_text_style.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 43),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1, // 하단 여백을 비율로 설정
            child: Container(), // 빈 컨테이너로 여백을 제공
          ),
        ],
      ),
    );
  }
}
