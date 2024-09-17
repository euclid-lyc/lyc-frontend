import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/widget/switch_box.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

class InfoModScreen extends StatefulWidget {
  const InfoModScreen({super.key});

  @override
  State<InfoModScreen> createState() => _InfoModScreenState();
}

class _InfoModScreenState extends State<InfoModScreen> {
  bool isDM = false;
  bool isFeed = false;
  bool isSchedule = false;
  bool isLiked = false;
  bool isEvent = false;
  bool isAd = false;

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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchBox(
                        label: "DM 알림",
                        isChecked: isDM,
                        onChanged: (value) {
                          setState(() {
                            isDM = value;
                          });
                        },
                      ),
                      SwitchBox(
                        label: "피드 알림",
                        isChecked: isFeed,
                        onChanged: (value) {
                          setState(() {
                            isFeed = value;
                          });
                        },
                        note: "팔로워의 피드가 업데이트 되었을 때 알림을 전송합니다",
                      ),
                      SwitchBox(
                        label: "일정 알림",
                        isChecked: isSchedule,
                        onChanged: (value) {
                          setState(() {
                            isSchedule = value;
                          });
                        },
                        note: "등록된 일정의 종료가 임박했을 때 알림을 전송합니다",
                      ),
                      SwitchBox(
                        label: "좋아요 알림",
                        isChecked: isLiked,
                        onChanged: (value) {
                          setState(() {
                            isLiked = value;
                          });
                        },
                      ),
                      SwitchBox(
                        label: "이벤트 알림",
                        isChecked: isEvent,
                        onChanged: (value) {
                          setState(() {
                            isEvent = value;
                          });
                        },
                        note: "진행중인 이벤트 및 결과 발표에 대한 알림을 전송합니다.",
                      ),
                      SwitchBox(
                        label: "광고 알림",
                        isChecked: isAd,
                        onChanged: (value) {
                          setState(() {
                            isAd = value;
                          });
                        },
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
  }
}
