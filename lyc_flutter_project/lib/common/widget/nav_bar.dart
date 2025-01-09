import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lyc_flutter_project/auth/join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  final String currentRouteName;

  const NavBar({
    super.key,
    required this.currentRouteName,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: 100.0,
      child: Stack(
        children: [
          // 사진 그림자
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 8.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 배경 컨테이너
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 76.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
            ),
          ),
          // 아이콘
          Positioned(
            bottom: 0.0,
            child: SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavBarItem(
                    isFst: true,
                    iconPath: 'assets/icon_home.svg',
                    onPressed: () => context.goNamed(Routes.home.name),
                    activated: currentRouteName == Routes.home.name,
                  ),
                  NavBarItem(
                    iconPath: 'assets/icon_feed.svg',
                    onPressed: () => context.goNamed(Routes.feed.name),
                    activated: currentRouteName == Routes.feed.name,
                  ),
                  const SizedBox(width: 60.0),
                  NavBarItem(
                    iconPath: 'assets/icon_find_director.svg',
                    onPressed: () => context.goNamed(Routes.director.name),
                    activated: currentRouteName == Routes.director.name,
                  ),
                  NavBarItem(
                    isLst: true,
                    iconPath: 'assets/icon_setting.svg',
                    onPressed: () => context.goNamed(Routes.setting.name),
                    activated: currentRouteName == Routes.setting.name,
                  ),
                ],
              ),
            ),
          ),
          // 사진
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => context.goNamed(
                  Routes.mypage.name,
                  extra: {null: true},
                ),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 8.0,
                    ),
                  ),
                  child: Consumer<LoginProvider>(
                    builder: (context, provider, child) => ClipOval(
                      child: provider.profile != null
                          ? Image.network(
                              provider.profile!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                'assets/image_not_found.png',
                              ),
                            )
                          : Container(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final VoidCallback onPressed;
  final bool activated;
  final String iconPath;

  final bool isFst;
  final bool isLst;

  const NavBarItem({
    super.key,
    required this.onPressed,
    required this.activated,
    required this.iconPath,
    this.isFst = false,
    this.isLst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.0,
        bottom: 16.0,
        left: isFst ? 36.0 : 0.0,
        right: isLst ? 36.0 : 0.0,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            activated ? AppColor.brown : const Color(0xffBBBBBB),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
