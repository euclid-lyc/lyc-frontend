import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/screens/join_membership_screen_2.dart';

import '../widget/normal_appbar.dart';

class JoinMembershipScreen1 extends StatelessWidget {
  const JoinMembershipScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    // 공통 TextStyle
    TextStyle titleTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: -0.1,
      color: Colors.white,
    );

    TextStyle labelTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.5,
      letterSpacing: -0.1,
      color: Color(0xFF000000),
    );

    TextStyle hintTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.5,
      letterSpacing: -0.1,
      color: Color(0xFF8D8D8D),
    );

    TextStyle littleTitleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 1.1,
      letterSpacing: -0.1,
      color: Colors.black,
    );

    TextStyle otherLoginTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.black,
    );

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar:  NormalAppbar(
      backButton: true,
      title: "회원가입",
      deleteButton: false,
    ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(29, 28.5, 29, 33),
                width: double.infinity, // 화면 전체 너비로 확장
                constraints: BoxConstraints(maxWidth: 296), // 최대 너비 설정
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Step 1. 아이디 패스워드 설정',
                        style: littleTitleStyle,
                      ),
                    ),
                    buildInputField(
                        '이름', '이름을 입력해주세요', labelTextStyle, hintTextStyle),
                    buildInputField(
                        '아이디', '아이디를 입력해주세요', labelTextStyle, hintTextStyle),
                    buildInputField(
                        '이메일', '이메일을 입력해주세요', labelTextStyle, hintTextStyle),
                    buildInputField(
                        '패스워드', '패스워드를 입력해주세요', labelTextStyle, hintTextStyle),
                    buildInputField(
                        '패스워드 확인', '패스워드를 다시 입력해주세요', labelTextStyle, hintTextStyle),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JoinMembershipScreen2()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColor.beige),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(vertical: 11),
                        ),
                      ),
                      child: SizedBox(
                        width: 230,
                        child: Text(
                          '다음',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            height: 1.3,
                            letterSpacing: -0.1,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // 위와 아래 사이에 여백 추가
              TextButton(
                onPressed: () {
                  // 다른 계정으로 회원가입 버튼 눌렀을 때의 동작 구현
                },
                child: Text(
                  '다른 계정으로 회원가입',
                  style: otherLoginTextStyle,
                ),
              ),
              SizedBox(
                width: 166,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icon_naver.png',
                        width: 35,
                        height: 35,
                      ),
                      onPressed: () {
                        // 네이버 로그인 버튼 눌렀을 때의 동작 구현
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/icon_kakao.png',
                        width: 35,
                        height: 35,
                      ),
                      onPressed: () {
                        // 카카오톡 로그인 버튼 눌렀을 때의 동작 구현
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/icon_google.png',
                        width: 35,
                        height: 35,
                      ),
                      onPressed: () {
                        // 구글 로그인 버튼 눌렀을 때의 동작 구현
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint, TextStyle labelTextStyle,
      TextStyle hintTextStyle) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4.5),
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: labelTextStyle,
            ),
          ),
          Container(
            height: 50, // 높이 조정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                maxLines: 1, // 줄 수 조정
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: hintTextStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
                // 가로 스크롤을 지원하도록 설정
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
