import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime currentDateTime;
  final List<ScheduleModel> schedules;
  final VoidCallback onScheduleTap;

  const CustomCalendar({
    super.key,
    required this.currentDateTime,
    required this.schedules,
    required this.onScheduleTap,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(top: 16.0),
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
                  style: Typos.semibold16,
                ),
              ),
            )
                .toList(),
          ),
          // const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              color: AppColor.grey,
            ),
          ),
          GridView.builder(
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
                  borderRadius: BorderRadius.circular(8.0),
                  child: InkWell(
                    onTap: hasSchedule ? onScheduleTap : null,
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
                              style: Typos.semibold16,
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
