import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_4.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => DioProvider(),),
      ChangeNotifierProvider(create: (context) => MembershipState()),
      ChangeNotifierProvider(create: (context) => BlockProvider(),),
      ChangeNotifierProvider(create: (context) => NotifyProvider(),),
      ChangeNotifierProvider(create: (context) => FollowProvider(),),
      ChangeNotifierProvider(create: (context) => ClothesRepositoryProvider(dio: context.read<DioProvider>().dio),),
      // 다른 프로바이더들도 여기에 추가
    ], child: const MyApp()),
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
