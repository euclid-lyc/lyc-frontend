import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:provider/provider.dart';
import '../../../styles/app_text_style.dart';
import '../../../widget/Controller.dart';
import '../../find_id/Screens/find_id_screen_1.dart';
import '../../find_pw/screens/find_pw_screen_1.dart';
import '../Provider/login_provider.dart';
import 'join_screen_1.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Controller _idController = Controller();
  final Controller _pwController = Controller();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.beige,
        toolbarHeight: 100,
        title: const Center(
          child: Text(
            'LEAD YOUR CLOSET',
            style: AppTextStyle.title,
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
              padding: const EdgeInsets.all(20),
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
                    margin: const EdgeInsets.only(top: 13),
                    child: SizedBox(
                      width: 224,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildMoveButton(context, '회원가입', const JoinScreen1()),
                          buildMoveButton(context, '아이디찾기',  const FindIdScreen1()),
                          buildMoveButton(
                              context, '비밀번호찾기', const FindPwScreen1()),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 14.5),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: const SizedBox(
                            width: 17,
                            height: 17,
                          ),
                        ),
                        const Text(
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
                    padding: const EdgeInsets.only(top: 15),
                    child: TextButton(
                      onPressed: () async {
                        final id = _idController.controller.text;
                        final pw = _pwController.controller.text;

                        await loginProvider.login(id, pw, context); // 로그인 요청
                        if (loginProvider.isLoggedIn &&
                            context.mounted) {
                          context.goNamed(Routes.home.name);
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const SizedBox(
                        width: 230,
                        child: Text(
                          '로그인',
                          style: AppTextStyle.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25), // 로그인 버튼 밑에 여백 추가
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text(
                      '다른 계정으로 로그인',
                      style: AppTextStyle.otherLoginTextStyle,
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
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyle.labelTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              width: 240,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                  child: TextField(
                    controller: controller.controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: AppTextStyle.hint,
                    ),
                    obscureText: text == '비밀번호', // 입력 필드에서 텍스트 숨기기
                    onChanged: (value) {},
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
        style: AppTextStyle.linkTextStyle,
      ),
    );
  }

  Widget buildOtherLoginButton(String icon) {
    return IconButton(
      icon: Image.asset(
        icon,
        width: 36,
        height: 36,
      ),
      onPressed: () {
        // 소셜 로그인 버튼 클릭 시 동작 구현
      },
    );
  }
}
