import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_4.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MembershipState()),
      // 다른 프로바이더들도 여기에 추가
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lead Your Closet',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
