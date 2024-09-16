import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/right_button_in_list.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/model/follow_model.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:provider/provider.dart';

class FollowListScreen extends StatefulWidget {
  final bool follower;

  const FollowListScreen({super.key, required this.follower});

  @override
  State<FollowListScreen> createState() => _FollowListScreenState();
}

class _FollowListScreenState extends State<FollowListScreen> {
  late FollowProvider provider;
  late bool isFollower;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<FollowProvider>(context);
    provider.setCategory(isFollower: widget.follower);
    provider.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(),
      body: DefaultPadding(
        bottom: 0.0,
        child: Column(
          children: [
            // switch button
            Container(
              height: MediaQuery.of(context).size.height / 20,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  SwitchCategoryButton(
                    text: "팔로워",
                    isSelected: isFollower,
                    onPressed: () => provider.setCategory(isFollower: true),
                    color: AppColor.brown,
                    size: 16.0,
                  ),
                  SwitchCategoryButton(
                    text: "팔로잉",
                    isSelected: !isFollower,
                    onPressed: () => provider.setCategory(isFollower: false),
                    color: AppColor.brown,
                    size: 16.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // list view
            Expanded(
              child: FutureBuilder(
                future: provider.renderList(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      if (provider.getLoading()) {
                        return CustomLoading();
                      }
                      final FollowListModel user = snapshot.data![index];
                      return MemberList(
                        profile: user.profileImage,
                        nickname: user.nickname,
                        button: RightButtonInList(
                          backgroundColor: const Color(0xffFFDD85),
                          foregroundColor: Colors.black,
                          label: "삭제",
                          onPressed: () {},
                          fontWeight: FontWeight.w400,
                        ),
                        content: user.introduction,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
