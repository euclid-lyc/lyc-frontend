import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/widget/title_button.dart';
import 'package:lyc_flutter_project/setting/widget/title_text.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(
        backButton: false,
        title: "설정",
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                title: '일반',
                content: '정보 변경 및 환경 설정',
              ),
              TitleButton(
                label: "회원정보 변경",
                onPressed: tmp,
              ),
              TitleButton(
                label: "스타일 정보 변경",
                onPressed: tmp,
              ),
              TitleButton(
                label: "푸시알림 설정",
                onPressed: tmp,
              ),
              TitleButton(
                label: "차단 계정 관리",
                onPressed: tmp,
              ),
              SizedBox(height: 30.0),
              TitleText(
                title: "버전",
                content: "유클리드 버전 정보",
              ),
              TitleButton(
                label: "버전 정보",
                onPressed: tmp,
                note: "v 1.1.3",
              ),
              TitleButton(
                label: "추가된 기능",
                onPressed: tmp,
              ),
              SizedBox(height: 30.0),
              TitleText(
                title: "위험구역",
                content: "로그아웃 및 회원탈퇴",
              ),
              TitleButton(
                label: "로그아웃",
                onPressed: tmp,
              ),
              TitleButton(
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