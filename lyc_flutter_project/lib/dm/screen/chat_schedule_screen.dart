import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model.dart';
import 'package:lyc_flutter_project/dm/widget/custom_calendar.dart';
import 'package:lyc_flutter_project/dm/widget/schedule_bottom_sheet.dart';
import 'package:lyc_flutter_project/dm/widget/select_month.dart';

class ChatScheduleScreen extends StatelessWidget {
  final int chatID;

  const ChatScheduleScreen({super.key, required this.chatID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppbar(title: '일정'),
      backgroundColor: AppColor.lightGrey,
      body: Stack(
        children: [
          DefaultPadding(
            child: Column(
              children: <Widget>[
                const SelectMonth(),
                CustomCalendar(
                  currentDateTime: DateTime.now(),
                  schedules: [ScheduleModel(date: DateTime.parse('2025-01-10'), memo: "안녕")],
                  onScheduleTap: () {},
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 1.0,
            builder: (context, scrollController) => SingleChildScrollView(
              controller: scrollController,
              child: ScheduleBottomSheet(scrollController: scrollController),
            ),
          ),
        ],
      ),
    );
  }
}
