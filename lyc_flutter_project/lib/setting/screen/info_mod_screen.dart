import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/model/member_model.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/widget/switch_box.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:provider/provider.dart';

class InfoModScreen extends StatelessWidget {
  const InfoModScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, value, child) {
        PushAlarmModel? alarmModel = value.alarm;
        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          appBar: const NormalAppbar(title: "푸시알림 설정"),
          body: value.loadingPushAlarm
              ? const Center(
                  child: CustomLoading(),
                )
              : DefaultPadding(
                  bottom: 40.0,
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SwitchBox(
                                  label: "DM 알림",
                                  isChecked: alarmModel!.dm,
                                  onChanged: (newValue) =>
                                      value.updatePushAlarm(dm: newValue),
                                ),
                                SwitchBox(
                                  label: "피드 알림",
                                  isChecked: alarmModel!.feed,
                                  onChanged: (newValue) =>
                                      value.updatePushAlarm(feed: newValue),
                                  note: "팔로워의 피드가 업데이트 되었을 때 알림을 전송합니다",
                                ),
                                SwitchBox(
                                  label: "일정 알림",
                                  isChecked: alarmModel!.schedule,
                                  onChanged: (newValue) =>
                                      value.updatePushAlarm(schedule: newValue),
                                  note: "등록된 일정의 종료가 임박했을 때 알림을 전송합니다",
                                ),
                                SwitchBox(
                                  label: "좋아요 알림",
                                  isChecked: alarmModel!.likeMark,
                                  onChanged: (newValue) =>
                                      value.updatePushAlarm(likeMark: newValue),
                                ),
                                SwitchBox(
                                  label: "이벤트 알림",
                                  isChecked: alarmModel!.event,
                                  onChanged: (newValue) =>
                                      value.updatePushAlarm(event: newValue),
                                  note: "진행중인 이벤트 및 결과 발표에 대한 알림을 전송합니다.",
                                ),
                                SwitchBox(
                                  label: "광고 알림",
                                  isChecked: alarmModel!.ad,
                                  onChanged: (newValue) =>
                                      value.updatePushAlarm(ad: newValue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TwoButtons(
                          fstOnPressed: () {
                            Navigator.pop(context);
                          },
                          scdOnPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
