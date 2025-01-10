import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime currentDateTime;
  final List<ScheduleModel> schedules;
  final Function(DateTime) onScheduleTap;
  final Color backgroundColor;
  final bool miniMode;

  const CustomCalendar({
    super.key,
    required this.currentDateTime,
    required this.schedules,
    required this.onScheduleTap,
    this.backgroundColor = Colors.white,
    this.miniMode = false,
  });

  bool _hasSchedule(DateTime date) {
    return schedules.any((schedule) {
      return schedule.date.year == date.year && schedule.date.month == date.month && schedule.date.day == date.day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateTime firstDayOfMonth = DateTime(currentDateTime.year, currentDateTime.month, 1);
    final DateTime lastDayOfMonth = DateTime(currentDateTime.year, currentDateTime.month + 1, 0);
    final int firstWeekday = firstDayOfMonth.weekday % 7;

    const weekDayLabels = ['일', '월', '화', '수', '목', '금', '토'];

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: miniMode ? EdgeInsets.zero : const EdgeInsets.only(top: 16.0),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDayLabels
                .map(
                  (label) => Expanded(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: Typos.regular16,
                    ),
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: miniMode ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: 8.0),
            child: const Divider(
              color: AppColor.grey,
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              final displayDate = firstDayOfMonth.subtract(
                Duration(days: firstWeekday - index),
              );

              final hasSchedule = _hasSchedule(displayDate);

              if (index >= firstWeekday && displayDate.difference(lastDayOfMonth).inDays <= 0) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: miniMode ? null : (hasSchedule ? () {
                      debugPrint('날짜 선택: $displayDate');
                      onScheduleTap.call(displayDate);
                    } : null),
                    child: Container(
                      decoration: BoxDecoration(
                        color: hasSchedule ? AppColor.pink.withOpacity(0.5) : AppColor.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              '${displayDate.day}',
                              style: miniMode ? Typos.regular14 : Typos.semibold16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
