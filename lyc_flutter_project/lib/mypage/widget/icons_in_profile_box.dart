import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/mypage/screen/point_screen.dart';

class IconsInProfileBox extends StatelessWidget {
  final int memberId;
  final bool isMypage;

  const IconsInProfileBox({
    super.key,
    required this.isMypage,
    required this.memberId,
  });

  @override
  Widget build(BuildContext context) {
    if (isMypage) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
                    return const PointScreen();
                  },
                ),
              );
            },
            icon: SvgPicture.asset(
              "assets/icon_p.svg",
              width: 18,
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
    // else {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       IconButton(
    //         icon: Container(
    //           decoration: BoxDecoration(
    //             color: followProvider!.isFollowing(memberId)
    //                 ? Colors.white
    //                 : const Color(0xFFFEFFC3),
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 15.2,
    //             vertical: 5,
    //           ),
    //           child: Text(
    //             followProvider!.isFollowing(memberId) ? '팔로우' : '팔로잉',
    //             style: const TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 14.0,
    //               height: 1.6,
    //               color: Colors.black,
    //             ),
    //           ),
    //         ),
    //         onPressed: () {
    //           followProvider!.toggleFollow(memberId);
    //         },
    //       ),
    //       const SizedBox(height: 10),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           IconButton(
    //             icon: SvgPicture.asset(
    //               blockProvider!.isBlocked(memberId)
    //                   ? 'assets/icon_blocked.svg'
    //                   : 'assets/icon_block.svg',
    //             ),
    //             onPressed: () {
    //               // showDialog(
    //               //   context: context,
    //               //   builder: (BuildContext context) {
    //               //     return BlockDialog(
    //               //       memberId: memberId,
    //               //       blockProvider: blockProvider!,
    //               //     );
    //               //   },
    //               // );
    //             },
    //           ),
    //           IconButton(
    //             icon: SvgPicture.asset(
    //               'assets/icon_notify.svg',
    //             ),
    //             onPressed: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => NotifyScreen(
    //                     memberId: memberId,
    //                     notifyProvider: notifyProvider!,
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ],
    //   );
    // }
  }
}
