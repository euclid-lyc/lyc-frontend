import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:lyc_flutter_project/director/screen/director_search_screen.dart';
import 'package:lyc_flutter_project/feed/screen/feed_screen.dart';
import 'package:lyc_flutter_project/home/screen/home_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/mypage_screen.dart';
import 'package:lyc_flutter_project/setting/screen/setting_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_home.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_home.svg',
              color: const Color(0xffBBBBBB), // Active color
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const FeedScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_feed.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_feed.svg',
              color: const Color(0xffBBBBBB), // Active color
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const MypageScreen(),
          item: ItemConfig(
            icon: RoundImage(
              image: Image.asset(
                'assets/ex_profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const DirectorSearchScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_find_director.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_find_director.svg',
              color: const Color(0xffBBBBBB), // Active color
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const SettingScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_setting.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_setting.svg',
              color: const Color(0xffBBBBBB), // Active color
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xffBBBBBB),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, -2),
            )
          ],
        ),
      ),
    );
  }
}
