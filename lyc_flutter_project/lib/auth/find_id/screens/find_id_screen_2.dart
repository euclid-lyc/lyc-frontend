import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:provider/provider.dart';
import '../../../styles/app_text_style.dart';
import '../../../widget/Controller.dart';
import '../Provider/findIdProvider.dart';
import '../Provider/SendEmailProvider.dart';
import 'find_id_screen_1.dart';
import 'find_id_screen_3.dart';

class FindIdScreen2 extends StatelessWidget {
  FindIdScreen2({super.key});

  final Controller _codeController = Controller();

  @override
  Widget build(BuildContext context) {

    final sendEmailProvider =
    Provider.of<SendEmailProvider>(context,
        listen: false);
    final findIdProvider = Provider.of<FindIdProvider>(
        context,
        listen: false);

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "아이디 찾기"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(), // 빈 컨테이너로 여백 제공
          ),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.fromLTRB(22, 28.5, 22, 0),
              width: 296,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 7, 43.5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Step 2. 본인인증',
                      style: app_text_style.littleTitle,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 49),
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
                    margin: const EdgeInsets.fromLTRB(4, 0, 0, 18.5),
                    child: Text(
                      '입력하신 이메일로 \n 인증번호가 전송되었습니다.',
                      textAlign: TextAlign.center,
                      style: app_text_style.otherLoginTextStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 252,
                    height: 37,
                    child: TextField(
                      controller: _codeController.controller,
                      decoration: InputDecoration(
                        hintText: '인증번호를 입력해 주세요',
                        hintStyle: app_text_style.hint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 43),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // '이전' 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FindIdScreen1(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.grey,
                          minimumSize: const Size(120, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '이전',
                          style: app_text_style.hint.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // '다음' 버튼
                      TextButton(
                        onPressed: () async {
                          try {
                            await findIdProvider.sendVerification(
                              name: sendEmailProvider.name,
                              email: sendEmailProvider.email,
                              verificationCode:  _codeController.controller.text
                            );
                            final String loginId = await findIdProvider
                                    .storageService
                                    .read('loginId') ?? '';
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FindIdScreen3(loginId: loginId),
                              ),
                            );
                          } catch (e) {
                            print('Error: $e');
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.beige,
                          minimumSize: const Size(120, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '다음',
                          style: app_text_style.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
