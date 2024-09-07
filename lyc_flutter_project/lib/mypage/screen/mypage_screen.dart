import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/mypage/layout/mypage_layout.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/mypage/widget/icons_in_profile_box.dart';
import 'package:lyc_flutter_project/mypage/widget/profile_box.dart';
import 'package:lyc_flutter_project/widget/bottom_buttons.dart';
import 'package:provider/provider.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MypageProvider>(
      builder: (context, value, child) {
        return RefreshIndicator(
          onRefresh: value.refresh,
          child: MypageLayout(
            top: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              color: AppColor.beige,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 13,
                          child: value.hasProfile
                              ? ProfileBox.fromModel(profile: value.profile)
                              : const CustomLoading(),
                        ),
                        const Expanded(
                          flex: 5,
                          child: IconsInProfileBox(
                            memberId: cur_member,
                            isMypage: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Expanded(
                    child: BottomButtons(
                      memberId: cur_member,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
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
                  child: value.listLength == 0
                      ? const Center(
                          child: CustomLoading(),
                        )
                      : value.renderList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
