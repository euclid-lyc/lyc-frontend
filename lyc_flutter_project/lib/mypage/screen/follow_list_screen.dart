import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/right_button_in_list.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/model/follow_model.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:provider/provider.dart';

class FollowListScreen extends StatelessWidget {
  final bool follower;

  const FollowListScreen({super.key, required this.follower});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<MypageRepositoryProvider,
        FollowProvider>(
      create: (context) => FollowProvider(
        repositoryProvider: context.read<MypageRepositoryProvider>(),
        initialIsFollower: follower,
      ),
      update: (context, myPageRepo, previous) =>
          previous ??
          FollowProvider(
            repositoryProvider: myPageRepo,
            initialIsFollower: follower,
          ),
      child: const _FollowListContent(),
    );
  }
}

class _FollowListContent extends StatefulWidget {
  const _FollowListContent();

  @override
  _FollowListContentState createState() => _FollowListContentState();
}

class _FollowListContentState extends State<_FollowListContent> {
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
            Consumer<FollowProvider>(
              builder: (context, value, child) {
                return Container(
                  height: MediaQuery.of(context).size.height / 20,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      SwitchCategoryButton(
                        text: "팔로워",
                        isSelected: value.isFollower,
                        onPressed: () => value.setCategory(
                          isFollower: true,
                        ),
                        color: AppColor.brown,
                        size: 16.0,
                      ),
                      SwitchCategoryButton(
                        text: "팔로잉",
                        isSelected: !value.isFollower,
                        onPressed: () => value.setCategory(
                          isFollower: false,
                        ),
                        color: AppColor.brown,
                        size: 16.0,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            // list view
            Expanded(child: Consumer<FollowProvider>(
              builder: (context, value, child) {
                var list = value.list;
                if (value.getLoading()) {
                  return const Center(child: CustomLoading());
                } else {
                  if (list.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text("비어있습니다."),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final FollowListModel user = list[index];
                        return MemberList(
                          profile: user.profileImage,
                          nickname: user.nickname,
                          button: value.isFollower
                              ? const SizedBox.shrink()
                              : RightButtonInList(
                                  backgroundColor: const Color(0xffFFDD85),
                                  foregroundColor: Colors.black,
                                  onPressed: () {
                                    value.unfollowUser(memberId: user.memberId);
                                  },
                                  fontWeight: FontWeight.w400,
                                  label: "삭제",
                                ),
                          content: user.introduction,
                        );
                      },
                    );
                  }
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
