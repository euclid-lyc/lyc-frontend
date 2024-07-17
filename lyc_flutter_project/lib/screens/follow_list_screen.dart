import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
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

  void followerSelected(bool b) {
    setState(() {
      isFollower = b;
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
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  SwitchCategoryButton(
                      "팔로워", isFollower, () => followerSelected(true)),
                  SwitchCategoryButton(
                      "팔로잉", !isFollower, () => followerSelected(false)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
