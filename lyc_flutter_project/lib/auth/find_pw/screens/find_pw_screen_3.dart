import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/two_buttons.dart';
import '../../../widget/Controller.dart';
import '../provider/find_pw_provider.dart';
import 'find_pw_screen_2.dart';
import 'find_pw_screen_4.dart';

class FindPwScreen3 extends StatelessWidget {
  FindPwScreen3({super.key});

  final Controller _pwController = Controller();
  final Controller _confirmPwController = Controller();

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
                    _CustomInputField(
                      label: '새로운 비밀번호',
                      hint: '비밀번호를 입력해 주세요',
                      controller: _pwController.controller,
                      inputType: TextInputType.text,
                    ),
                    _CustomInputField(
                      label: '비밀번호 확인',
                      hint: '비밀번호를 다시 입력해 주세요',
                      controller: _confirmPwController.controller,
                      inputType: TextInputType.text,
                    ),

                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  child: TwoButtons(
                    fstLabel: '이전',
                    fstBackColor: AppColor.grey,
                    fstForeColor: Colors.black,
                    fstOnPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindPwScreen2(),
                        ),
                      );
                    },
                    scdLabel: '다음',
                    scdBackColor: AppColor.beige,
                    scdForeColor: Colors.white,
                    scdOnPressed: () async {
                      try {
                        await findPwProvider.updatePw(
                          pw: _pwController.controller.text,
                          confirmPw: _confirmPwController.controller.text,
                        );
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
                  )),
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
