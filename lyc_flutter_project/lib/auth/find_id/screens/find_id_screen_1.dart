import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_input_field.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../common/widget/social_login_buttons.dart';
import '../Provider/find_id_provider.dart';
import 'find_id_screen_2.dart';
import 'package:lyc_flutter_project/commissions/widget/custom_dialog.dart';

class FindIdScreen1 extends StatefulWidget {
  const FindIdScreen1({super.key});

  @override
  _FindIdScreen1State createState() => _FindIdScreen1State();
}

class _FindIdScreen1State extends State<FindIdScreen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "아이디 찾기"),
      body: Consumer<FindIdProvider>(
        builder: (context, value, child) {
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
                          onChanged: (p0) => value.name = p0,
                          inputType: TextInputType.text,
                        ),
                        CustomInputField(
                          label: '가입한 이메일',
                          hint: '이메일을 입력해주세요',
                          onChanged: (p0) => value.email = p0,
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
                                      builder: (context) =>
                                          const FindIdScreen2(),
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const CustomDialog(
                                      title: "일치하는 회원정보가 존재하지 않습니다.",
                                    ),
                                  );
                                }
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
        },
      ),
    );
  }
}
