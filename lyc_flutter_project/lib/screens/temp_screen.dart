import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/screens/login_screen.dart';
import 'package:lyc_flutter_project/common/widget/bottom_bar.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TempScreen'),
      ),
      body: Center(
        child: Column(
          children: [
            // 텍스트 버튼 양식
            // TextButton(onPressed: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => 스크린클래스이름(),));
            //  }, child: Text('이 화면에 표시될 문구')),

            // My Page 이동 버튼->member id 1을 전달합니다
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomBar(),
                    ));
              },
              child: const Text('My Page'),
            ),

            // 남의 페이지 이동 버튼->member id 2를 전달합니다
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
