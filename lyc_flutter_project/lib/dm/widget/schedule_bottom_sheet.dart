import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class ScheduleBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const ScheduleBottomSheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      child: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              scrollController.position.moveTo(
                scrollController.position.pixels - details.delta.dy,
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
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColor.lightGrey,
                ),
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2024 / 04 / 23 (화)',
                            style: Typos.semibold16,
                          ),
                          Text(
                            '~ 20:00',
                            style: Typos.semibold16,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 40.0),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          '1차 코디 확인',
                          textAlign: TextAlign.start,
                          style: Typos.regular16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
