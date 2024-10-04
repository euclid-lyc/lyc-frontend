import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/widget/switch_box.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:provider/provider.dart';

class InfoModScreen extends StatefulWidget {
  const InfoModScreen({super.key});

  @override
  State<InfoModScreen> createState() => _InfoModScreenState();
}

class _InfoModScreenState extends State<InfoModScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingProvider>().initAlarmScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "푸시알림 설정"),
      body: DefaultPadding(
        bottom: 40.0,
        child: Consumer<SettingProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: value.loadingPushAlarm
                      ? const Center(
                          child: CustomLoading(),
                        )
                      : SingleChildScrollView(
                        child: Column(
                            children: [
                              SwitchBox(
                                label: "DM 알림",
                                isChecked: value.alarm.dm,
                                onChanged: (newValue) =>
                                    value.updateDm(newValue),
                              ),
                              SwitchBox(
                                label: "피드 알림",
                                isChecked: value.alarm.feed,
                                onChanged: (newValue) =>
                                    value.updateFeed(newValue),
                                note: "팔로워의 피드가 업데이트 되었을 때 알림을 전송합니다",
                              ),
                              SwitchBox(
                                label: "일정 알림",
                                isChecked: value.alarm.schedule,
                                onChanged: (newValue) =>
                                    value.updateSchedule(newValue),
                                note: "등록된 일정의 종료가 임박했을 때 알림을 전송합니다",
                              ),
                              SwitchBox(
                                label: "좋아요 알림",
                                isChecked: value.alarm.likeMark,
                                onChanged: (newValue) =>
                                    value.updateLikeMark(newValue),
                              ),
                              SwitchBox(
                                label: "이벤트 알림",
                                isChecked: value.alarm.event,
                                onChanged: (newValue) =>
                                    value.updateEvent(newValue),
                                note: "진행중인 이벤트 및 결과 발표에 대한 알림을 전송합니다.",
                              ),
                              SwitchBox(
                                label: "광고 알림",
                                isChecked: value.alarm.ad,
                                onChanged: (newValue) =>
                                    value.updateAd(newValue),
                              ),
                            ],
                          ),
                      ),
                ),
                TwoButtons(
                  fstOnPressed: () async {
                    await value.initModel(refresh: true);
                    Navigator.pop(context);
                  },
                  scdOnPressed: () async {
                    await value.saveAlarm();
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
