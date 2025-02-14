import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/icon_naver.png',
              width: 36,
              height: 36,
            ),
            onPressed: () {
              // 네이버 로그인 버튼 눌렀을 때의 동작 구현
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/icon_kakao.png',
              width: 36,
              height: 36,
            ),
            onPressed: () {
              // 카카오톡 로그인 버튼 눌렀을 때의 동작 구현
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/icon_google.png',
              width: 36,
              height: 36,
            ),
            onPressed: () {
              // 구글 로그인 버튼 눌렀을 때의 동작 구현
            },
          ),
        ],
      ),
    );
  }
}