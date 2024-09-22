import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/Join/Screens/login_screen.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';
import 'package:lyc_flutter_project/mypage/screen/mypage_screen.dart';

final routes = {
  "/": (BuildContext context) => const SplashScreen(),
  "/login": (BuildContext context) => LoginScreen(),
};