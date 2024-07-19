import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/screens/my_page_screen.dart';
import 'package:lyc_flutter_project/screens/temp_screen.dart';

/// 아 걍 이상함 bottom navigation bar는 공부를 더 해보겠음...

const List<TabItem> items = [
  TabItem(icon: Icons.home_outlined, title: '홈'),
  TabItem(icon: Icons.format_list_bulleted_outlined, title: '최신피드'),
  TabItem(icon: Icons.star_border_rounded, title: '디렉터찾기'),
  TabItem(icon: Icons.settings, title: '설정'),
];

List<Widget> pages = [
  MyPageScreen(memberId: 1,),
  TempScreen(),
  MyPageScreen(memberId: 1,),
  MyPageScreen(memberId: 1,),
];

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int visit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[visit],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 7
              )
            ]
          ),
          child: BottomBarInspiredInside(
            color: AppColor.brown,
            colorSelected: AppColor.brown,
            backgroundColor: Colors.white,
            radius: 20,
            items: items,
            indexSelected: visit,
            onTap: (int index) => setState(() {
              visit = index;
            }),
            chipStyle: const ChipStyle(
              convexBridge: true,
              background: Colors.white,
            ),
            itemStyle: ItemStyle.circle,
            //animated: true,
          ),
        ));
  }
}