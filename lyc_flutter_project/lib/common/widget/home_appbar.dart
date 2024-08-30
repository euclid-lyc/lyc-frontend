import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.beige,
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      flexibleSpace: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 5,
                  child: Text(
                    'LEAD YOUR CLOSET',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(1, 2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      const Expanded(flex: 6, child: SizedBox()),
                      Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset('assets/icon_collage.svg',
                                color: Colors.white),
                          )),
                      const Expanded(child: SizedBox()),
                      Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset('assets/icon_dm.svg',
                                color: Colors.white),
                          )),
                      const Expanded(child: SizedBox()),
                      Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              child: RoundImage(
                                image: Image.asset('assets/ex_profile.png'),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
