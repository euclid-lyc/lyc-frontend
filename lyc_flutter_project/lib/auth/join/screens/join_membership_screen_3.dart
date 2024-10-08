import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import '../../../widget/Controller.dart';
import 'join_membership_screen_2.dart';
import 'join_membership_screen_4.dart';

class JoinMembershipScreen3 extends StatefulWidget {
  const JoinMembershipScreen3({super.key});

  @override
  State<JoinMembershipScreen3> createState() {
    return JoinMembershipScreenState3();
  }
}

class JoinMembershipScreenState3 extends State<JoinMembershipScreen3> {
  final Controller _controller1 = Controller();
  final Controller _controller2 = Controller();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "회원가입",
      ),
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
              height: 457,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 7, 43.5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Step 3. 회원정보 입력',
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
                      child: SvgPicture.network(
                        'assets/icon_camera.svg',
                        width: 33.3,
                        height: 31.7,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  // '닉네임' TextField
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 252,
                    height: 37, // 너비를 252로 설정
                    child: TextField(
                      controller: _controller1.controller,
                      decoration: InputDecoration(
                        hintText: '닉네임',
                        hintStyle: app_text_style.hint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // '자유롭게 자신을 소개해주세요' TextField
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 252, // 너비를 252로 설정
                    child: TextField(
                      controller: _controller2.controller,
                      maxLines: 3, // 여러 줄 입력 가능
                      decoration: InputDecoration(
                        hintText: '자유롭게 자신을 소개해 주세요',
                        hintStyle: app_text_style.hint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10), // 왼쪽 여백 조정
                      ),
                    ),
                  ),
                ],
              ),
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
                                builder: (context) =>
                                    const JoinMembershipScreen2()),
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
                                builder: (context) => JoinMembershipScreen4()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.beige,
                          minimumSize: Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
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
