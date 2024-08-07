import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/screen/info_mod_screen.dart';
import 'package:lyc_flutter_project/setting/widget/title_button.dart';
import 'package:lyc_flutter_project/setting/widget/title_text.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        backButton: false,
        title: "설정",
      ),
      body: DefaultPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                title: '일반',
                content: '정보 변경 및 환경 설정',
              ),
              TitleButton(
                label: "회원정보 변경",
                onPressed: () => pushWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InfoModScreen();
                    },
                  ),
                ),
              ),
              const TitleButton(
                label: "스타일 정보 변경",
                onPressed: tmp,
              ),
              const TitleButton(
                label: "푸시알림 설정",
                onPressed: tmp,
              ),
              const TitleButton(
                label: "차단 계정 관리",
                onPressed: tmp,
              ),
              const SizedBox(height: 30.0),
              const TitleText(
                title: "버전",
                content: "유클리드 버전 정보",
              ),
              const TitleButton(
                label: "버전 정보",
                onPressed: tmp,
                note: "v 1.1.3",
              ),
              const TitleButton(
                label: "추가된 기능",
                onPressed: tmp,
              ),
              const SizedBox(height: 30.0),
              const TitleText(
                title: "위험구역",
                content: "로그아웃 및 회원탈퇴",
              ),
              const TitleButton(
                label: "로그아웃",
                onPressed: tmp,
              ),
              const TitleButton(
                label: "회원 탈퇴",
                onPressed: tmp,
                backgroundColor: AppColor.deepGrey,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void tmp() {}
