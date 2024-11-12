import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/app_color.dart';
import '../../../styles/app_text_style.dart';
import '../../../widget/normal_appbar.dart';
import '../Provider/join_provider.dart';
import '../model/pushset.dart';
import 'join_screen_6.dart';


class JoinScreen5 extends StatefulWidget {
  const JoinScreen5({super.key});

  @override
  State<JoinScreen5> createState() => JoinScreenState5();
}

class JoinScreenState5 extends State<JoinScreen5> {
  bool dm = false;
  bool feed = false;
  bool schedule = false;
  bool likeMark = false;
  bool event = false;
  bool ad = false;

  @override
  Widget build(BuildContext context) {
    final joinProvider = Provider.of<JoinProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "회원가입",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(29, 28.5, 29, 33),
            width: 296,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    'Step 6. 사용자 동의',
                    style: app_text_style.littleTitle,
                  ),
                ),
                const SizedBox(height: 10),

                // Checkbox fields
                buildCheckField(dm, "DM 수신 동의", (value) {
                  setState(() {
                    dm = value ?? false;
                  });
                }),
                buildCheckField(feed, "피드 알림 동의", (value) {
                  setState(() {
                    feed = value ?? false;
                  });
                }),
                buildCheckField(schedule, "스케줄 알림 동의", (value) {
                  setState(() {
                    schedule = value ?? false;
                  });
                }),
                buildCheckField(likeMark, "좋아요 표시 동의", (value) {
                  setState(() {
                    likeMark = value ?? false;
                  });
                }),
                buildCheckField(event, "이벤트 알림 동의", (value) {
                  setState(() {
                    event = value ?? false;
                  });
                }),
                buildCheckField(ad, "광고 수신 동의", (value) {
                  setState(() {
                    ad = value ?? false;
                  });
                }),

                const SizedBox(height: 30.5),
                Center(
                  child: TextButton(
                    onPressed: () {
                      joinProvider.pushSet = PushSet(
                          dm: dm,
                          feed: feed,
                          schedule: schedule,
                          likeMark: likeMark,
                          event: event,
                          ad: ad);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const JoinScreen6()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: SizedBox(
                      width: 230,
                      child: Text(
                        '다음',
                        style: app_text_style.button,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckField(
      bool _isAgreed, String text, Function(bool?) onChanged) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: _isAgreed,
            onChanged: onChanged,
          ),
          Expanded(
            child: Text(
              text,
              style: app_text_style.labelTextStyle.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
