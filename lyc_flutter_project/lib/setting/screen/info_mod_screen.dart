import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/database/alarm_db.dart';
import 'package:lyc_flutter_project/setting/widget/switch_box.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoModScreen extends StatefulWidget {
  const InfoModScreen({super.key});

  @override
  State<InfoModScreen> createState() => _InfoModScreenState();
}

class _InfoModScreenState extends State<InfoModScreen> {
  late SharedPreferences prefs;
  late bool dm;
  late bool feed;
  late bool calendar;
  late bool like;
  late bool event;
  late bool ad;

  @override
  void initState() {
    super.initState();
    initializeAlarmDb();
  }

  Future<void> initAlarmDb() async {
    prefs = await SharedPreferences.getInstance();
    initializeAlarmDb();
    dm = await getAlarm(PushAlarm.dm);
    feed = await getAlarm(PushAlarm.feed);
    calendar = await getAlarm(PushAlarm.calendar);
    like = await getAlarm(PushAlarm.like);
    event = await getAlarm(PushAlarm.event);
    ad = await getAlarm(PushAlarm.ad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "푸시알림 설정"),
      body: DefaultPadding(
        bottom: 40.0,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: initAlarmDb(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(
                        child: CustomLoading(),
                      );
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SwitchBox(
                            label: "DM 알림",
                            isChecked: dm,
                            onChanged: (newValue) => setState(() {
                              setAlarm(PushAlarm.dm, newValue);
                            }),
                          ),
                          SwitchBox(
                            label: "피드 알림",
                            isChecked: feed,
                            onChanged: (newValue) => setState(() {
                              setAlarm(PushAlarm.feed, newValue);
                            }),
                            note: "팔로워의 피드가 업데이트 되었을 때 알림을 전송합니다",
                          ),
                          SwitchBox(
                            label: "일정 알림",
                            isChecked: calendar,
                            onChanged: (newValue) => setState(() {
                              setAlarm(PushAlarm.calendar, newValue);
                            }),
                            note: "등록된 일정의 종료가 임박했을 때 알림을 전송합니다",
                          ),
                          SwitchBox(
                            label: "좋아요 알림",
                            isChecked: like,
                            onChanged: (newValue) => setState(() {
                              setAlarm(PushAlarm.like, newValue);
                            }),
                          ),
                          SwitchBox(
                            label: "이벤트 알림",
                            isChecked: event,
                            onChanged: (newValue) => setState(() {
                              setAlarm(PushAlarm.event, newValue);
                            }),
                            note: "진행중인 이벤트 및 결과 발표에 대한 알림을 전송합니다.",
                          ),
                          SwitchBox(
                            label: "광고 알림",
                            isChecked: ad,
                            onChanged: (newValue) => setState(() {
                              setAlarm(PushAlarm.ad, newValue);
                            }),
                          ),
                        ],
                      ),
                    );
                  },
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
  }
}
