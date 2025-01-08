import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/home/screen/home_screen.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';

import '../../routes/routes.dart';



class SubmissionSuccessScreen extends StatelessWidget {
  const SubmissionSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "의뢰서 작성하기"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              // 최대 너비 설정
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
                    child: const Text(
                      '의뢰서 접수 완료',
                      style: AppTextStyle.littleTitle,
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
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icon_fanfare.svg',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(4, 0, 0, 18.5),
                    child: Text(
                      '의뢰서 접수가 완료되었습니다.\n 디렉터가 의뢰를 수락하면 채팅이 시작됩니다.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.otherLoginTextStyle.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.5),
                    child: TextButton(
                      onPressed: () {
                        // context.goNamed(Routes.home.name);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const SizedBox(
                        width: 230,
                        child: Text(
                          '홈 화면으로 돌아가기',
                          style: AppTextStyle.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 43),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
