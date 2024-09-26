import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/mypage/screen/mypage_screen.dart';
import 'package:provider/provider.dart';

class MemberList extends StatelessWidget {
  final int? memberId;
  final String profile;
  final String nickname;
  final String? id;
  final String? content;
  final Widget? button;

  const MemberList({
    super.key,
    this.memberId,
    required this.profile,
    required this.nickname,
    this.id,
    this.button,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14.0),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MypageScreen(
                      isLoginUser:
                          memberId == context.read<LoginProvider>().memberId,
                      memberId: memberId,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProfileImageNetworking(profile),
                ),
              ),
              const SizedBox(width: 4.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        nickname,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 3),
                  if (content != null)
                    Text(
                      content!,
                      style: const TextStyle(
                        fontSize: 12.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (button != null) button!,
        ],
      ),
    );
  }
}
