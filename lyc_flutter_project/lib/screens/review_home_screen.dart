import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/temp_posting_data.dart';
import 'package:lyc_flutter_project/widget/grid_widget_with_button.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

class ReviewHomeScreen extends StatelessWidget {
  const ReviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(backButton: true, title: '나의 리뷰', deleteButton: false),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 5),
        child: GridWidgetWithButton(postings: TempPostingData().postings, category: 3),
      ),
    );
  }
}
