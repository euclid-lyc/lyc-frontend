import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyc_flutter_project/auth/join/screens/login_screen.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import '../../../common/widget/two_buttons.dart';
import '../../../styles/app_text_style.dart';
import '../../find_pw/screens/find_pw_screen_1.dart';

class FindIdScreen3 extends StatelessWidget {
  const FindIdScreen3({super.key, required this.loginId});
  final String loginId;

  @override
  Widget build(BuildContext context) {
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
                margin: const EdgeInsets.all(32),
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
                        'Step 3. 아이디 확인',
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
                        '아이디 확인에 성공했습니다.',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.labelTextStyle
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    Text(loginId, style: AppTextStyle.littleTitle),
                    const Padding(
                      padding: EdgeInsets.only(top: 44),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: TwoButtons(
                    fstLabel: '로그인 화면',
                    fstBackColor: AppColor.grey,
                    fstForeColor: Colors.black,
                    fstOnPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    scdLabel: '비밀번호 찾기',
                    scdBackColor: AppColor.beige,
                    scdForeColor: Colors.white,
                    scdOnPressed: () async {
                      try {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FindPwScreen1(),
                          ),
                        );
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
