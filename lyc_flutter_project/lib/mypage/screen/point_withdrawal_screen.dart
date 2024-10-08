import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/widget/point_custom_container.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/mypage/widget/point_sub_title.dart';
import 'package:lyc_flutter_project/mypage/widget/point_title.dart';

class PointWithdrawalScreen extends StatelessWidget {
  const PointWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Expanded(
          child: PointCustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PointSubTitle(label: "몇 포인트를 이체하시겠습니까?"),
                SizedBox(height: 16.0),
                PointTitle(
                  point: 50000,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(height: 16.0),
                PointContent(label: "출금 가능한 포인트 : 145,200"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PointContent extends StatelessWidget {
  final String label;

  const PointContent({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      ),
    );
  }
}
