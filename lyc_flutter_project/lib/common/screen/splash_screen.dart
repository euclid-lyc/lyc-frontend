import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/Join/Screens/login_screen.dart';
import 'package:lyc_flutter_project/common/widget/bottom_bar.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      checkTokenAndNavigate();
    }
  }

  void checkTokenAndNavigate() async {
    final loginProvider = Provider.of<LoginProvider>(context);
    final mypageProvider = Provider.of<MypageProvider>(context);
    await loginProvider.checkLoginStatus();
    if (!loginProvider.isLoggedIn) {
      navigateToLogin();
      return;
    }

    try {
      final success = await mypageProvider.getProfile();
      if (success) {
        navigateToHome();
      } else {
        if (mypageProvider.hasProfile) {
          navigateToHome();
        } else {
          navigateToLogin();
        }
      }
    } catch (e) {
      navigateToLogin();
    }
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomBar(),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '유클리드',
              style: TextStyle(
                color: Color(0xff738998),
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Lead Your Closet',
              style: TextStyle(
                color: Color(0xffBBBBBB),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
