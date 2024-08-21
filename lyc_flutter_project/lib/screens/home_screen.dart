import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void _onTap() {}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const HomeAppbar(),
      body: ListView(
        children: [
          const MarginBox(),
          // 배너
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 170,
            color: Colors.white,
            child: const Text('배너'),
          ),
          const MarginBox(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // 둘러보기
                const TitleRow(label: '둘러보기', onTap: _onTap),
                const Line(),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0; i < 10; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: buildWhiteRoundBox(),
                          height: 190,
                          width: 135,
                        ),
                    ],
                  ),
                ),

                // 오늘의 디렉터
                const MarginBox(),
                const TitleRow(label: '오늘의 디렉터', onTap: _onTap),
                const Line(),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0; i < 10; i++)
                        Container(
                          decoration: buildWhiteRoundBox(),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          height: 90,
                          width: 90,
                          alignment: Alignment.center,
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: RoundImage(
                                        image: 'assets/ex_profile2.png')),
                                SizedBox(height: 3),
                                Text(
                                  'Winter',
                                  style: TextStyle(color: AppColor.deepGrey),
                                ),
                              ]),
                        ),
                    ],
                  ),
                ),

                // 금주의 사연
                const MarginBox(),
                const TitleRow(label: '금주의 사연', onTap: _onTap),
                const Line(),
                Column(
                  children: [
                    for (var i = 0; i < 10; i++)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: buildWhiteRoundBox(),
                        width: double.infinity,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${i + 1}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const RoundImage(image: 'assets/ex_profile.png'),
                            const SizedBox(width: 10),
                            const Text('전남친이 청접장을 보내왔습니다.'),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),

          // 유클리드
          const MarginBox(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            color: const Color(0xffF4F5F6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '유클리드',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const MarginBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const DescriptTitle(label: 'Contact us'),
                          const MiniBox(),
                          const DescriptText(label: 'id@gmail.com'),
                          const MiniBox(),
                          const DescriptText(label: '+82 10-XXXX-XXXX'),
                          const MiniBox(),
                          const DescriptText(label: 'Address'),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon_facebook.svg'),
                              const SizedBox(width: 10),
                              SvgPicture.asset('assets/icon_linkedin.svg'),
                              const SizedBox(width: 10),
                              SvgPicture.asset('assets/icon_twitter.svg'),
                              const SizedBox(width: 10),
                              SvgPicture.asset('assets/icon_instagram.svg'),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescriptTitle(label: 'Products'),
                          MiniBox(),
                          DescriptText(label: 'Author volutpat.'),
                          MiniBox(),
                          DescriptText(label: 'Fermentum turpis.'),
                          MiniBox(),
                          DescriptText(label: 'Mi consequat.'),
                          MiniBox(),
                          DescriptText(label: 'Amet venenatis.'),
                          MiniBox(),
                          DescriptText(label: 'Convallis porttitor.'),
                        ],
                      ),
                    ),
                  ],
                ),
                const MarginBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescriptTitle(label: 'About'),
                          MiniBox(),
                          DescriptText(label: 'Egestas vitae.'),
                          MiniBox(),
                          DescriptText(label: 'Viverra lorem ac.'),
                          MiniBox(),
                          DescriptText(label: 'Eget ac tellus.'),
                          MiniBox(),
                          DescriptText(label: 'Erat nulla.'),
                          MiniBox(),
                          DescriptText(label: 'Vulputate proin.'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DescriptTitle(label: 'Get the app'),
                          const MiniBox(),
                          SvgPicture.asset('assets/icon_appstore.svg'),
                          const MiniBox(),
                          SvgPicture.asset('assets/icon_playstore.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
                const MarginBox(),
                Text(
                  'Copyright © 2024. All rights reserved.',
                  style: TextStyle(color: AppColor.deepGrey.withOpacity(0.8)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildWhiteRoundBox() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    );
  }
}

class MiniBox extends StatelessWidget {
  const MiniBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15);
  }
}

class DescriptTitle extends StatelessWidget {
  final String label;

  const DescriptTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }
}

class DescriptText extends StatelessWidget {
  final String label;

  const DescriptText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff353945),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xffE4E4E4),
      thickness: 2,
    );
  }
}

class TitleRow extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const TitleRow({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icon_plus.svg',
            color: const Color(0xffA6A6A6),
          ),
        ),
      ],
    );
  }
}

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
                                child:
                                    RoundImage(image: 'assets/ex_profile.png')),
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

class MarginBox extends StatelessWidget {
  const MarginBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 40);
  }
}
