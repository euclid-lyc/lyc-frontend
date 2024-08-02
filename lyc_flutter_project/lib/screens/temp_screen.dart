import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/screens/home_screen.dart';
import 'package:lyc_flutter_project/screens/login_screen.dart';
import 'package:lyc_flutter_project/screens/my_page_screen.dart';
import 'package:lyc_flutter_project/widget/bottom_bar.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TempScreen'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text('개발 중 화면 이동을 위한 임시화면입니다.'),
            Text('네비게이터 구현 이전에 스크린을 확인하기 위함입니다.'),
            Text('구현한 화면으로 연결되는 버튼을 여기에 만들어주세요.'),
            SizedBox(height: 30,),

            // 텍스트 버튼 양식
            // TextButton(onPressed: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => 스크린클래스이름(),));
            //  }, child: Text('이 화면에 표시될 문구')),

            // My Page 이동 버튼->member id 1을 전달합니다
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar(),));
            }, child: Text('My Page')),

          // 남의 페이지 이동 버튼->member id 2를 전달합니다
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyPageScreen(memberId: 2),));
            }, child: Text('윈터 페이지로 이동')),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            }, child: Text('Login')),


            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            }, child: Text('Home Screen')),
          ],
        ),
      ),
    );
  }
}
