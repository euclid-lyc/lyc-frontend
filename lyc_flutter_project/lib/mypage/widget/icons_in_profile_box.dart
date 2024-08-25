import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/screen/my_page_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/notify_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/point_screen.dart';
import 'package:lyc_flutter_project/mypage/widget/block_dialog.dart';

class IconsInProfileBox extends StatelessWidget {
  final int memberId;
  final bool isMypage;
  final BlockProvider blockProvider;
  final FollowProvider followProvider;
  final NotifyProvider notifyProvider;

  const IconsInProfileBox({
    super.key,
    required this.isMypage,
    required this.memberId,
    required this.blockProvider,
    required this.followProvider,
    required this.notifyProvider,
  });

  @override
  Widget build(BuildContext context) {
    if (isMyPage) {
      return Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icon_dm.svg"),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PointScreen();
                  },
                ),
              );
            },
            icon: SvgPicture.asset("assets/icon_p.svg", width: 20,),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                color: followProvider.isFollowing
                    ? Colors.white
                    : const Color(0xFFFEFFC3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15.2,
                vertical: 5,
              ),
              child: Text(
                followProvider.isFollowing ? '팔로우' : '팔로잉',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  height: 1.6,
                  color: Colors.black,
                ),
              ),
            ),
            onPressed: () {
              followProvider.toggleFollow();
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                //padding: EdgeInsets.all(0.0),
                icon: SvgPicture.asset(
                  blockProvider.isBlocked
                      ? 'assets/icon_blocked.svg'
                      : 'assets/icon_block.svg', // SVG 파일 로드
                  // width: 18, // 크기 조정
                  // height: 18, // 크기 조정
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlockDialog(
                        blockProvider: blockProvider,
                      );
                    },
                  );
                },
              ),
              IconButton(
                //padding: EdgeInsets.all(0.0),
                icon: SvgPicture.asset(
                  'assets/icon_notify.svg',
                  // width: 18, // 크기 조정
                  // height: 18, // 크기 조정
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotifyScreen(
                        notifyProvider: notifyProvider,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );
    }
  }
}
