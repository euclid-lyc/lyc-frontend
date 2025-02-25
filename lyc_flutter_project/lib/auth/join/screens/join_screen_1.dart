import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../common/widget/social_login_buttons.dart';
import '../Provider/join_provider.dart';
import '../widget/join_text_form_field.dart';
import 'join_screen_2.dart';

class JoinScreen1 extends StatefulWidget {
  const JoinScreen1({super.key});

  @override
  State<JoinScreen1> createState() {
    return JoinScreenState1();
  }
}

class JoinScreenState1 extends State<JoinScreen1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "회원가입"),
      body: Consumer<JoinProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CustomLoading());
        }
        return Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                            'Step 1. 아이디 비밀번호 설정',
                            style: AppTextStyle.littleTitle,
                          ),
                        ),
                        buildNameField(value.updateName),
                        buildIdField(value.updateLoginId),
                        buildPhoneField(value.updatePhone),
                        buildEmailField(value.updateEmail),
                        buildPwField(value.updateLoginPw),
                        buildPwCheckField(value.updateLoginPwCheck, value.pw),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CustomNextButton(
                            onPressed: () async {
                              try {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  await value.requestVerificationCode();
                                  if (context.mounted) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const JoinScreen2()),
                                    );
                                  }
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('인증 코드 요청 실패: ${e.toString()}')),
                                );
                              }
                            },
                            text: '다음',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: SocialLoginButtons(),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildNameField(dynamic Function(String) updateName) {
    return JoinTextFormField(
      labelText: '이름',
      hint: '이름을 입력해 주세요',
      onChanged: (text) => updateName(text!),
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 2) {
          return '이름을 두 글자 이상 입력해 주세요.';
        }
        return null;
      },
    );
  }

  Widget buildIdField(Function(String) updateId) {
    return JoinTextFormField(
      labelText: '아이디',
      hint: '아이디를 입력해 주세요',
      onChanged: (text) => updateId(text!),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '아이디를 입력해 주세요.';
        } else if (value.length < 6) {
          return '아이디는 6글자 이상이어야 합니다.';
        } else if (!RegExp('(?=.*[a-zA-Z])').hasMatch(value)) {
          return '아이디에는 특수문자가 포함되어야 합니다.';
        }
        return null;
      },
    );
  }

  Widget buildPhoneField(Function(String) updatePhone) {
    return JoinTextFormField(
      labelText: '전화번호',
      hint: '전화번호를 입력해주세요.',
      onChanged: (text) => updatePhone(text!),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '전화번호를 입력해주세요.';
        } else if (value.length != 11) {
          return '전화번호는 11자여야 합니다.';
        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return '전화번호에는 숫자만 입력 가능합니다.';
        }
        return null;
      },
    );
  }

  Widget buildEmailField(Function(String) updateEmail) {
    return JoinTextFormField(
      labelText: '이메일',
      hint: '이메일을 입력해 주세요',
      onChanged: (text) => updateEmail(text!),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '이메일을 입력해주세요.';
        } else if (!value.contains('@')) {
          return '형식이 올바르지 않습니다.';
        }
        return null;
      },
    );
  }

  Widget buildPwField(Function(String) updatePw) {
    return JoinTextFormField(
      labelText: '비밀번호',
      hint: '비밀번호를 입력해 주세요',
      onChanged: (text) => updatePw(text!),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '비밀번호를 입력해 주세요.';
        } else if (value.length < 8) {
          return '비밀번호는 8자 이상이어야 합니다.';
        } else if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
            .hasMatch(value)) {
          return '비밀번호에는 특수 문자가 포함되어야 합니다.';
        }
        return null;
      },
    );
  }

  Widget buildPwCheckField(Function(String) updatePwCheck, String pwCheck) {
    return JoinTextFormField(
      labelText: '비밀번호 확인',
      hint: '비밀번호를 다시 한 번 입력해 주세요',
      onChanged: (text) => updatePwCheck(text!),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '비밀번호를 확인해 주세요.';
        } else if (value != pwCheck) {
          return '비밀번호가 서로 일치하지 않습니다.';
        }
        return null;
      },
    );
  }


}
