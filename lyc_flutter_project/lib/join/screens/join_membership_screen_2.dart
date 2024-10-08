import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_1.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_3.dart';
import '../../styles/app_text_style.dart';
import '../../widget/Controller.dart';

class JoinMembershipScreen2 extends StatefulWidget {
  const JoinMembershipScreen2({super.key});

  @override
  JoinMembershipScreenState2 createState() {
    return JoinMembershipScreenState2();
  }
}

class JoinMembershipScreenState2 extends State<JoinMembershipScreen2> {

  final Controller _controller1 = Controller();
  final Controller _controller2 = Controller();
  final Controller _controller3 = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "회원가입",
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.fromLTRB(22, 28.5, 22, 0),
                height: 306,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 8),
                      child: Text(
                        'Step 2. 배송지 입력',
                        style: app_text_style.littleTitle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(13.7, 0, 13.7, 25),
                      child: Text(
                        '배송지 정보는 다른 사용자에게 노출되지 않습니다.',
                        style: app_text_style.hint,
                      ),
                    ),
                    // 우편번호 입력 필드 및 버튼
                    Padding(
                      padding: EdgeInsets.fromLTRB(13.7, 0, 13.7, 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40, // 높이 설정
                              decoration: BoxDecoration(
                                color: AppColor.lightGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                controller: _controller1.controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '우편번호',
                                  hintStyle: app_text_style.hint,

                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12), // 중앙 정렬
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                // 텍스트 수직 중앙 정렬
                                textAlign: TextAlign.left, // 텍스트 왼쪽 정렬
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            height: 40, // 버튼의 높이 설정
                            child: TextButton(
                              onPressed: () {
                                // 우편번호 찾기 버튼 클릭 시 동작
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColor.brown, // 색상 변경
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.1, vertical: 4.7),
                              ),
                              child: Center(
                                child: Text(
                                  '우편번호 찾기',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 주소 입력 필드
                    Padding(
                      padding: EdgeInsets.fromLTRB(13.7, 0, 13.7, 14),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _controller2.controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '주소',
                            hintStyle: app_text_style.hint,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12), // 중앙 정렬
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          // 텍스트 수직 중앙 정렬
                          textAlign: TextAlign.left, // 텍스트 왼쪽 정렬
                        ),
                      ),
                    ),
                    // 상세 주소 입력 필드
                    Padding(
                      padding: EdgeInsets.fromLTRB(13.7, 0, 13.7, 0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey, // 흰색으로 유지
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _controller3.controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '상세주소',
                            hintStyle: app_text_style.hint,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12), // 중앙 정렬
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          // 텍스트 수직 중앙 정렬
                          textAlign: TextAlign.left, // 텍스트 왼쪽 정렬
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
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
                                builder: (context) => JoinMembershipScreen1()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.grey, // 색상 변경
                          minimumSize: const Size(120, 40), // 버튼 크기 설정
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
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => const JoinMembershipScreen3()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.beige, // 색상 변경
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