import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/director/screen/director_search_screen.dart';
import 'package:lyc_flutter_project/screens/home_screen.dart';
import 'package:lyc_flutter_project/setting/screen/setting_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:lyc_flutter_project/widget/round_image.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyc_flutter_project/screens/my_page_screen.dart';
import 'package:lyc_flutter_project/screens/temp_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_home.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_home.svg',
              color: Color(0xffBBBBBB), // Active color
            ),
          ),
        ),
        PersistentTabConfig(
          screen: MyPageScreen(memberId: 2),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_feed.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_feed.svg',
              color: Color(0xffBBBBBB), // Active color
            ),
          ),
        ),
        PersistentTabConfig(
          screen: MyPageScreen(memberId: 1),
          item: ItemConfig(
            icon: RoundImage(image: 'assets/ex_profile.png'),
          ),
        ),
        PersistentTabConfig(
          screen: DirectorSearchScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_find_director.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_find_director.svg',
              color: Color(0xffBBBBBB), // Active color
            ),
          ),
        ),
        PersistentTabConfig(
          screen: SettingScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icon_setting.svg',
              color: AppColor.brown, // Default color
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/icon_setting.svg',
              color: Color(0xffBBBBBB), // Active color
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
        navBarDecoration: NavBarDecoration(
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
