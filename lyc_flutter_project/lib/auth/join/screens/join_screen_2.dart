import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/auth/join/Provider/join_provider.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../commissions/widget/custom_dialog.dart';
import '../../../common/widget/custom_input_field.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../common/widget/normal_appbar.dart';
import '../../../styles/app_text_style.dart';
import 'join_screen_3.dart';

class JoinScreen2 extends StatelessWidget {
  const JoinScreen2({super.key});


  @override
  Widget build(BuildContext context) {
    String code='';
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "회원가입"),
      body: Consumer<JoinProvider>(
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
                         await value.checkVerificationCode(code);
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const JoinScreen3()
                              ),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) => const CustomDialog(
                                title: "인증번호가 일치하지 않습니다.",
                                subtitle: "이메일 입력 화면으로 돌아갑니다.",
                              ),
                            ).then((_) {
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            });

                          }
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
