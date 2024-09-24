import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyc_flutter_project/Join/model/Credential.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/mypage/model/profile.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';

class LoginProvider extends ChangeNotifier {
  final DioProvider dioProvider;
  late final Dio dio;
  late final FlutterSecureStorage storage;
  final MypageRepository mypageRepository;

  bool _isLoading = false;
  bool _isLoggedIn = false;
  int? _memberId;

  Profile? _profile;
  bool _hasProfile = false;

  static const String memberIdKey = 'jaskfjajesfn';

  get profile => _profile;

  get hasProfile => _hasProfile;

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _isLoggedIn;

  int? get memberId => _memberId;

  LoginProvider(
    this.dioProvider,
    this.mypageRepository,
  ) {
    dio = dioProvider.dio;
    storage = dioProvider.storage;
    _loadMemberId();
  }

  Future<void> _loadMemberId() async {
    final storedMemberId = await storage.read(key: memberIdKey);
    if (storedMemberId != null) {
      _memberId = int.parse(storedMemberId);
      notifyListeners();
    }
  }

  Future<void> _saveMemberId(int memberId) async {
    await storage.write(key: memberIdKey, value: memberId.toString());
    _memberId = memberId;
    notifyListeners();
  }

  Future<bool> getProfile() async {
    if (_memberId == null) return false;

    try {
      final resp = await mypageRepository.getProfile(memberId: _memberId!);

      if (resp.isSuccess) {
        _profile = resp.result;
        _hasProfile = true;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("getProfile 에러 발생: $e");
      return false;
    }
  }

  Future<void> login(String id, String pw, BuildContext context) async {
    _setLoading(true);
    try {
      final requestBody = Credential(loginId: id, loginPw: pw);

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
      if (response.statusCode == 200) {
        final headers = response.headers;
        final refreshToken = headers.value("refresh-token") ?? '';
        final accessToken = headers.value("access-token") ?? '';
        final responseData = response.data as Map<String, dynamic>;
        final result = responseData["result"] as Map<String, dynamic>;
        final memberId = result["memberId"];

        await storage.write(key: refreshTokenKey, value: refreshToken);
        await storage.write(key: accessTokenKey, value: accessToken);
        await _saveMemberId(memberId);

        _isLoggedIn = true;
        notifyListeners();
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

  Future<void> logout() async {
    try {
      final resp = await dio.post(
        'http://$ip/lyc/auths/sign-out',
        options: Options(headers: {"accessToken": "true"}),
      );
      if (resp.statusCode == 200) {
        await storage.delete(key: refreshTokenKey);
        await storage.delete(key: accessTokenKey);
        await storage.delete(key: memberIdKey);
        _isLoggedIn = false;
        _memberId = null;
        _profile = null;
        _hasProfile = false;
        notifyListeners();
      }
    } catch (e) {
      print("Error in logout: $e");
    }
  }

  Future<void> checkLoginStatus() async {
    final refreshToken = await storage.read(key: refreshTokenKey);
    final accessToken = await storage.read(key: accessTokenKey);
    final storedMemberId = await storage.read(key: memberIdKey);

    if (refreshToken != null && accessToken != null && storedMemberId != null) {
      _isLoggedIn = true;
      _memberId = int.parse(storedMemberId);
    } else {
      _memberId = null;
      _isLoggedIn = false;
    }
    notifyListeners();
  }
}
