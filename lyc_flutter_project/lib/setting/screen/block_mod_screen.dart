import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_refresh_indicator.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/right_button_in_list.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/model/block_member.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:provider/provider.dart';

class BlockModScreen extends StatelessWidget {
  const BlockModScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "차단 계정 관리"),
      body: Consumer<SettingProvider>(
        //Todo: refresh
        builder: (context, value, child) {
          return DefaultPadding(
            bottom: 0,
            child: value.loadingBlockMembers
                ? renderLoading(value)
                : ListView.builder(
                    itemCount: value.blockMembers.length,
                    itemBuilder: (context, index) {
                      final BlockMember member = value.blockMembers[index];
                      return MemberList(
                        memberId: member.memberId,
                        profile: member.profileImage,
                        nickname: member.nickname,
                        button: const RightButtonInList(
                          backgroundColor: AppColor.brown,
                          foregroundColor: Colors.white,
                          label: "해제",
                          onPressed: tmp,
                        ),
                        content: member.introduction,
                      );
                      // return MemberList();
                    },
                  ),
          );
        },
      ),
    );
  }

  renderLoading(SettingProvider provider) {
    provider.getBlockMembers();
    return const Center(
      child: CustomLoading(),
    );
  }
}

void tmp() {}
