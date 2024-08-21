import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/right_button_in_list.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

class FollowListScreen extends StatefulWidget {
  final bool follower;

  const FollowListScreen({super.key, required this.follower});

  @override
  State<FollowListScreen> createState() => _FollowListScreenState();
}

class _FollowListScreenState extends State<FollowListScreen> {
  late bool isFollower;

  @override
  void initState() {
    super.initState();
    isFollower = widget.follower;
  }

  void followerSelected(bool select) {
    setState(() {
      isFollower = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            // switch button
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  SwitchCategoryButton(
                    "팔로워",
                    isFollower,
                    () => followerSelected(true),
                    AppColor.brown,
                  ),
                  SwitchCategoryButton(
                    "팔로잉",
                    !isFollower,
                    () => followerSelected(false),
                    AppColor.brown,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // list view
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MemberList(
                    profile: "assets/ex_profile.png",
                    nickname: "카리나",
                    id: "katarinabluu",
                    button: RightButtonInList(
                      backgroundColor: const Color(0xffFFDD85),
                      foregroundColor: Colors.black,
                      label: "삭제",
                      onPressed: () {},
                      fontWeight: FontWeight.w400,
                      padding: 3.0,
                    ),
                    content: "상태메시지",
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
