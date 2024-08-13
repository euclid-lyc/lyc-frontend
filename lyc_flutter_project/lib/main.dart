import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
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