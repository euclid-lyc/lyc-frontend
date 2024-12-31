import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lyc_flutter_project/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:lyc_flutter_project/auth/join/Provider/login_provider.dart' show LoginProvider;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkTokenAndNavigate();
    });
  }

  checkTokenAndNavigate() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    await loginProvider.checkLoginStatus();
    if (!mounted) return;

    if (!loginProvider.isLoggedIn) {
      context.goNamed(Routes.login.name);
      return;
    }

    try {
      final success = await loginProvider.getProfile();
      if (!mounted) return;

      if (success || loginProvider.hasProfile) {
        context.goNamed(Routes.home.name);
      } else {
        context.goNamed(Routes.login.name);
      }
    } catch (e) {
      if (!mounted) return;
      context.goNamed(Routes.login.name);
    }
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
