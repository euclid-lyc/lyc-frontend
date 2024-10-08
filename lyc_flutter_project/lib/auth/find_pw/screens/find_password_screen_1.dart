import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/auth/find_pw/model/Info.dart';
import 'package:lyc_flutter_project/auth/find_pw/provider/FindPwProvider.dart';
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
                padding: EdgeInsets.fromLTRB(29, 28.5, 29, 33),
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
                      margin: EdgeInsets.only(bottom: 25),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Step 1. 인증수단 선택',
                        style: app_text_style.littleTitle,
                      ),
                    ),
                    buildInputField(
                        '이름',
                        '이름을 입력해주세요',
                        app_text_style.labelTextStyle,
                        app_text_style.hint,
                        _nameController.controller),
                    buildInputField(
                        '아이디',
                        '아이디를 입력해주세요',
                        app_text_style.labelTextStyle,
                        app_text_style.hint,
                        _loginIdController.controller),
                    buildInputField(
                        '가입한 이메일로 찾기',
                        '이메일을 입력해주세요',
                        app_text_style.labelTextStyle,
                        app_text_style.hint,
                        _emailController.controller),
                    Padding(
                      padding: EdgeInsets.only(top: 30.5), // 위아래 여백 설정
                      child: TextButton(
                        onPressed: () async {
                          final info = Info(
                              name: _nameController.controller.text,
                              loginId: _loginIdController.controller.text,
                              email: _emailController.controller.text);
                          try {
                            await findPwProvider.getVerificationCode(
                                info: info);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FindPasswordScreen2(),
                              ),
                            );
                          } catch (e) {
                            // 에러 처리
                            print('Error: $e');
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  FindPasswordScreen2(),
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
                            '다음',
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
                padding: EdgeInsets.symmetric(vertical: 20), // 위아래 여백 설정
                child: TextButton(
                  onPressed: () {
                    // 다른 계정으로 로그인 버튼 눌렀을 때의 동작 구현
                  },
                  child: Text(
                    '다른 계정으로 로그인',
                    style: app_text_style.otherLoginTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0), // 위아래 여백 설정
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
      TextStyle hintTextStyle, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.5),
      child: Column(
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
            width: double.infinity, // 너비를 입력 필드에 맞게 설정
            height: 40, // 높이 설정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 15), // 좌우 및 상하 여백 설정
              child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  // 텍스트 수직 정렬
                  textAlign: TextAlign.start,
                  // 텍스트 수평 정렬
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: hintTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  controller: controller),
            ),
          ),
        ],
      ),
    );
  }
}
