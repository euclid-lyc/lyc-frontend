import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Screens/login_screen.dart';
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

            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
