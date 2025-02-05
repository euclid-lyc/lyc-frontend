import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/auth/find_pw/model/info.dart';
import 'package:lyc_flutter_project/auth/find_pw/provider/find_pw_provider.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../widget/Controller.dart';
import 'find_password_screen_2.dart';

class FindPasswordScreen1 extends StatelessWidget {
  FindPasswordScreen1({super.key});

  final Controller _nameController = Controller();
  final Controller _emailController = Controller();
  final Controller _loginIdController = Controller();

  @override
  Widget build(BuildContext context) {
    final findPwProvider = Provider.of<FindPwProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "비밀번호 찾기"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(29, 28.5, 29, 33),
                width: 296,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Step 1. 이메일 입력',
                        style: AppTextStyle.littleTitle,
                      ),
                    ),
                    buildInputField('이름', '이름을 입력해주세요', AppTextStyle.labelTextStyle, AppTextStyle.hint, _nameController.controller,TextInputType.text),
                    buildInputField('아이디', '아이디를 입력해주세요', AppTextStyle.labelTextStyle, AppTextStyle.hint, _loginIdController.controller,TextInputType.text),
                    buildInputField('가입한 이메일', '이메일을 입력해주세요', AppTextStyle.labelTextStyle, AppTextStyle.hint, _emailController.controller,TextInputType.emailAddress),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.5), // 위아래 여백 설정
                      child: TextButton(
                        onPressed: () async {
                          final info = Info(name: _nameController.controller.text, loginId: _loginIdController.controller.text, email: _emailController.controller.text);
                          try {
                            await findPwProvider.getVerificationCode();
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FindPasswordScreen2(),
                                ),
                              );
                            }
                          } catch (e) {
                            // 에러 처리
                            debugPrint('Error: $e');
                          }
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FindPasswordScreen2(),
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const SizedBox(
                          width: 230,
                          child: Text(
                            '다음',
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
                padding: const EdgeInsets.symmetric(vertical: 20), // 위아래 여백 설정
                child: TextButton(
                  onPressed: () {
                    // 다른 계정으로 로그인 버튼 눌렀을 때의 동작 구현
                  },
                  child: const Text(
                    '다른 계정으로 로그인',
                    style: AppTextStyle.otherLoginTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0), // 위아래 여백 설정
                child: SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint, TextStyle labelTextStyle,
      TextStyle hintTextStyle, TextEditingController controller,TextInputType tetInputType) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4.5),
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: labelTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: TextField(
                controller: controller,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: hintTextStyle,
                  border: InputBorder.none,
                ),
                keyboardType: tetInputType,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
