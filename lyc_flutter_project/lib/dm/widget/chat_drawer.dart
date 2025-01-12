import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lyc_flutter_project/common/const/assets.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:lyc_flutter_project/dm/widget/custom_calendar.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:provider/provider.dart';

class ChatDrawer extends StatelessWidget {
  final VoidCallback closeDrawer;
  final ChatProvider provider;

  const ChatDrawer({
    super.key,
    required this.closeDrawer,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, value, child) => Drawer(
        backgroundColor: Colors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40.0),
                  ChatDrawerContent(
                    title: '사진 및 동영상',
                    content: Container(
                      height: 80.0,
                      width: 80.0,
                      color: Colors.yellow,
                    ),
                  ),
                  ChatDrawerContent(
                    title: '일정',
                    content: CustomCalendar(
                      currentDateTime: value.calendarDate,
                      schedules: value.currentMonthSchedules,
                      onScheduleTap: (selectedDate) {},
                      backgroundColor: Colors.transparent,
                      miniMode: true,
                    ),
                    onPlusIconPressed: () => context.pushNamed(
                      Routes.schedule.name,
                      extra: provider,
                    ),
                  ),
                  ChatDrawerContent(
                    showPlusIcon: false,
                    title: '대화상대',
                    content: Column(
                      children: [
                        const SizedBox(height: 16.0),
                        ListTile(
                          title: const Text('나'),
                          // TODO: 내 프로필로 바꾸기
                          leading: ProfileImageNetworking(value.profileImage ?? ''),
                          titleTextStyle: Typos.regular14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        ListTile(
                          title: Text(value.nickname),
                          leading: ProfileImageNetworking(value.profileImage ?? ''),
                          titleTextStyle: Typos.regular14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16.0,
              child: IconButton(
                padding: const EdgeInsets.only(left: 20.0),
                onPressed: closeDrawer,
                icon: SvgPicture.asset(Assets.out),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatDrawerContent extends StatelessWidget {
  final String title;
  final Widget content;
  final bool showPlusIcon;
  final VoidCallback? onPlusIconPressed;

  const ChatDrawerContent({
    super.key,
    required this.title,
    required this.content,
    this.onPlusIconPressed,
    this.showPlusIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
      padding: EdgeInsets.only(top: showPlusIcon ? 0.0 : 16.0, bottom: 12.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
        ),
        color: Color(0xfff4f4f4),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  title,
                  style: Typos.semibold16,
                ),
              ),
              if (showPlusIcon)
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icon_plus.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: onPlusIconPressed,
                ),
            ],
          ),
          content,
        ],
      ),
    );
  }
}
