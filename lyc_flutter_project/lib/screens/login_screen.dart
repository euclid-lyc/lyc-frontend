import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/screens/join_membership_screen_1.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

    TextStyle linkTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      decoration: TextDecoration.underline,
      height: 1,
      letterSpacing: -0.1,
      color: Color(0xFF000000),
      decorationColor: Color(0xFF000000),
    );

    TextStyle otherLoginTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.5,
      letterSpacing: -0.1,
      color: Color(0xFF718096),
    );

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.beige,
        toolbarHeight: 200, // 원하는 높이로 설정 (예: 200.0)
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '대충 로고',
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                '유클리드 소개',
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(7, 0, 7, 25),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 4.5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '아이디',
                              style: labelTextStyle,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(18, 10.5, 18, 11.5),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '아이디를 입력해주세요',
                                hintStyle: hintTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5.5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '패스워드',
                              style: labelTextStyle,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(18, 10.5, 18, 11.5),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '패스워드를 입력해주세요',
                                hintStyle: hintTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0.9, 35.5),
                    child: SizedBox(
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const JoinMembershipScreen1()),
                              );
// 회원가입 버튼 눌렀을 때의 동작 구현
                            },
                            child: Text(
                              '회원가입',
                              style: linkTextStyle,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
// 아이디찾기 버튼 눌렀을 때의 동작 구현
                            },
                            child: Text(
                              '아이디찾기',
                              style: linkTextStyle,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
// 비밀번호찾기 버튼 눌렀을 때의 동작 구현
                            },
                            child: Text(
                              '비밀번호찾기',
                              style: linkTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 150, 14.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0.5, 7, 0.5),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.lightGrey),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: 17,
                            height: 17,
                          ),
                        ),
                        Text(
                          '자동로그인',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            height: 1.8,
                            color: Color(0xFF383838),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
// 로그인 버튼 눌렀을 때의 동작 구현
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.beige,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.fromLTRB(1, 11, 0, 11),
                    ),
                    child: Container(
                      width: 230,
                      child: Text(
                        '로그인',
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
            TextButton(
              onPressed: () {
// 다른 계정으로 로그인 버튼 눌렀을 때의 동작 구현
              },
              child: Text(
                '다른 계정으로 로그인',
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
    );
  }
}
