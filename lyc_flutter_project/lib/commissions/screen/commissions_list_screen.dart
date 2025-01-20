import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/model/commission_response.dart';
import 'package:lyc_flutter_project/commissions/screen/basic_info_screen.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';
import '../provider/commissions_provider.dart';

class CommissionsListScreen extends StatefulWidget {
  const CommissionsListScreen({super.key});

  @override
  State<CommissionsListScreen> createState() => _CommissionsListScreenState();
}

class _CommissionsListScreenState extends State<CommissionsListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommissionsProvider>().getCommissionList();
    });
  }

  void _listener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (mounted) context.read<CommissionsProvider>().getCommissionList();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "의뢰함",
      ),
      body: Consumer<CommissionsProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CustomLoading());
          }
          return DefaultPadding(
              child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final CommissionResult commissionResult =
                          value.commissionList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: () => pushWithoutNavBar(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BasicInfoScreen(
                                directorId: 0,
                              ),
                            ),
                          ),
                          child: MemberList(
                            navigateMypage: false,
                            profile: commissionResult.profileImage,
                            nickname: commissionResult.nickname,
                            id: commissionResult.loginId,
                            button: const CustomTextButton(
                              label: "의뢰서 확인하기",textColor: Colors.black,backgroundColor: AppColor.grey,
                        //     onPressed:(){
                        //      의뢰서 확인하기 페이지
                        // },
                            )
                          ),
                        ),
                      );
                    },
                    childCount: value.commissionList.length,
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
