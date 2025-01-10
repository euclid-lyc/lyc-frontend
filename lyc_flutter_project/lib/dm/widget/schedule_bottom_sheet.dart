import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model.dart';

class ScheduleBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final List<ScheduleModel> schedules;
  final Function(double) onHandleDrag;

  const ScheduleBottomSheet({
    super.key,
    required this.scrollController,
    required this.schedules,
    required this.onHandleDrag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      height: 1500,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
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
            onVerticalDragUpdate: (details) {
              onHandleDrag(details.primaryDelta ?? 0);
            },
            child: Container(
              width: double.infinity, // GestureDetector가 선택 가능한 영역
              color: Colors.transparent, // 선택 영역 확인을 위해 투명 색상 추가 가능
              child: Align(
                alignment: Alignment.center, // 내부 컨테이너의 정렬
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.beige,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 16.0,
                  width: 100.0, // 내부 컨테이너의 고정된 너비
                  margin: const EdgeInsets.only(bottom: 20.0),
                ),
              ),
            ),
          ),
          // 일정 목록
          Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              controller: scrollController,
              itemCount: schedules.isEmpty ? 0 : schedules.length,
              itemBuilder: (context, index) {
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
                              '${schedule.date.year} / ${schedule.date.month} / ${schedule.date.day}',
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
