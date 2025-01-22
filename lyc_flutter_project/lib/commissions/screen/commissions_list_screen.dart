import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/model/commission_response.dart';
import 'package:lyc_flutter_project/commissions/screen/tap_view_screen.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../auth/join/Provider/login_provider.dart';
import '../model/commission_response_model.dart';
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
    final int memberId = Provider.of<LoginProvider>(
        context,
        listen: false)
        .memberId;
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
                      final CommissionResponse commissionResponse =
                          value.commissionList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: MemberList(
                            navigateMypage: false,
                            profile: commissionResponse.profileImage,
                            nickname: commissionResponse.nickname,
                            id: commissionResponse.loginId,
                            button: CustomTextButton(
                              label: "의뢰서 확인하기",
                              textColor: Colors.black,
                              backgroundColor: AppColor.grey,
                              onPressed: () async {
                                final CommissionResponseModel? model =
                                    await value.getCommission(
                                        commissionResponse.commissionId);
                                if (context.mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TapViewScreen(
                                          directorId:
                                              memberId,
                                        memberId: memberId,
                                        model:model,
                                        title: "의뢰서 확인하기",
                                        commissionId: model?.commissionId,
                                      ),

                                    ),
                                  );
                                }
                              },
                            )),
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
