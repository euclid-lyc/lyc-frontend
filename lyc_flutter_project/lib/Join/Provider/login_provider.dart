// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:lyc_flutter_project/common/const/data.dart';
// import 'package:lyc_flutter_project/mypage/screen/my_page_screen.dart';
// import '../Screens/login_screen.dart';
//
// class LoginProvider extends ChangeNotifier {
//   final Dio dio;
//   final FlutterSecureStorage storage;
//
//   bool _isLoading = false;
//   bool _isLoggedIn = false;
//   int? _memberId;
//
//   bool get isLoading => _isLoading;
//   bool get isLoggedIn => _isLoggedIn;
//   int? get memberId => _memberId;
//
//   LoginProvider({
//     required this.dio,
//     required this.storage,
//   });
//
//   Future<void> login(String id, String pw, BuildContext context) async {
//     _setLoading(true);
//     try {
//       final response = await dio.post(
//         'http://$ip/lyc/auths/sign-in',
//         data: {
//           'loginId': id,
//           'loginPw': pw,
//         },
//         options: Options(
//           headers: {'Content-Type': 'application/json',
//           'accept':'*/*'},
//         ),
//       );
//       print('Response Headers: ${response.headers}');
//       print('Access Token: ${response.headers.value('access-token')}');
//       print('Refresh Token: ${response.headers.value('refresh-token')}');
//
//       if (response.statusCode == 200) {
//         final headers = response.headers;
//         final refreshToken = headers.value("refresh-token") ?? '';
//         final accessToken = headers.value("access-token") ?? '';
//         final result = response.data as Map<String, dynamic>;
//         final memberId = result["memberId"];
//
//         // Token을 저장합니다.
//         if (refreshToken != null) {
//           await storage.write(key: refreshTokenKey, value: refreshToken);
//         }
//         if (accessToken != null) {
//           await storage.write(key: accessTokenKey, value: accessToken);
//         }
//
//         _isLoggedIn = true;
//         _memberId = memberId;
//         notifyListeners();
//
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => MyPageScreen(memberId: _memberId ?? 0),
//           ),
//         );
//       } else {
//         _showErrorDialog(context, '로그인 실패', 'API 요청이 실패했습니다.');
//       }
//     } catch (e) {
//       print('Error: $e');
//       if (e is DioException) {
//         if (e.response?.statusCode == 401) {
//           _showErrorDialog(context, '로그인 실패', '로그인 정보가 잘못되었습니다.');
//         } else {
//           _showErrorDialog(context, '로그인 실패', '서버와의 통신에 문제가 발생했습니다.');
//         }
//       } else {
//         _showErrorDialog(context, '로그인 실패', '알 수 없는 오류가 발생했습니다.');
//       }
//     } finally {
//       _setLoading(false);
//     }
//   }
//
//   void _setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   void _showErrorDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('확인'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<void> logout(BuildContext context) async {
//     try {
//       await storage.delete(key: refreshTokenKey);
//       await storage.delete(key: accessTokenKey);
//       _isLoggedIn = false;
//       _memberId = null;
//       notifyListeners();
//
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => LoginScreen(),
//         ),
//       );
//     } catch (e) {
//       print("Error in logout: $e");
//     }
//   }
//
//   Future<void> checkLoginStatus() async {
//     final refreshToken = await storage.read(key: refreshTokenKey);
//     final accessToken = await storage.read(key: accessTokenKey);
//
//     if (refreshToken != null && accessToken != null) {
//       _isLoggedIn = true;
//     } else {
//       _isLoggedIn = false;
//       _memberId = null;
//     }
//     notifyListeners();
//   }
// }
import 'dart:convert'; // 추가
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/mypage/screen/my_page_screen.dart';
import '../Screens/login_screen.dart';

class LoginProvider extends ChangeNotifier {
  final Dio dio;
  final FlutterSecureStorage storage;

  bool _isLoading = false;
  bool _isLoggedIn = false;
  int? _memberId;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  int? get memberId => _memberId;

  LoginProvider({
    required this.dio,
    required this.storage,
  });

  Future<void> login(String id, String pw, BuildContext context) async {
    _setLoading(true);
    try {

      final requestBody = {
        'loginId': id,
        'loginPw': pw,
      };

      final response = await dio.post(
        'http://$ip/lyc/auths/sign-in',
        data: requestBody,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'accept': '*/*',
          },
        ),
      );
      print('Response Headers: ${response.headers}');
      print('Access Token: ${response.headers.value('access-token')}');
      print('Refresh Token: ${response.headers.value('refresh-token')}');

      if (response.statusCode == 200) {
        final headers = response.headers;
        final refreshToken = headers.value("refresh-token") ?? '';
        final accessToken = headers.value("access-token") ?? '';
        final result = response.data as Map<String, dynamic>;
        final memberId = result["memberId"];


        if (refreshToken != null) {
          await storage.write(key: refreshTokenKey, value: refreshToken);
        }
        if (accessToken != null) {
          await storage.write(key: accessTokenKey, value: accessToken);
        }

        _isLoggedIn = true;
        _memberId = memberId;
        notifyListeners();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyPageScreen(memberId: _memberId ?? 0),
          ),
        );
      } else {
        _showErrorDialog(context, '로그인 실패', 'API 요청이 실패했습니다.');
      }
    } catch (e) {
      print('Error: $e');
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          _showErrorDialog(context, '로그인 실패', '로그인 정보가 잘못되었습니다.');
        } else {
          _showErrorDialog(context, '로그인 실패', '서버와의 통신에 문제가 발생했습니다.');
        }
      } else {
        _showErrorDialog(context, '로그인 실패', '알 수 없는 오류가 발생했습니다.');
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
