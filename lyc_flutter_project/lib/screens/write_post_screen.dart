import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

/// 다목적 스크린
/// 코디 업로드(0), 리뷰 업로드(1), 옷 추가(2)

class WritePostScreen extends StatelessWidget {
  final int purpose;
  TextEditingController writePostController = TextEditingController();

  WritePostScreen({
    super.key,
    required this.purpose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(
        backButton: true,
        title: getTitle(),
        deleteButton: false,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            // 옷 추가일때만 스위치 위젯 추가
            // 사진 첨부->image picker
            Expanded(
              flex: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            // 텍스트 필드
            Expanded(
              flex: 6,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField()),
            ),
            Expanded(flex: 1, child: SizedBox()),
            // 세부설정, 등록 버튼
            Expanded(
              flex: 2,
              /// 니증에 Row 위젯 분리하겠음
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '세부설정',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.beige,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '등록',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String getTitle() {
    if (purpose == 0) {
      return "코디 업로드";
    } else if (purpose == 1) {
      return "리뷰 업로드";
    } else if (purpose == 2) {
      return "옷 추가";
    } else {
      return "error";
    }
  }
}
