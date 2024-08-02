import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/screens/my_page_screen.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/round_image.dart';
import 'package:lyc_flutter_project/widget/switch_category_button.dart';

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
      appBar: NormalAppbar(backButton: true, title: "", deleteButton: false),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
            SizedBox(height: 10),
            // list view
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  // 팔로우 목록이 없어 임시 member 한 명만 넣어놓겠습니다,,
                  final member = TempMemberData().members[1];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyPageScreen(memberId: member.id),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            RoundImage(image: member.profile_image),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text(
                                    member.nickname,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('@${member.login_id}'),
                                ]),
                                SizedBox(height: 3),
                                Text(member.introduction),
                              ],
                            ),
                          ]),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color(0xffFFDD85),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '삭제',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
