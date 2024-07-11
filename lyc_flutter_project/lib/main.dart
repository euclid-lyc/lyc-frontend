import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lead Your Closet',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}