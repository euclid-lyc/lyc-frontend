import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/screen/my_page_screen.dart';
import 'package:lyc_flutter_project/screens/find_id_screen_1.dart';
import 'package:lyc_flutter_project/screens/find_password_screen_1.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_1.dart';
import 'package:provider/provider.dart';
import '../../styles/app_text_style.dart';
import '../../widget/Controller.dart';
import '../Provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Controller _idController = Controller();
  final Controller _pwController = Controller();


  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.beige,
        toolbarHeight: 200,
        flexibleSpace: Center(
          child: Text(
            'LEAD YOUR CLOSET',
            style: app_text_style.title,
            textAlign: TextAlign.center,
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
                  buildIncome('아이디', '아이디를 입력해 주세요', _idController),
                  buildIncome('비밀번호', '비밀번호를 입력해 주세요', _pwController),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: SizedBox(
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildMoveButton(
                              context, '회원가입', JoinMembershipScreen1()),
                          buildMoveButton(context, '아이디 찾기', FindIdScreen1()),
                          buildMoveButton(
                              context, '비밀번호 찾기', FindPasswordScreen1()),
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
                      onPressed: () async {
                        final id = _idController.controller.text;
                        final pw = _pwController.controller.text;

                        await loginProvider.login(id, pw, context); // 로그인 요청

                        if (loginProvider.isLoggedIn &&
                            loginProvider.memberId != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => MyPageScreen(
                                memberId:
                                    loginProvider.memberId!, // memberId를 전달합니다.
                              ),
                            ),
                          );
                        }
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
                        buildOtherLoginButton('assets/icon_naver.png'),
                        buildOtherLoginButton('assets/icon_kakao.png'),
                        buildOtherLoginButton('assets/icon_google.png'),
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

  Widget buildIncome(String text, String hint, Controller controller) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 18.5, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
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
              alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: TextField(
                    controller: controller.controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: app_text_style.hint,
                    ),
                    obscureText: text == '비밀번호', // 비밀번호 입력 필드에서 텍스트를 숨깁니다.
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMoveButton(BuildContext context, String text, Widget next) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => next),
        );
      },
      child: Text(
        text,
        style: app_text_style.linkTextStyle,
      ),
    );
  }

  Widget buildOtherLoginButton(String icon) {
    return IconButton(
      icon: Image.asset(
        icon,
        width: 35,
        height: 35,
      ),
      onPressed: () {
        // 소셜 로그인 버튼 클릭 시 동작 구현
      },
    );
  }
}
