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
          Container(
            decoration: BoxDecoration(
              color: AppColor.beige,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 12.0,
            width: 100.0,
            margin: const EdgeInsets.only(bottom: 20.0),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: schedules.length,
              itemBuilder: (context, index) {
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
                                '${schedule.date.year.toString()} / ${schedule.date.month.toString()} / ${schedule.date.day.toString()} (화)',
                                style: Typos.semibold16,
                              ),
                              // Text(
                              //   '~ 20:00',
                              //   style: Typos.semibold16,
                              // ),
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
            ),
          ),
        ],
      ),
    );
  }
}
