import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/screen/my_page_screen.dart';
import 'package:lyc_flutter_project/screens/find_id_screen_1.dart';
import 'package:lyc_flutter_project/screens/find_password_screen_1.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_1.dart';
import '../styles/app_text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.beige,
        toolbarHeight: 200,
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '대충 로고',
                style: app_text_style.title,
                textAlign: TextAlign.center,
              ),
              Text(
                '유클리드 소개',
                style: app_text_style.title,
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
              width: 296,
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
                    margin: EdgeInsets.fromLTRB(0, 18.5, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '아이디',
                          style: app_text_style.labelTextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.5),
                          child: Container(
                            width: 230,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '아이디를 입력해주세요',
                                  hintStyle: app_text_style.hint,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '패스워드',
                          style: app_text_style.labelTextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.5),
                          child: Container(
                            width: 230,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '패스워드를 입력해주세요',
                                  hintStyle: app_text_style.hint,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: SizedBox(
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const JoinMembershipScreen1()),
                              );
                            },
                            child: Text(
                              '회원가입',
                              style: app_text_style.linkTextStyle,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FindIdScreen1()),
                              );
                            },
                            child: Text(
                              '아이디찾기',
                              style: app_text_style.linkTextStyle,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FindPasswordScreen1()),
                              );
                            },
                            child: Text(
                              '비밀번호찾기',
                              style: app_text_style.linkTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14.5),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: SizedBox(
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
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyPageScreen(
                                    memberId: 1,
                                  )),
                        ); // 로그인 버튼 눌렀을 때의 동작 구현
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: SizedBox(
                        width: 230,
                        child: Text(
                          '로그인',
                          style: app_text_style.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25), // 로그인 버튼 밑에 여백 추가
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // 다른 계정으로 로그인 버튼 눌렀을 때의 동작 구현
                    },
                    child: Text(
                      '다른 계정으로 로그인',
                      style: app_text_style.otherLoginTextStyle,
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
          ],
        ),
      ),
    );
  }
}
