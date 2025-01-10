import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:lyc_flutter_project/dm/widget/custom_calendar.dart';
import 'package:lyc_flutter_project/dm/widget/schedule_bottom_sheet.dart';
import 'package:lyc_flutter_project/dm/widget/select_month.dart';
import 'package:provider/provider.dart';

class ChatScheduleScreen extends StatefulWidget {
  final ChatProvider provider;

  const ChatScheduleScreen({super.key, required this.provider});

  @override
  State<ChatScheduleScreen> createState() => _ChatScheduleScreenState();
}

class _ChatScheduleScreenState extends State<ChatScheduleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.provider.initCalendar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.provider,
      child: Scaffold(
        appBar: const NormalAppbar(title: '일정'),
        backgroundColor: AppColor.lightGrey,
        body: Consumer<ChatProvider>(builder: (context, value, child) {
          return Stack(
            children: [
              DefaultPadding(
                child: Column(
                  children: <Widget>[
                    SelectMonth(
                      calendarDate: value.calendarDate,
                      onLeftArrowPressed: () => value.showPrevMonth(),
                      onRightArrowPressed: () async => await value.showNextMonth(),
                    ),
                    CustomCalendar(
                      currentDateTime: DateTime.now(),
                      schedules: value.schedules,
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
                  child: ScheduleBottomSheet(
                    scrollController: scrollController,
                    schedules: value.schedules,
                  ),
                ),
              ),
              if (value.loadingCalendar) const Center(child: CustomLoading()),
            ],
          );
        }),
      ),
    );
  }
}
