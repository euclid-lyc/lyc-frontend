import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/screens/temp_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TempScreen()),
        );
      },
    );
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '유클리드',
              style: TextStyle(
                color: Color(0xff738998),
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Lead Your Closet',
              style: TextStyle(
                color: Color(0xffBBBBBB),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
