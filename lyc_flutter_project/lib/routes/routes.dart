import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/screen/splash_screen.dart';

import '../auth/join/screens/login_screen.dart';

final routes = {
  "/": (BuildContext context) => const SplashScreen(),
  "/login": (BuildContext context) => LoginScreen(),
};