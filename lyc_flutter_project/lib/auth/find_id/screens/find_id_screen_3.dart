import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

import '../../../styles/app_text_style.dart';
import '../../find_pw/screens/find_password_screen_1.dart';
import '../../join/screens/login_screen.dart';


class FindIdScreen3 extends StatelessWidget {
  final String loginId;
  const FindIdScreen3({super.key, required this.loginId});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "아이디 찾기"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1, // 상단 여백을 비율로 설정
            child: Container(), // 빈 컨테이너로 여백을 제공
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
                        'Step 3. 아이디 확인',
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
                        '아이디 확인에 성공했습니다.',
                        textAlign: TextAlign.center,
                        style: app_text_style.otherLoginTextStyle
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(loginId,
                          style: app_text_style.littleTitle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 43),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 1, // 하단 여백을 비율로 설정
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // '로그인 화면' 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  LoginScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.grey,
                          minimumSize: Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '로그인 화면',
                          style: app_text_style.hint.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // '비밀번호 찾기' 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FindPasswordScreen1()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.beige,
                          minimumSize: Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '비밀번호 찾기',
                          style: app_text_style.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
