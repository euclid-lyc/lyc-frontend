import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_input_field.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../styles/app_text_style.dart';
import '../Provider/find_id_provider.dart';
import 'find_id_screen_3.dart';

class FindIdScreen2 extends StatelessWidget {
  const FindIdScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    String code='';
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
                            style: AppTextStyle.labelTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        CustomInputField(
                          label: '인증번호',
                          hint: '인증번호를 입력해 주세요',
                          onChanged: (p0) => code = p0,
                          inputType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CustomNextButton(
                      onPressed: () async {
                        try {
                          final resp = await value.checkVerificationCode(code);
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FindIdScreen3(
                                  loginId: resp,
                                ),
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
          );
        },
      ),
    );
  }
}


