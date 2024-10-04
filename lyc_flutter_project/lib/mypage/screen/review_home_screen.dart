import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';

class ReviewHomeScreen extends StatelessWidget {
  const ReviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(title: '나의 리뷰'),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 5),
        // child: GridWidgetWithButton(postings: TempPostingData().postings, category: 3),
      ),
    );
  }
}
