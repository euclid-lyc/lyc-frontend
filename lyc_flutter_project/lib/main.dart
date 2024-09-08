import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';
import 'package:lyc_flutter_project/Join/Screens/join_membership_screen_4.dart';
import 'package:lyc_flutter_project/feed/provider/feed_provider.dart';
import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
import 'package:lyc_flutter_project/feed/repository/weather_repository.dart';
import 'package:lyc_flutter_project/home/provider/home_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/posting/provider/posting_detail_provider.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DioProvider(),
        ),
        ChangeNotifierProvider(create: (context) => MembershipState()),
        ChangeNotifierProvider(
          create: (context) => BlockProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotifyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FollowProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ClothesRepositoryProvider(dio: context.read<DioProvider>().dio),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CoordiRepositoryProvider(dio: context.read<DioProvider>().dio),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherRepositoryProvider(
            dio: context.read<DioProvider>().dio,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedProvider(
            weatherRepositoryProvider:
                context.read<WeatherRepositoryProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedRepositoryProvider(
            dio: context.read<DioProvider>().dio,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            feedRepositoryProvider: context.read<FeedRepositoryProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MypageRepositoryProvider(
            dio: context.read<DioProvider>().dio,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MypageProvider(
            mypageRepositoryProvider: context.read<MypageRepositoryProvider>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
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
