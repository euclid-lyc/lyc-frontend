import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_input_field.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../provider/find_pw_provider.dart';
import 'find_pw_screen_4.dart';

class FindPwScreen3 extends StatelessWidget {
  const FindPwScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    String pw = '';
    String confirmPw = '';
    return Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(title: "비밀번호 찾기",backButton: false),
        body: Consumer<FindPwProvider>(builder: (context, value, child) {
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
                            'Step 3. 비밀번호 재설정',
                            style: AppTextStyle.littleTitle,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(bottom: 12),
                          child: const Text(
                            '영문, 숫자, 특수문자를 조합하여 8자 이상 20자 이하로\n설정해 주세요.',
                            style: AppTextStyle.hint,
                          ),
                        ),
                        CustomInputField(
                          label: '새로운 비밀번호',
                          hint: '비밀번호를 입력해 주세요',
                          onChanged: (p0) => pw = p0,
                          inputType: TextInputType.text,
                        ),
                        CustomInputField(
                          label: '비밀번호 확인',
                          hint: '비밀번호를 다시 입력해 주세요',
                          onChanged: (p0) => confirmPw = p0,
                          inputType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                  CustomNextButton(
                    onPressed: () async {
                      try {
                        await value.updatePw(pw: pw, confirmPw: confirmPw);
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FindPwScreen4(),
                            ),
                          );
                        }
                      } catch (e) {
                        debugPrint('Error: $e');
                      }
                    },
                    text: '다음',
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
