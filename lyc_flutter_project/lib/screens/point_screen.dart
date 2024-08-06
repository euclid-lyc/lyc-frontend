import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/screens/point_charge_screen.dart';
import 'package:lyc_flutter_project/screens/point_withdrawal_screen.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/point_custom_button.dart';
import 'package:lyc_flutter_project/widget/point_custom_container.dart';
import 'package:lyc_flutter_project/widget/point_log.dart';
import 'package:lyc_flutter_project/widget/point_sub_title.dart';
import 'package:lyc_flutter_project/widget/point_title.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PointScreen extends StatelessWidget {
  const PointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
        child: Column(
          children: [
            Expanded(
              child: PointCustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PointSubTitle(label: "보유 포인트"),
                    const SizedBox(height: 20.0),
                    const Expanded(
                      child: PointTitle(point: 145200),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: PointCustomButton(
                              label: "이체하기",
                              onPressed: () {
                                pushWithoutNavBar(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const PointWithdrawalScreen();
                                    },
                                  ),
                                );
                              },
                              color: AppColor.beige,
                            ),
                          ),
                          const SizedBox(width: 26.0),
                          Expanded(
                            child: PointCustomButton(
                              label: "충전하기",
                              onPressed: () {
                                pushWithoutNavBar(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PointChargeScreen();
                                    },
                                  ),
                                );
                              },
                              color: AppColor.brown,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              flex: 2,
              child: PointCustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PointSubTitle(label: "30일 이내 사용내역"),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const PointLog();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16.0);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
