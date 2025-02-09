import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_next_button.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_input_field.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/social_login_buttons.dart';
import '../provider/find_pw_provider.dart';
import 'find_pw_screen_2.dart';

class FindPwScreen1 extends StatelessWidget {
  const FindPwScreen1({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "비밀번호 찾기"),
        body: Consumer<FindPwProvider>(
        builder: (context, value, child)
    {
      if (value.isLoading) {
        return const Center(child: CustomLoading());
      }
      return Center(
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
                    CustomInputField(
                      label: '이름',
                      hint: '이름을 입력해주세요',
                      onChanged:(p0)=> value.name = p0,
                      inputType: TextInputType.text,
                    ),
                    CustomInputField(
                      label: '아이디',
                      hint: '아이디를 입력해주세요',
                      onChanged:(p0)=> value.id = p0,
                      inputType: TextInputType.text,
                    ),
                    CustomInputField(
                      label: '가입한 이메일',
                      hint: '이메일을 입력해주세요',
                      onChanged:(p0)=> value.email = p0,
                      inputType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomNextButton(
                        onPressed: () async {
                          try {
                            await value.getVerificationCode();
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FindPwScreen2(),
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
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "다른 계정으로 로그인",
                      style: AppTextStyle.otherLoginTextStyle,
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: SocialLoginButtons(),
              ),
            ],
          ),
        ),
      );
    }
    )
    );
  }
}
