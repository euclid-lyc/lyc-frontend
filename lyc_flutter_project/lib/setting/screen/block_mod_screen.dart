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

class BlockModScreen extends StatefulWidget {
  const BlockModScreen({super.key});

  @override
  State<BlockModScreen> createState() => _BlockModScreenState();
}

class _BlockModScreenState extends State<BlockModScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<SettingProvider>().getBlockMembers();
    controller.addListener(listener);
  }

  void listener() {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      context.read<SettingProvider>().getBlockMembers();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(listener);
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "차단 계정 관리"),
      body: Consumer<SettingProvider>(
        //Todo: refresh
        builder: (context, value, child) {
          return CustomRefreshIndicator(
            onRefresh: value.refreshBlockMembers,
            child: DefaultPadding(
              bottom: 0,
              child: value.loadingBlockMembers
                  ? const Center(
                      child: CustomLoading(),
                    )
                  : (value.blockMembers.isEmpty
                      ? const SizedBox.shrink()
                      : ListView.builder(
                          itemCount: value.blockMembers.length,
                          itemBuilder: (context, index) {
                            final BlockMember member =
                                value.blockMembers[index];
                            return MemberList(
                              memberId: member.memberId,
                              profile: member.profileImage,
                              nickname: member.nickname,
                              button: RightButtonInList(
                                  backgroundColor: AppColor.brown,
                                  foregroundColor: Colors.white,
                                  label: "해제",
                                  onPressed: () => value.unblockMember(
                                        memberId: member.memberId,
                                      )),
                              content: member.introduction,
                            );
                          },
                        )),
            ),
          );
        },
      ),
      // 테스트 버튼
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<SettingProvider>().blockMember(memberId: 2);
      //   },
      // ),
    );
  }
}

void tmp() {}
