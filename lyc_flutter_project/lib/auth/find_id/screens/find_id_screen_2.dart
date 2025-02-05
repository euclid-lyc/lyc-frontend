import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/two_buttons.dart';
import '../../../styles/app_text_style.dart';
import '../../../widget/Controller.dart';
import '../Provider/find_id_provider.dart';
import 'find_id_screen_1.dart';
import 'find_id_screen_3.dart';

class FindIdScreen2 extends StatelessWidget {
  FindIdScreen2({super.key});

  final Controller _codeController = Controller();

  @override
  Widget build(BuildContext context) {
    final findIdProvider = Provider.of<FindIdProvider>(context, listen: false);

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
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 56),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Step 2. 본인인증',
                        style: AppTextStyle.littleTitle,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 56),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBBBBBB),
                        borderRadius: BorderRadius.circular(62),
                      ),
                      width: 124,
                      height: 124,
                      child: const Center(
                        child: Icon(
                          Icons.mail_outline_outlined,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 28),
                      child: Text(
                        '입력하신 이메일로 \n 인증번호가 전송되었습니다.',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.labelTextStyle
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    _CustomInputField(
                      label: '인증번호',
                      hint: '인증번호를 입력해 주세요',
                      controller: _codeController.controller,
                      inputType: TextInputType.number,
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
                          builder: (context) => FindIdScreen1(),
                        ),
                      );
                    },
                    scdLabel: '다음',
                    scdBackColor: AppColor.beige,
                    scdForeColor: Colors.white,
                    scdOnPressed: () async {
                      try {
                        final resp = await findIdProvider.checkVerificationCode(
                            _codeController.controller.text);
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FindIdScreen3(loginId: resp),
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
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
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
              borderRadius: BorderRadius.circular(12),
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


