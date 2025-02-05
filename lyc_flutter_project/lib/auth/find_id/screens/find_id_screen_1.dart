import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../widget/Controller.dart';
import '../Provider/find_id_provider.dart';
import 'find_id_screen_2.dart';

class FindIdScreen1 extends StatelessWidget {
  FindIdScreen1({super.key});

  final Controller _nameController = Controller();
  final Controller _emailController = Controller();

  @override
  Widget build(BuildContext context) {
    final findIdProvider = Provider.of<FindIdProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "아이디 찾기"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(32, 28, 32, 28),
                margin: const EdgeInsets.fromLTRB(32, 32, 32, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 28),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Step 1. 이메일 입력',
                        style: AppTextStyle.littleTitle,
                      ),
                    ),
                    _CustomInputField(
                      label: '이름',
                      hint: '이름을 입력해주세요',
                      controller: _nameController.controller,
                      inputType: TextInputType.text,
                    ),
                    _CustomInputField(
                      label: '가입한 이메일',
                      hint: '이메일을 입력해주세요',
                      controller: _emailController.controller,
                      inputType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: _CustomButton(
                        onPressed: () async {
                          findIdProvider.name = _nameController.controller.text;
                          findIdProvider.email =
                              _emailController.controller.text;
                          try {
                            await findIdProvider.getVerificationCode();
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FindIdScreen2(),
                                ),
                              );
                            }
                          } catch (e) {
                            debugPrint('Error: $e');
                          }
                        },
                        text: '다음',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: _CustomTextButton(
                  text: '다른 계정으로 로그인',
                  onPressed: () {
                    // 다른 계정으로 로그인 버튼 눌렀을 때의 동작 구현
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: _SocialLoginButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;

  const _CustomInputField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label,
              style: AppTextStyle.labelTextStyle.copyWith(fontSize: 14),
            ),
          ),
          Container(
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintText: hint,
                  hintStyle: AppTextStyle.hint.copyWith(fontSize: 14),
                  border: InputBorder.none,
                ),
                keyboardType: inputType,
              ),
            ),
          )
        ],
      ),
    );
  }
}




class _CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const _CustomButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColor.beige,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: SizedBox(
        width: 232,
        child: Text(
          text,
          style: AppTextStyle.button,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _CustomTextButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.otherLoginTextStyle,
      ),
    );
  }
}

class _SocialLoginButtons extends StatelessWidget {
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
