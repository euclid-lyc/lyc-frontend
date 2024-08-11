import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import '../styles/app_text_style.dart';
import 'find_id_screen_1.dart';
import 'find_id_screen_3.dart';

class FindIdScreen2 extends StatelessWidget {
  const FindIdScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(title: "아이디 찾기"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1, // 상단 여백을 비율로 설정
            child: Container(), // 빈 컨테이너로 여백을 제공
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              // 최대 너비 설정
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.fromLTRB(22, 28.5, 22, 0),
              width: 296,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 7, 43.5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Step 2. 본인인증',
                        style: app_text_style.littleTitle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 49),
                      decoration: BoxDecoration(
                        color: Color(0xFFBBBBBB),
                        borderRadius: BorderRadius.circular(62),
                      ),
                      width: 124,
                      height: 124,
                      child: Center(
                        child: Icon(
                          Icons.mail_outline_outlined, // 아이콘으로 변경
                          size: 60, // 아이콘 크기 설정
                          color: Colors.white, // 아이콘 색상 설정
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 0, 18.5),
                      child: Text(
                        '선택하신 인증수단으로 \n 인증번호가 전송되었습니다.',
                        textAlign: TextAlign.center,
                        style: app_text_style.otherLoginTextStyle
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 252,
                      height: 37, // 높이 설정
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '인증번호를 입력해 주세요',
                          hintStyle: app_text_style.hint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 43),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 1, // 하단 여백을 비율로 설정
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // '이전' 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FindIdScreen1()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.grey,
                          minimumSize: Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '이전',
                          style: app_text_style.hint.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // '다음' 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FindIdScreen3()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.beige,
                          minimumSize: Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '다음',
                          style: app_text_style.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
