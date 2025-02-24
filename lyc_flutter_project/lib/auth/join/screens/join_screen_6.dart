import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/dio/dio.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../common/widget/normal_appbar.dart';
import '../../../data/app_color.dart';
import '../../../styles/app_text_style.dart';
import '../Provider/join_provider.dart';
import '../model/pushset.dart';
import 'join_screen_7.dart';

class JoinScreen6 extends StatefulWidget {
  const JoinScreen6({super.key});

  @override
  State<JoinScreen6> createState() => JoinScreenState6();
}

class JoinScreenState6 extends State<JoinScreen6> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(title: "회원가입"),
        body: Consumer<JoinProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CustomLoading());
          }
          return Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(32, 28, 32, 28),
                      margin: const EdgeInsets.fromLTRB(32, 32, 32, 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 28),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Step 6.사용자 동의',
                              style: AppTextStyle.littleTitle,
                            ),
                          ),
                          buildCheckField(
                              isAgreed: value.dm,
                              text: "DM 수신 동의",
                              onChanged: (p0) => value.updateDm(p0 ?? false)),
                          buildCheckField(
                              isAgreed: value.feed,
                              text: "피드 알림 동의",
                              onChanged: (p0) => value.updateFeed(p0 ?? false)),
                          buildCheckField(
                              isAgreed: value.schedule,
                              text: "스케줄 알림 동의",
                              onChanged: (p0) =>
                                  value.updateSchedule(p0 ?? false)),
                          buildCheckField(
                              isAgreed: value.likeMark,
                              text: "좋아요 표시 동의",
                              onChanged: (p0) =>
                                  value.updateLikeMark(p0 ?? false)),
                          buildCheckField(
                              isAgreed: value.event,
                              text: "이벤트 알림 동의",
                              onChanged: (p0) =>
                                  value.updateEvent(p0 ?? false)),
                          buildCheckField(
                              isAgreed: value.ad,
                              text: "광고 수신 동의",
                              onChanged: (p0) => value.updateAd(p0 ?? false)),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: CustomNextButton(
                              onPressed: () async {
                                try {
                                  await value.register();
                                  if (context.mounted) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const JoinScreen7()),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('회원 가입 실패: ${e.toString()}')),
                                  );
                                }
                              },
                              text: '다음',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          );
        }));
  }

  Widget buildCheckField({
    required bool isAgreed,
    required String text,
    required Function(bool?) onChanged,
  }) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isAgreed,
            onChanged: onChanged,
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyle.labelTextStyle.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
