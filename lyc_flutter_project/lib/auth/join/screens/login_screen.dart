import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_input_field.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../common/widget/social_login_buttons.dart';
import '../../../styles/app_text_style.dart';
import '../../find_id/Screens/find_id_screen_1.dart';
import '../../find_pw/screens/find_pw_screen_1.dart';
import '../Provider/login_provider.dart';
import 'join_screen_1.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<LoginProvider>(builder: (context, value, child) {
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
                      CustomInputField(
                        label: '아이디',
                        hint: '아이디를 입력해 주세요',
                        onChanged: (p0) => value.id = p0,
                        inputType: TextInputType.text,
                      ),
                      CustomInputField(
                        label: '비밀번호',
                        hint: '비밀번호를 입력해 주세요',
                        onChanged: (p0) => value.pw = p0,
                        inputType: TextInputType.text,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildMoveButton(context, '회원가입', const JoinScreen1()),
                          buildMoveButton(
                              context, '아이디찾기', const FindIdScreen1()),
                          buildMoveButton(
                              context, '비밀번호찾기', const FindPwScreen1()),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       margin: const EdgeInsets.only(right: 8),
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: AppColor.grey),
                      //         borderRadius: BorderRadius.circular(4),
                      //         color: Colors.white,
                      //       ),
                      //       child: const SizedBox(
                      //         width: 16,
                      //         height: 16,
                      //       ),
                      //     ),
                      //     const Text(
                      //       '자동로그인',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 10,
                      //         color: Color(0xFF383838),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: CustomNextButton(
                          onPressed: () async {
                            try {
                              await value.login(context); // 로그인 요청
                              if (value.isLoggedIn && context.mounted) {
                                context.goNamed(Routes.home.name);
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('로그인 실패: ${e.toString()}')),
                              );
                            }
                          },
                          text: '로그인',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          '다른 계정으로 로그인',
                          style: AppTextStyle.otherLoginTextStyle,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: SocialLoginButtons(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
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
        style: AppTextStyle.linkTextStyle
            .copyWith(fontSize: 12, decoration: TextDecoration.underline),
      ),
    );
  }
}
