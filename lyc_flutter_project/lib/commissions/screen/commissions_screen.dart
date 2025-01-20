import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lyc_flutter_project/commissions/provider/commissions_provider.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:provider/provider.dart';
import '../../common/widget/normal_appbar.dart';
import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';

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
                    terminateCommission(isDirector: isDirector, value: value),
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
    {required bool isDirector, required CommissionsProvider value}) {
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
                    onPressed: isDirector ? () {} : null, // 종료 기능 추가 필요
                    child: Text(
                      '의뢰 종료하기',
                      style: AppTextStyle.title.copyWith(
                        color: isDirector ? Colors.black : Colors.grey,
                      ),
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
