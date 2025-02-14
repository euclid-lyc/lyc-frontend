import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import '../../service/storage_service.dart';
import '../model/info.dart';
import 'package:lyc_flutter_project/config/secret.dart';

import '../repository/find_pw_repository.dart';

class FindPwProvider extends ChangeNotifier {
  final DioProvider dioProvider;
  final Dio dio;
  final StorageService storageService;
  final FindPwRepositoryProvider findPwRepositoryProvider;
  final storage = DioProvider().storage;

  bool _isLoading = false;
  String? _errorMessage;

  String? _name;
  String? _email;
  String? _id;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  FindPwProvider(
      {required this.dioProvider,
      required this.dio,
      required this.storageService,
      required this.findPwRepositoryProvider});

  String get name => _name ?? '';

  String get id => _id ?? '';

  String get email => _email ?? '';

  set name(String value) => _name = value;

  set id(String value) => _id = value;

  set email(String value) => _email = value;

  Future<void> getVerificationCode() async {
    _isLoading = true;
    notifyListeners();

    try {
      final resp = await findPwRepositoryProvider.getVerificationCode(
          info: Info(name: name, loginId: id, email: email));

      if (resp.statusCode == 200) {
        final headers = resp.headers;
        await storageService.write(
            tempTokenKey, headers.value('temp-token') ?? '');
      } else {
        throw Exception('Verification code request failed: ${resp.statusCode}');
      }
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      if (e.response != null) {
        debugPrint('Response data: ${e.response?.data}');
      }
      throw Exception('API 요청 실패: ${e.message}');
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
      throw Exception('API 요청 실패: ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  // 인증 코드 전송
  Future<void> checkVerificationCode(String code) async {
    _isLoading = true;
    notifyListeners();

    try {
      final tempToken = await storageService.read(tempTokenKey);

      if (tempToken == null) {
        debugPrint('토큰이 존재하지 않습니다.');
        throw Exception(_errorMessage);
      }

      final resp = await findPwRepositoryProvider.findPwRepository
          .checkVerificationCode(authHeader: "Bearer $tempToken", code: code);

      if (resp.isSuccess) {
        storage.write(key: 'verificationCode', value: code);
        _isLoading = false;
      } else {
        _errorMessage = 'Verification failed with status: ${resp.code}';
        throw Exception(_errorMessage);
      }
    } on DioException catch (e) {
      _errorMessage = 'DioException: ${e.message}';
      debugPrint(_errorMessage);
      if (e.response != null) {
        debugPrint('Response data: ${e.response?.data}');
      }
      throw Exception('API 요청 실패: ${e.message}');
    } catch (e) {
      _errorMessage = 'Error: ${e.toString()}';
      debugPrint(_errorMessage);
      throw Exception('API 요청 실패: ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePw({
    required String pw,
    required String confirmPw,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final tempToken = await storageService.read(tempTokenKey);
      final code = await storage.read(key: 'verificationCode');
      if (tempToken == null) {
        _errorMessage = '토큰이 없습니다.';
        debugPrint(_errorMessage);
        _isLoading = false;
        notifyListeners();
        return;
      }

      final resp = await findPwRepositoryProvider.updatePw(
        authHeader: "Bearer $tempToken",
        body: {
          "loginId": id,
          "password": pw,
          "passwordConfirmation": confirmPw,
          "verificationCode": code!,
        },
      );

      if (resp.statusCode == 200) {
        _isLoading = false;
      } else {
        throw Exception('request failed: ${resp.statusCode}');

      }
    } on DioException catch (e) {
      _errorMessage = 'DioException: ${e.message}';
      debugPrint(_errorMessage);
      throw Exception('API 요청 실패: ${e.message}');
    } catch (e) {
      _errorMessage = 'Error: ${e.toString()}';
      debugPrint(_errorMessage);
      throw Exception('API 요청 실패: ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
