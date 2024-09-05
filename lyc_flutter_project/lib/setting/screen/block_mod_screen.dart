import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/right_button_in_list.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

class BlockModScreen extends StatelessWidget {
  const BlockModScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "차단 계정 관리"),
      body: DefaultPadding(
        bottom: 0,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const MemberList(
              profile: "assets/ex_profile.png",
              nickname: "카리나",
              id: "katarinabluu",
              button: RightButtonInList(
                backgroundColor: AppColor.brown,
                foregroundColor: Colors.white,
                label: "해제",
                onPressed: tmp,
              ),
              content: "소개",
            );
            // return MemberList();
          },
        ),
      ),
    );
  }
}

void tmp() {}