import 'package:go_router/go_router.dart';
import 'package:lyc_flutter_project/auth/find_id/screens/find_id_screen_1.dart';
import 'package:lyc_flutter_project/auth/find_id/screens/find_id_screen_2.dart';
import 'package:lyc_flutter_project/auth/find_id/screens/find_id_screen_3.dart';
import 'package:lyc_flutter_project/auth/join/screens/login_screen.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';
import 'package:lyc_flutter_project/director/screen/director_search_screen.dart';
import 'package:lyc_flutter_project/feed/screen/feed_screen.dart';
import 'package:lyc_flutter_project/home/screen/home_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/mypage_screen.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:lyc_flutter_project/setting/screen/setting_screen.dart';

final router = GoRouter(
  initialLocation: Routes.splash.name,
  routes: [
    // auth
    GoRoute(
      path: Routes.login.path,
      name: Routes.login.name,
      pageBuilder: (context, state) => NoTransitionPage(
        child: LoginScreen(),
      ),
      routes: [
        GoRoute(
          path: Routes.findId1.path,
          name: Routes.findId1.name,
          pageBuilder: (context, state) => NoTransitionPage(
            child: FindIdScreen1(),
          ),
        ),
        GoRoute(
          path: Routes.findId2.path,
          name: Routes.findId2.name,
          pageBuilder: (context, state) => NoTransitionPage(
            child: FindIdScreen2(),
          ),
        ),
        GoRoute(
          path: Routes.findId3.path,
          name: Routes.findId3.name,
          pageBuilder: (context, state) => NoTransitionPage(
            child: FindIdScreen3(
              loginId: state.extra as String,
            ),
          ),
        ),
      ],
    ),

    GoRoute(
      path: Routes.splash.path,
      name: Routes.splash.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashScreen(),
      ),
    ),
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: Routes.feed.path,
      name: Routes.feed.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: FeedScreen(),
      ),
    ),
    GoRoute(
      path: Routes.mypage.path,
      name: Routes.mypage.name,
      pageBuilder: (context, state) => NoTransitionPage(
        child: MypageScreen(
          extra: state.extra as Map<int?, bool>,
        ),
      ),
    ),
    GoRoute(
      path: Routes.director.path,
      name: Routes.director.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: DirectorSearchScreen(),
      ),
    ),
    GoRoute(
      path: Routes.setting.path,
      name: Routes.setting.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SettingScreen(),
      ),
    )
  ],
);
