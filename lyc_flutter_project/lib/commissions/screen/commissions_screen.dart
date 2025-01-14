import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lyc_flutter_project/commissions/provider/commissions_provider.dart';
import '../../common/widget/custom_alert_dialog.dart';
import '../../common/widget/normal_appbar.dart';
import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';
import 'package:provider/provider.dart';

class CommissionsScreen extends StatefulWidget {
  const CommissionsScreen({super.key, required this.chatId});

  final int chatId;

  @override
  CommissionsScreenState createState() => CommissionsScreenState();
}

class CommissionsScreenState extends State<CommissionsScreen> {

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('M/d \n HH:mm').format(now);
    int chatId = widget.chatId;
    return Consumer<CommissionsProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          appBar: const NormalAppbar(title: "의뢰"),
          body: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(32, 20, 32, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
                children: [
                  // 위 박스
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Container(
                      width: 332,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(32, 4, 0, 4),
                            child: Icon(
                              Icons.description_outlined, // 문서 아이콘
                              color: AppColor.brown, // 아이콘 색상
                              size: 32,
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {

                              },
                              child: Text(
                                "의뢰서 수정하기",
                                style: AppTextStyle.title
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 20, 4),
                              child: Text(' $formattedTime')),
                        ],
                      ),
                    ),
                  ),
                  // 중간 박스
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Container(
                      width: 332, // 가로 너비
                      height: 500, // 높이
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // 아래 박스
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Container(
                      width: 332,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(32, 4, 0, 4),
                            child: Icon(
                              Icons.description_outlined, // 문서 아이콘
                              color: AppColor.brown, // 아이콘 색상
                              size: 32,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 0, 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: TextButton(
                                    onPressed: () async {
                                      final terminate = await showDialog<bool>(
                                        context: context,
                                        builder: (context) {
                                          return CustomAlertDialog(
                                            title: "정말 의뢰 종료 요청을 보내시겠습니까?",
                                            leftButtonLabel: "취소",
                                            rightButtonLabel: "종료",
                                            leftButtonPressed: () =>
                                                Navigator.pop(context, false),
                                            rightButtonPressed: () async {
                                              Navigator.pop(context);
                                              try {
                                                await value.terminateCommission(chatId);
                                                if (context.mounted) {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  // 채팅 화면으로 돌아가면서 "의뢰 종료 요청을 완료했습니다."라는 팝업 띄우기
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(content: Text('의뢰 종료 요청이 완료되었습니다.')),
                                                  );
                                                }
                                              } catch (e) {
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text("오류가 발생했습니다: ${e.toString()}"),
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            rightBackgroundColor: AppColor.brown,
                                          );
                                        },
                                      );
                                      if (terminate == true) {
                                        try {
                                          await value.terminateCommission(chatId);
                                          if (context.mounted) {
                                            Navigator.pop(context, true);
                                          }
                                        } catch (e) {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "오류가 발생했습니다: ${e.toString()}",
                                                ),
                                              ),
                                            );
                                          }
                                        }
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Text(
                                      "의뢰 종료 요청하기",
                                      style: AppTextStyle.title
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Text(
                                  "상대방의 동의를 얻으면 요청이 종료됩니다.",
                                  style: AppTextStyle.hint.copyWith(
                                      color: AppColor.brown, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
