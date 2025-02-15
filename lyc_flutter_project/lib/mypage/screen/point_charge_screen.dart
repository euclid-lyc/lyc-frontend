import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/widget/point_input_field.dart';
import 'package:lyc_flutter_project/mypage/widget/point_pay.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/mypage/widget/point_custom_container.dart';
import 'package:lyc_flutter_project/mypage/widget/point_sub_title.dart';

class PointChargeScreen extends StatefulWidget {
  const PointChargeScreen({super.key});

  @override
  State<PointChargeScreen> createState() => _PointChargeScreenState();
}

class _PointChargeScreenState extends State<PointChargeScreen> {
  int point = 0;

  final String webApplicationId = "66b0e5d186fd08d2213fbf98";
  final String iosApplicationId = "66b0e5d186fd08d2213fbf9a";
  final String androidApplicationId = "66b0e5d186fd08d2213fbf99";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            children: [
              PointCustomContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PointSubTitle(label: "포인트를 충전하시겠습니까?"),
                    const SizedBox(height: 20.0),
                    PointInputField(
                      onChanged: (value) {
                        setState(() {
                          point = int.tryParse(value.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26.0),
              PointCustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PointSubTitle(label: "충전 수단"),
                    PointPay(label: "카카오페이", icon: "assets/icon_kakao.png", onTap: () {}),
                    PointPay(
                      label: "네이버페이",
                      icon: "assets/icon_naver.png",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
