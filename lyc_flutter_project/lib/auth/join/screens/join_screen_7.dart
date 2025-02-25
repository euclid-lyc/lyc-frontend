import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import '../../../common/widget/custom_next_button.dart';
import 'login_screen.dart';

class JoinScreen7 extends StatelessWidget {
  const JoinScreen7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(title: "회원가입"),
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
                        'Step 7. 회원가입 완료',
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
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icon_fanfare.svg',
                          width: 124,
                          height: 124,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 28),
                      child: Text(
                        '회원가입이 성공적으로 완료되었습니다.',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.labelTextStyle
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 44),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomNextButton(
                  onPressed: () async {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }
                  },
                  text: '로그인 화면',
                ),
              ),
            ],
          ),
        )));
  }
}
