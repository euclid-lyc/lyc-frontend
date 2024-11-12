import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/home/widget/home_deco.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      color: const Color(0xffF4F5F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '유클리드',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
            style:
            TextStyle(color: AppColor.deepGrey.withOpacity(0.8)),
          )
        ],
      ),
    );
  }
}
