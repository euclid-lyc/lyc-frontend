import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lyc_flutter_project/commissions/provider/commissions_provider.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:provider/provider.dart';
import '../../common/widget/custom_alert_dialog.dart';
import '../../common/widget/normal_appbar.dart';
import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';
import '../widget/custom_dialog.dart';

class CommissionsScreen extends StatefulWidget {
  const CommissionsScreen({super.key, required this.provider});

  final ChatProvider provider;

  @override
  CommissionsScreenState createState() => CommissionsScreenState();
}

class CommissionsScreenState extends State<CommissionsScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('M/d \n HH:mm').format(now);
    final bool isDirector = widget.provider.isMine.isDirector;
    final int commissionId = widget.provider.commissionId;
    final int chatId = widget.provider.chatId;
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
                    updateCommission(
                        isDirector: isDirector,
                        commissionId: commissionId,
                        formattedTime: formattedTime,
                        value: value),
                    const SizedBox(height: 40),
                    saveClothes(isDirector: isDirector, value: value),
                    const SizedBox(height: 40),
                    //todo 상태에 따라 종료요청하기/ 상대가 승낙할 때까지 기다리기 만들기
                    terminateCommission(
                        chatId: chatId, value: value, context: context),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

Widget updateCommission(
    {required bool isDirector,
    required int commissionId,
    required String formattedTime,
    required CommissionsProvider value}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 40),
    child: Container(
      width: 332,
      height: 72,
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 4, 0, 4),
            child: Icon(
              Icons.description_outlined,
              color: AppColor.brown,
              size: 32,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: isDirector
                  ? null
                  : () {
                      value.getCommission(commissionId);
                    },
              child: Text(
                isDirector ? "의뢰서는 작성자만 수정이 가능합니다" : "의뢰서 수정하기",
                style: AppTextStyle.title
                    .copyWith(color: isDirector ? Colors.black : Colors.grey),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget saveClothes(
    {required bool isDirector, required CommissionsProvider value}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 40),
    child: Container(
      width: 332,
      height: 500,
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      // 버튼 등 추가 예정
    ),
  );
}

Widget terminateCommission(
    {
    required int chatId,
    required CommissionsProvider value,
    required BuildContext context}) {
  return Padding(
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
              Icons.description_outlined,
              color: AppColor.brown,
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
                  height: 44,
                  child: TextButton(
                    onPressed: () async {
                      bool? result = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            title: "정말 의뢰 종료 요청을 보내시겠습니까?",
                            leftButtonLabel: "취소",
                            rightButtonLabel: "종료",
                            leftButtonPressed: () =>
                                Navigator.pop(context, false),
                            rightButtonPressed: () async {
                              Navigator.pop(context, true);
                            },
                            rightBackgroundColor: AppColor.brown,
                          );
                        },
                      );
                      // result가 true이면 의뢰 종료 요청 진행
                      if (result == true) {
                        try {
                          await value.terminateCommission(chatId);
                          if (context.mounted) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomDialog(
                                  title: ">의뢰 종료를 요청했습니다<",
                                  subtitle: "상대방이 승낙해야 의뢰가 종료됩니다.",
                                );
                              },
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
                      }
                    },
                    child: Text(
                      '의뢰 종료하기',
                      style: AppTextStyle.title.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:lyc_flutter_project/commissions/provider/commissions_provider.dart';
// import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
// import 'package:provider/provider.dart';
// import '../../common/widget/custom_alert_dialog.dart';
// import '../../common/widget/normal_appbar.dart';
// import '../../data/app_color.dart';
// import '../../styles/app_text_style.dart';
//
//
// import '../widget/custom_dialog.dart';
//
// class CommissionsScreen extends StatefulWidget {
//   const CommissionsScreen({super.key, required this.provider});
//
//   final ChatProvider provider;
//
//   @override
//   CommissionsScreenState createState() => CommissionsScreenState();
// }
//
// class CommissionsScreenState extends State<CommissionsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     String formattedTime = DateFormat('M/d \n HH:mm').format(now);
//     int chatId = widget.provider.chatId;
//     int commissionId = widget.provider.commissionId;
//     bool isDirector = widget.provider.isMine.isDirector;
//
//
//     return Consumer<CommissionsProvider>(
//       builder: (context, value, child) {
//         return Scaffold(
//           backgroundColor: AppColor.lightGrey,
//           appBar: const NormalAppbar(title: "의뢰"),
//           body: Center(
//             child: Container(
//               margin: const EdgeInsets.fromLTRB(32, 20, 32, 0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
//                 crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
//                 children: [
//                   // 위 박스
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 40),
//                     child: Container(
//                       width: 332,
//                       height: 72,
//                       decoration: BoxDecoration(
//                         color: AppColor.grey,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(32, 4, 0, 4),
//                             child: Icon(
//                               Icons.description_outlined, // 문서 아이콘
//                               color: AppColor.brown, // 아이콘 색상
//                               size: 32,
//                             ),
//                           ),
//                           Expanded(
//                             child: TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "의뢰서 수정하기",
//                                 style: AppTextStyle.title
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 4, 20, 4),
//                             child: Text(' $formattedTime'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // 중간 박스
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 40),
//                     child: Container(
//                       width: 332, // 가로 너비
//                       height: 500, // 높이
//                       decoration: BoxDecoration(
//                         color: AppColor.grey,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   // 아래 박스
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 40),
//                     child: Container(
//                       width: 332,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: AppColor.grey,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(32, 4, 0, 4),
//                             child: Icon(
//                               Icons.description_outlined, // 문서 아이콘
//                               color: AppColor.brown, // 아이콘 색상
//                               size: 32,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(20, 4, 0, 4),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   width: 200,
//                                   height: 44,
//                                   child: TextButton(
//                                     onPressed: () async {
//                                       bool? result = await showDialog<bool>(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return CustomAlertDialog(
//                                             title: "정말 의뢰 종료 요청을 보내시겠습니까?",
//                                             leftButtonLabel: "취소",
//                                             rightButtonLabel: "종료",
//                                             leftButtonPressed: () =>
//                                                 Navigator.pop(context, false),
//                                             rightButtonPressed: () async {
//                                               Navigator.pop(context, true);
//                                             },
//                                             rightBackgroundColor: AppColor.brown,
//                                           );
//                                         },
//                                       );
//                                       // result가 true이면 의뢰 종료 요청 진행
//                                       if (result == true) {
//                                         try {
//                                           await value.terminateCommission(chatId);
//                                           if (context.mounted) {
//                                             Navigator.pop(context);
//                                             showDialog(
//                                               context: context,
//                                               builder: (context) {
//                                                 return const CustomDialog(
//                                                   title: ">의뢰 종료를 요청했습니다<",
//                                                   subtitle: "상대방이 승낙해야 의뢰가 종료됩니다.",
//                                                 );
//                                               },
//                                             );
//                                           }
//                                         } catch (e) {
//                                           if (context.mounted) {
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               SnackBar(
//                                                 content: Text(
//                                                     "오류가 발생했습니다: ${e.toString()}"),
//                                               ),
//                                             );
//                                           }
//                                         }
//                                       }
//                                     },
//                                     child: Text(
//                                       '의뢰 종료하기',
//                                       style: AppTextStyle.title.copyWith(
//                                           color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }