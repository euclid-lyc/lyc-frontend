import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../common/dio/dio.dart';
import '../../../widget/Controller.dart';
import '../../../widget/normal_appbar.dart';
import '../provider/FindPwProvider.dart';
import 'find_password_screen_2.dart';
import 'find_password_screen_4.dart';

class FindPasswordScreen3 extends StatelessWidget {
  FindPasswordScreen3({super.key});

  final Controller _pwController = Controller();
  final Controller _pwCheckController = Controller();

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
                      child: Text(
                        'Step 3. 비밀번호 재설정',
                        style: app_text_style.littleTitle,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 18.5),
                      child: Text(
                        '영문, 숫자, 특수문자를 조합하여 8자 이상 20자 이하로 설정해 주세요.',
                        style: app_text_style.hint,
                      ),
                    ),
                    buildInputField(
                      '새로운 비밀번호',
                      '비밀번호를 입력해 주세요',
                      app_text_style.labelTextStyle,
                      app_text_style.hint,
                      _pwController.controller,
                    ),
                    buildInputField(
                        '비밀번호 확인',
                        '비밀번호를 다시 입력해주세요',
                        app_text_style.labelTextStyle,
                        app_text_style.hint,
                        _pwCheckController.controller),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 43), // 여백 설정
                child: SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // '이전' 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FindPasswordScreen2(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.grey,
                          minimumSize: const Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '이전',
                          style: app_text_style.hint.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // '다음' 버튼
                      TextButton(
                        onPressed: () async {
                          String? loginId =
                              await DioProvider().storage.read(key: 'loginId');
                          String? verificationCode = await DioProvider()
                              .storage
                              .read(key: 'verificationCode');
                          await findPwProvider.updatePw(
                              loginId: loginId ?? '',
                              password: _pwController.controller.text,
                              passwordConfirmation:
                                  _pwCheckController.controller.text,
                              verificationCode: verificationCode ?? '');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FindPasswordScreen4(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.beige,
                          minimumSize: const Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '다음',
                          style: app_text_style.button,
                          textAlign: TextAlign.center,
                        ),
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
      margin: const EdgeInsets.only(bottom: 8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            width: 230, // 너비 설정
            height: 40, // 높이 설정
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0), // 좌우 및 상하 여백 설정
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
                obscureText: true,
                controller: controller, // 비밀번호 입력 시 사용
              ),
            ),
          ),
        ],
      ),
    );
  }
}
