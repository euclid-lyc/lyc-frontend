// import 'package:flutter/material.dart';
// import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
// import 'package:lyc_flutter_project/common/dio/dio.dart';
// import 'package:lyc_flutter_project/feed/provider/feed_provider.dart';
// import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
// import 'package:lyc_flutter_project/feed/repository/weather_repository.dart';
// import 'package:lyc_flutter_project/home/provider/home_provider.dart';
// import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
// import 'package:lyc_flutter_project/posting/provider/posting_detail_provider.dart';
// import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';
// import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';
// import 'package:lyc_flutter_project/routes/routes.dart';
// import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
// import 'package:lyc_flutter_project/setting/repository/setting_repository.dart';
// import 'package:provider/provider.dart';
// import 'Join/screens/join_membership_screen_4.dart';
// import 'findID/Provider/findIdProvider.dart';
// import 'findID/Provider/SendEmailProvider.dart';
//
// void main() {
//   Provider.debugCheckInvalidValueType = null;
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => DioProvider(),
//         ),
//         ChangeNotifierProvider(create: (context) => MembershipState()),
//         ChangeNotifierProvider(
//           create: (context) =>
//               ClothesRepositoryProvider(dio: context.read<DioProvider>().dio),
//         ),
//         ChangeNotifierProvider(
//           create: (context) =>
//               CoordiRepositoryProvider(dio: context.read<DioProvider>().dio),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => WeatherRepositoryProvider(
//             dio: context.read<DioProvider>().dio,
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => FeedProvider(
//             weatherRepositoryProvider:
//                 context.read<WeatherRepositoryProvider>(),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => FeedRepositoryProvider(
//             dio: context.read<DioProvider>().dio,
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => HomeProvider(
//             feedRepositoryProvider: context.read<FeedRepositoryProvider>(),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => MypageRepositoryProvider(
//             dio: context.read<DioProvider>().dio,
//           ),
//         ),
//         ChangeNotifierProxyProvider2<MypageRepositoryProvider,
//             CoordiRepositoryProvider, PostingDetailProviderFactory>(
//           create: (context) => PostingDetailProviderFactory(
//             mypageRepositoryProvider:
//                 Provider.of<MypageRepositoryProvider>(context, listen: false),
//             coordiRepositoryProvider:
//                 Provider.of<CoordiRepositoryProvider>(context, listen: false),
//           ),
//           update: (context, mypageRepositoryProvider, postingRepositoryProvider,
//                   previous) =>
//               previous ??
//               PostingDetailProviderFactory(
//                 mypageRepositoryProvider: mypageRepositoryProvider,
//                 coordiRepositoryProvider: postingRepositoryProvider,
//               ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => LoginProvider(
//             Provider.of<DioProvider>(
//               context,
//               listen: false,
//             ),
//             context.read<MypageRepositoryProvider>().mypageRepository,
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) =>
//               SettingRepositoryProvider(dio: context.read<DioProvider>().dio),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => SettingProvider(
//             repositoryProvider: Provider.of<SettingRepositoryProvider>(
//               context,
//               listen: false,
//             ),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => SendEmailProvider(
//             Provider.of<DioProvider>(
//               context,
//               listen: false,
//             ),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => FindIdProvider(
//             context.read<DioProvider>(), // DioProvider 전달
//             context.read<SendEmailProvider>(), // SendEmailProvider 전달
//           ),
//         ),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: routes,
//       title: 'Lead Your Closet',
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/feed/provider/feed_provider.dart';
import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
import 'package:lyc_flutter_project/feed/repository/weather_repository.dart';
import 'package:lyc_flutter_project/home/provider/home_provider.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/posting/provider/posting_detail_provider.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:lyc_flutter_project/setting/repository/setting_repository.dart';
import 'package:provider/provider.dart';
import 'Join/screens/join_membership_screen_4.dart';
import 'find_id/Provider/findIdProvider.dart';
import 'find_id/Provider/SendEmailProvider.dart';
import 'find_id/Service/StorageService.dart';

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
        ChangeNotifierProxyProvider2<MypageRepositoryProvider,
            CoordiRepositoryProvider, PostingDetailProviderFactory>(
          create: (context) => PostingDetailProviderFactory(
            mypageRepositoryProvider:
                Provider.of<MypageRepositoryProvider>(context, listen: false),
            coordiRepositoryProvider:
                Provider.of<CoordiRepositoryProvider>(context, listen: false),
          ),
          update: (context, mypageRepositoryProvider, postingRepositoryProvider,
                  previous) =>
              previous ??
              PostingDetailProviderFactory(
                mypageRepositoryProvider: mypageRepositoryProvider,
                coordiRepositoryProvider: postingRepositoryProvider,
              ),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(
            Provider.of<DioProvider>(
              context,
              listen: false,
            ),
            context.read<MypageRepositoryProvider>().mypageRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SettingRepositoryProvider(dio: context.read<DioProvider>().dio),
        ),
        Provider<StorageService>(
          create: (context) => StorageService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SendEmailProvider(
            Provider.of<DioProvider>(
              context,
              listen: false,
            ),
            context.read<StorageService>(), // StorageService 전달
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FindIdProvider(
            context.read<DioProvider>(), // DioProvider 전달
            context.read<SendEmailProvider>(), // SendEmailProvider 전달
            context.read<StorageService>(), // StorageService 전달
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
