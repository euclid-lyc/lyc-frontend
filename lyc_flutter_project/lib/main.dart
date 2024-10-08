import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/auth/join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/auth/join/screens/join_membership_screen_4.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/director/provider/director_provider.dart';
import 'package:lyc_flutter_project/director/repository/director_repository.dart';
import 'package:lyc_flutter_project/feed/provider/feed_provider.dart';
import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
import 'package:lyc_flutter_project/feed/repository/weather_repository.dart';
import 'package:lyc_flutter_project/home/provider/home_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/review_provider.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/posting/provider/posting_detail_provider.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/repository/setting_repository.dart';
import 'package:provider/provider.dart';
import 'package:lyc_flutter_project/auth/find_pw/provider/FindPwProvider.dart';
import 'package:lyc_flutter_project/auth/find_id/Provider/SendEmailProvider.dart';
import 'package:lyc_flutter_project/auth/find_id/Provider/findIdProvider.dart';
import 'package:lyc_flutter_project/auth/service/StorageService.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DioProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MypageRepositoryProvider(
            dio: context.read<DioProvider>().dio,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(
            Provider.of<DioProvider>(context, listen: false),
            context.read<MypageRepositoryProvider>().mypageRepository,
          ),
        ),
        ChangeNotifierProvider(create: (context) => MembershipState()),
        ChangeNotifierProvider(
          create: (context) => ClothesRepositoryProvider(dio: context.read<DioProvider>().dio),
        ),
        ChangeNotifierProvider(
          create: (context) => CoordiRepositoryProvider(dio: context.read<DioProvider>().dio),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherRepositoryProvider(
            dio: context.read<DioProvider>().dio,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedRepositoryProvider(
            dio: context.read<DioProvider>().dio,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedProvider(
            weatherRepositoryProvider: context.read<WeatherRepositoryProvider>(),
            feedRepositoryProvider: context.read<FeedRepositoryProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            feedRepositoryProvider: context.read<FeedRepositoryProvider>(),
          ),
        ),
        ChangeNotifierProxyProvider<MypageRepositoryProvider, MypageProviderFactory>(
          create: (context) => MypageProviderFactory(
            mypageRepositoryProvider: context.read<MypageRepositoryProvider>(),
          ),
          update: (context, value, previous) => previous ?? MypageProviderFactory(
            mypageRepositoryProvider: value,
          ),
        ),
        ChangeNotifierProxyProvider2<MypageRepositoryProvider, CoordiRepositoryProvider, PostingDetailProviderFactory>(
          create: (context) => PostingDetailProviderFactory(
            mypageRepositoryProvider: Provider.of<MypageRepositoryProvider>(context, listen: false),
            coordiRepositoryProvider: Provider.of<CoordiRepositoryProvider>(context, listen: false),
          ),
          update: (context, mypageRepositoryProvider, postingRepositoryProvider, previous) =>
          previous ?? PostingDetailProviderFactory(
            mypageRepositoryProvider: mypageRepositoryProvider,
            coordiRepositoryProvider: postingRepositoryProvider,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingRepositoryProvider(dio: context.read<DioProvider>().dio),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingProvider(
            repositoryProvider: Provider.of<SettingRepositoryProvider>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => DirectorRepositoryProvider(dio: context.read<DioProvider>().dio),
        ),
        ChangeNotifierProvider(
          create: (context) => DirectorProvider(
            repositoryProvider: context.read<DirectorRepositoryProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ReviewProvider(
            coordiRepositoryProvider: context.read<CoordiRepositoryProvider>(),
            loginProvider: context.read<LoginProvider>(),
            mypageRepositoryProvider: context.read<MypageRepositoryProvider>(),
          ),
        ),
        Provider<StorageService>(
          create: (context) => StorageService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SendEmailProvider(
            Provider.of<DioProvider>(context, listen: false),
            context.read<StorageService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FindIdProvider(
            context.read<DioProvider>(),
            context.read<SendEmailProvider>(),
            context.read<StorageService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FindPwProvider(
            Provider.of<DioProvider>(context, listen: false),
            context.read<StorageService>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      title: 'Lead Your Closet',
      debugShowCheckedModeBanner: false,
    );
  }
}