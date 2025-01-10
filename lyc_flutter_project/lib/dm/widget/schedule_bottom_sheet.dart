import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model.dart';

class ScheduleBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final List<ScheduleModel> schedules;

  const ScheduleBottomSheet({
    super.key,
    required this.scrollController,
    required this.schedules,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      height: 1500,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2.0,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          // 핸들
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onVerticalDragUpdate: (details) {
              Scrollable.ensureVisible(
                context,
                alignment: 0.5,
                duration: const Duration(milliseconds: 100),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.beige,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: 12.0,
              width: 100.0,
              margin: const EdgeInsets.only(bottom: 20.0),
            ),
          ),
          // 스크롤 가능한 일정 목록
          Expanded(
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (schedules.isEmpty) {
                        return const SizedBox.shrink();
                      } else {
                        final ScheduleModel schedule = schedules[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColor.lightGrey,
                          ),
                          margin: const EdgeInsets.only(bottom: 16.0),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${schedule.date.year} / ${schedule.date.month} / ${schedule.date.day} (화)',
                                      style: Typos.semibold16,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              ConstrainedBox(
                                constraints: const BoxConstraints(minHeight: 40.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Text(
                                    schedule.memo,
                                    textAlign: TextAlign.start,
                                    style: Typos.regular16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    childCount: schedules.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
