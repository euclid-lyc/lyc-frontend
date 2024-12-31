import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';
import 'package:lyc_flutter_project/routes/route_info.dart';

import '../auth/join/screens/login_screen.dart';

final routes = {
  "/": (BuildContext context) => const SplashScreen(),
  "/login": (BuildContext context) => LoginScreen(),
};

class Routes {
  // splash
  static const RouteInfo splash = RouteInfo(
    name: '/splash',
    path: '/splash',
  );

  // auth
  static const RouteInfo findId1 = RouteInfo(
    name: '/auth/find_id/1',
    path: '/auth/find_id/1',
  );

  static const RouteInfo findId2 = RouteInfo(
    name: '/auth/find_id/2',
    path: '/auth/find_id/2',
  );

  static const RouteInfo findId3 = RouteInfo(
    name: '/auth/find_id/3',
    path: '/auth/find_id/3',
  );

  static const RouteInfo findPassword1 = RouteInfo(
    name: '/auth/find_pw/1',
    path: '/auth/find_pw/1',
  );

  static const RouteInfo findPassword2 = RouteInfo(
    name: '/auth/find_pw/2',
    path: '/auth/find_pw/2',
  );

  static const RouteInfo findPassword3 = RouteInfo(
    name: '/auth/find_pw/3',
    path: '/auth/find_pw/3',
  );

  static const RouteInfo findPassword4 = RouteInfo(
    name: '/auth/find_pw/4',
    path: '/auth/find_pw/4',
  );

  static const RouteInfo join1 = RouteInfo(
    name: '/auth/join/1',
    path: '/auth/join/1',
  );

  static const RouteInfo join2 = RouteInfo(
    name: '/auth/join/2',
    path: '/auth/join/2',
  );

  static const RouteInfo join3 = RouteInfo(
    name: '/auth/join/3',
    path: '/auth/join/3',
  );

  static const RouteInfo join4 = RouteInfo(
    name: '/auth/join/4',
    path: '/auth/join/4',
  );

  static const RouteInfo join5 = RouteInfo(
    name: '/auth/join/5',
    path: '/auth/join/5',
  );

  static const RouteInfo join6 = RouteInfo(
    name: '/auth/join/6',
    path: '/auth/join/6',
  );

  static const RouteInfo join7 = RouteInfo(
    name: '/auth/join/7',
    path: '/auth/join/7',
  );

  static const RouteInfo login = RouteInfo(
    name: '/auth/login',
    path: '/auth/login',
  );

  // home
  static const RouteInfo home = RouteInfo(
    name: '/home',
    path: '/home',
  );

  // feed
  static const RouteInfo feed = RouteInfo(
    name: '/feed',
    path: '/feed',
  );

  // director
  static const RouteInfo director = RouteInfo(
    name: '/director',
    path: '/director',
  );

  // mypage
  static const RouteInfo mypage = RouteInfo(
    name: '/mypage',
    path: '/mypage',
  );

  static const RouteInfo attendance = RouteInfo(
    name: '/mypage/attendance',
    path: '/mypage/attendance',
  );

  static const RouteInfo stamp = RouteInfo(
    name: '/mypage/stamp',
    path: '/mypage/stamp',
  );

  static const RouteInfo follow = RouteInfo(
    name: '/mypage/follow',
    path: '/mypage/follow',
  );

  // mypage-review
  static const RouteInfo review = RouteInfo(
    name: '/mypage/review',
    path: '/mypage/review',
  );

  static const RouteInfo reviewList = RouteInfo(
    name: '/mypage/review/list',
    path: '/mypage/review/list',
  );

  // setting
  static const RouteInfo setting = RouteInfo(
    name: '/setting',
    path: '/setting',
  );

  static const RouteInfo info = RouteInfo(
    name: '/setting/info',
    path: '/setting/info',
  );

  static const RouteInfo style = RouteInfo(
    name: '/setting/style',
    path: '/setting/style',
  );

  static const RouteInfo alarm = RouteInfo(
    name: '/setting/alarm',
    path: '/setting/alarm',
  );

  static const RouteInfo block = RouteInfo(
    name: '/setting/block',
    path: '/setting/block',
  );

  static const RouteInfo withdrawal = RouteInfo(
    name: '/setting/withdrawal',
    path: '/setting/withdrawal',
  );

}