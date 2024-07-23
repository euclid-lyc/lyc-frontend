import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/screens/join_membership_screen_1.dart';
import 'package:lyc_flutter_project/screens/join_membership_screen_3.dart';
import '../widget/AppTextStyles.dart';

class JoinMembershipScreen2 extends StatelessWidget {
  const JoinMembershipScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(
        backButton: true,
        title: "회원가입",
        deleteButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 98), // 상단 여백을 98 픽셀로 설정
            Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 400), // 최대 너비 설정
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
                        'Step 2. 회원정보 입력',
                        style: AppTextStyles.littleTitle,
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
                        color:AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 252,
                      height: 37,// 너비를 252로 설정
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '닉네임',
                          hintStyle: AppTextStyles.hint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        maxLines: 3, // 여러 줄 입력 가능
                        decoration: InputDecoration(
                          hintText: '자유롭게 자신을 소개해 주세요',
                          hintStyle: AppTextStyles.hint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10), // 왼쪽 여백 조정
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 67), // 버튼과 아래쪽 여백
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
                        MaterialPageRoute(builder: (context) => const JoinMembershipScreen1()),
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
                      style: AppTextStyles.hint.copyWith(
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
                        MaterialPageRoute(builder: (context) => JoinMembershipScreen3()),
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
                      style: AppTextStyles.button,
                      textAlign: TextAlign.center,
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
}
