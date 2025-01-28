import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_refresh_indicator.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/layout/mypage_layout.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/mypage/widget/director_closet_list.dart';
import 'package:lyc_flutter_project/mypage/widget/director_coordi_grid_view.dart';
import 'package:lyc_flutter_project/mypage/widget/icons_in_profile_box.dart';
import 'package:lyc_flutter_project/mypage/widget/my_closet_list.dart';
import 'package:lyc_flutter_project/mypage/widget/my_coordi_grid_view.dart';
import 'package:lyc_flutter_project/mypage/widget/profile_box.dart';
import 'package:lyc_flutter_project/mypage/widget/bottom_buttons.dart';
import 'package:provider/provider.dart';

import '../../auth/join/Provider/login_provider.dart';

class MypageScreen extends StatefulWidget {
  final Map<int?, bool> extra;

  const MypageScreen({
    super.key,
    required this.extra,
  });

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  late MypageProvider provider;
  late int memberId;
  late bool isLoginUser;

  @override
  void initState() {
    super.initState();
    if (widget.extra.keys.first == null && widget.extra.values.first) {
      memberId = Provider.of<LoginProvider>(context, listen: false).memberId!;
      isLoginUser = true;
      debugPrint("마이페이지: initState: login user");
    } else {
      memberId = widget.extra.keys.first!;
      isLoginUser = false;
      debugPrint("마이페이지: initState: login user 아님 ");
    }
    provider = Provider.of<MypageProviderFactory>(context, listen: false).getProvider(
      memberId,
      widget.extra.values.first,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (!widget.extra.values.first) {
      Provider.of<MypageProviderFactory>(context, listen: false).disposeProvider(
        memberId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<MypageProvider>(
        builder: (context, value, child) {
          return CustomRefreshIndicator(
            onRefresh: value.refresh,
            child: MypageLayout(
              top: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                color: AppColor.beige,
                child: Column(
                  children: [
                    // 프로필 영역
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: value.hasProfile ? ProfileBox.fromModel(profile: value.profile) : const CustomLoading(),
                          ),
                          IconsInProfileBox(
                            memberId: memberId,
                            isMypage: true,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BottomButtons(
                        memberId: memberId,
                        isLoginUser: widget.extra.values.first,
                      ),
                    ),
                  ],
                ),
              ),
              // 게시글 영역
              body: Column(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SwitchCategoryButton(
                          text: "나의 코디",
                          isSelected: value.category == 0,
                          onPressed: () => value.categorySelected(0),
                        ),
                        SwitchCategoryButton(
                          text: "저장한 코디",
                          isSelected: value.category == 1,
                          onPressed: () => value.categorySelected(1),
                        ),
                        SwitchCategoryButton(
                          text: "나의 옷장",
                          isSelected: value.category == 2,
                          onPressed: () => value.categorySelected(2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: buildPostings(value),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPostings(MypageProvider value) {
    if (value.loading) {
      return const Center(
        child: CustomLoading(),
      );
    } else {
      switch (value.category) {
        case 0:
          return isLoginUser
              ? MyCoordiGridView(
                  postings: value.myCoordi,
                  category: 0,
                  provider: value,
                )
              : DirectorCoordiGridView(
                  postings: value.myCoordi,
                  category: 0,
                  provider: value,
                );
        case 1:
          return isLoginUser
              ? MyCoordiGridView(
                  postings: value.savedCoordi,
                  category: 1,
                  provider: value,
                )
              : DirectorCoordiGridView(
                  postings: value.savedCoordi,
                  category: 1,
                  provider: value,
                );
        case 2:
          return isLoginUser
              ? MyClosetList(
                  postings: value.myCloset,
                  provider: value,
                  memberId: memberId,
                )
              : DirectorClosetList(
                  postings: value.myCloset,
                  provider: value,
                  memberId: memberId,
                );
        default:
          return const CustomLoading();
      }
    }
  }
}
