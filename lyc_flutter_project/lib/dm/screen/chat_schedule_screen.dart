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

class ChatScheduleScreen extends StatelessWidget {
  final ChatProvider provider;

  const ChatScheduleScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    double sheetPosition = 0.4;

    void handleDrag(double delta) {
      // 드래그 이동 비율 계산 및 위치 제한
      double newPosition = sheetPosition - delta / MediaQuery.of(context).size.height;
      sheetPosition = newPosition.clamp(0.3, 1.0);
      provider.updateDraggablePosition(sheetPosition);
    }

    return ChangeNotifierProvider.value(
      value: provider,
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
                      onScheduleTap: (selectedDate) {
                        value.scrollToSchedule(selectedDate);
                        debugPrint('선택');
                      },
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: value,
                builder: (context, _) => DraggableScrollableSheet(
                    initialChildSize: value.draggablePosition,
                    minChildSize: 0.3,
                    maxChildSize: 1.0,
                    builder: (context, draggableScrollController) {
                      // DraggableScrollableSheet 컨트롤러를 상태에 저장
                      value.setDraggableScrollController(draggableScrollController);

                      return ScheduleBottomSheet(
                        scrollController: value.listScrollController, // 리스트의 스크롤 컨트롤러
                        schedules: value.schedules,
                        onHandleDrag: (delta) {
                          value.handleDraggableDrag(delta);
                        },
                      );
                    },
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
