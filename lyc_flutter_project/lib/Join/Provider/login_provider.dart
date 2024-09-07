import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:lyc_flutter_project/Join/repository/Credential.dart';
import 'package:lyc_flutter_project/Join/repository/login_repository.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/mypage/screen/my_page_screen.dart';
import '../../common/dio/dio.dart';
import '../Screens/login_screen.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository loginRepository;
  final FlutterSecureStorage storage;

  bool _isLoading = false;
  bool _isLoggedIn = false;
  int? _memberId;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  int? get memberId => _memberId;

  LoginProvider({
    required this.loginRepository,
    required this.storage,
  });

  Future<void> login(String id, String pw, BuildContext context) async {
    _setLoading(true);
    try {
      final dioProvider = Provider.of<DioProvider>(context, listen: false);
      final apiResponse = await loginRepository.login(
        Credential(loginId: id, loginPw: pw),

      );

      print('API Response: ${apiResponse.toJson((value) => value)}');

      final headers = apiResponse.headers ?? {};
      final refreshToken = headers['refresh-token']?.first;
      final accessToken = headers['access-token']?.first;

      print('Access Token: $accessToken');
      print('Refresh Token: $refreshToken');

      if (apiResponse.isSuccess) {
        final result = apiResponse.result;
        final memberId = result['memberId'];

        print('Received Refresh Token: $refreshToken');
        print('Received Access Token: $accessToken');
        print('Received Member ID: $memberId');

        await storage.write(key: refreshTokenKey, value: refreshToken ?? '');
        await storage.write(key: accessTokenKey, value: accessToken ?? '');

        final storedRefreshToken = await storage.read(key: refreshTokenKey);
        final storedAccessToken = await storage.read(key: accessTokenKey);

        print('Stored Access Token: $storedAccessToken');
        print('Stored Refresh Token: $storedRefreshToken');

        _isLoggedIn = true;
        _memberId = memberId;
        notifyListeners();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyPageScreen(memberId: _memberId ?? 0),
          ),
        );
      } else {
        _showErrorDialog(context, '로그인 실패', apiResponse.message);
      }
    } catch (e) {
      print('Error: $e');
      if (e is DioException && e.response?.statusCode == 401) {
        _showErrorDialog(context, '로그인 실패', '액세스 토큰이 만료되었습니다.');

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        _showErrorDialog(context, '로그인 실패', '아이디 또는 비밀번호가 잘못되었습니다.');
      }
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    try {
      await storage.delete(key: refreshTokenKey);
      await storage.delete(key: accessTokenKey);
      _isLoggedIn = false;
      _memberId = null;
      notifyListeners();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } catch (e) {
      print("Error in logout: $e");
    }
  }

  Future<void> checkLoginStatus() async {
    final refreshToken = await storage.read(key: refreshTokenKey);
    final accessToken = await storage.read(key: accessTokenKey);

    if (refreshToken != null && accessToken != null) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
      _memberId = null;
    }
    notifyListeners();
  }
}
