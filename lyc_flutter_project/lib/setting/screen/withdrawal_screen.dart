import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/style/text_style.dart';
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

import '../widget/wtihdrawal_content.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "회원 탈퇴"),
      body: DefaultPadding(
        bottom: 20.0,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "유클리드를 탈퇴하시겠습니까?",
                style: TITLE_STYLE.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "계정을 탈퇴할 경우 몇 가지 제한사항이 발생할 수 있습니다. "
                "계정을 탈퇴하기 전 상기 내용을 반드시 확인하여 주시기 바랍니다.",
                style: CONTENT_STYLE,
              ),
              const SizedBox(height: 20.0),
              const WithdrawalContent(
                title: "1. 서비스 이용 제한",
                content:
                    "계정 탈퇴 시 유클리드의 모든 기능을 이용할 수 없으며 이전에 등록한 데이터에 접근할 수 없습니다.",
              ),
              const SizedBox(height: 20.0),
              const WithdrawalContent(
                title: "2. 유저 데이터 삭제",
                content:
                    "계정 탈퇴 시 회원정보, 스타일 정보, 피드 정보, DM 내역, 코디 매칭 서비스 내역 등이 모두 삭제되며 이것을 복구할 수 없습니다.",
              ),
              const SizedBox(height: 20.0),
              const WithdrawalContent(
                title: "3. 30일 이내 가입 제한",
                content: "계정 탈퇴 시 동일한 이메일로 30일 이내 재가입 할 수 없습니다.",
              ),
              const SizedBox(height: 26.0),
              Text(
                "패스워드 입력",
                style: CONTENT_STYLE.copyWith(
                  color: Colors.black,
                ),
              ),
              const CustomTextFormField(
                obscureText: true,
                hint: "패스워드를 입력해주세요",
              ),
              const SizedBox(height: 26.0),
              TwoButtons(
                fstOnPressed: () => Navigator.of(context).pop(),
                scdOnPressed: tmp,
                scdBackColor: Colors.black,
                scdLabel: "탈퇴하기",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void tmp() {}