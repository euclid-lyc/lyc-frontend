import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../common/widget/normal_appbar.dart';
import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';


class CommissionsScreen extends StatefulWidget {
  final String chatId;
  const CommissionsScreen({super.key,required this.chatId});

  @override
  CommissionsScreenState createState() => CommissionsScreenState();
}

class CommissionsScreenState extends State<CommissionsScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('M/d \n HH:mm').format(now);
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "의뢰"),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
            children: [
              // 위 박스
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: 333,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                    children: [
                      const Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
                        child: Icon(
                          Icons.description_outlined, // 문서 아이콘
                          color: AppColor.brown, // 아이콘 색상
                          size: 30,
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // 버튼 클릭 시 동작 추가
                          },
                          child: Text(
                            "의뢰서 수정하기",
                            style: AppTextStyle.title.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                          child: Text(' $formattedTime')),
                    ],
                  ),
                ),
              ),
              // 중간 박스
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: 333, // 가로 너비
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
                  width: 333,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
                        child: Icon(
                          Icons.description_outlined, // 문서 아이콘
                          color: AppColor.brown, // 아이콘 색상
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200, // 원하는 너비
                              height: 40, // 원하는 높이
                              child: TextButton(
                                onPressed: () {

                                }, style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                                child: Text(
                                  "의뢰 종료 요청하기",
                                  style: AppTextStyle.title.copyWith(color: Colors.black),
                                ),
                              ),
                            )
                            ,Text(
                              "상대방의 동의를 얻으면 요청이 종료됩니다.",
                              style: AppTextStyle.hint
                                  .copyWith(color: AppColor.brown,fontSize:10 ),
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
  }
}
