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
    return ChangeNotifierProxyProvider<MypageRepositoryProvider, FollowProvider>(
      create: (context) => FollowProvider(
        repositoryProvider: context.read<MypageRepositoryProvider>(),
      ),
      update: (context, myPageRepo, previous) =>
      previous ?? FollowProvider(repositoryProvider: myPageRepo),
      child: _FollowListContent(follower: follower),
    );
  }
}

class _FollowListContent extends StatefulWidget {
  final bool follower;

  const _FollowListContent({required this.follower});

  @override
  _FollowListContentState createState() => _FollowListContentState();
}

class _FollowListContentState extends State<_FollowListContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<FollowProvider>();
      provider.setCategory(isFollower: widget.follower);
      provider.getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FollowProvider>();
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
                    isSelected: provider.isFollower,
                    onPressed: () => provider.setCategory(isFollower: true),
                    color: AppColor.brown,
                    size: 16.0,
                  ),
                  SwitchCategoryButton(
                    text: "팔로잉",
                    isSelected: !provider.isFollower,
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
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text("비어있습니다."),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
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
                    }
                  } else {
                    return const Center(child: CustomLoading());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
