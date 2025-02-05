import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/auth/find_pw/model/verification_info.dart';
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

  FindPwProvider({required this.dioProvider,
    required this.dio,
    required this.storageService,  required this.findPwRepositoryProvider});

  String get name => _name ?? '';

  String get id => _id ?? '';

  String get email => _email ?? '';

  Future<void> getVerificationCode() async {
    try {
      final resp = await findPwRepositoryProvider.findPwRepository
          .getVerificationCode(
          info: Info(name: name, loginId: id, email: email));
      if (resp.isSuccess) {
        final tempToken = resp.headers?[tempTokenKey].toString() ?? '';
        await storageService.write(tempTokenKey, tempToken);
      } else {
        throw Exception(
            'Verification code request failed: ${resp.code}');
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
    }
  }

  // 인증 코드 전송
  Future<void> checkVerification(String code) async {
    _isLoading = true; // 로딩 시작
    notifyListeners(); // UI 업데이트

    try {
      final tempToken = await storageService.read(tempTokenKey);

      if (tempToken == null) {
        debugPrint('토큰이 존재하지 않습니다.');
        throw Exception(_errorMessage);
      }

      final resp = await findPwRepositoryProvider.findPwRepository
          .checkVerificationCode(
          authHeader:  "Bearer $tempToken", code: code);

      if (resp.isSuccess) {
        storage.write(key: 'verificationCode', value: code);
      } else {
        _errorMessage =
        'Verification failed with status: ${resp.code}';
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
    required String code,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final tempToken = await storageService.read(tempTokenKey);

      if (tempToken == null) {
        _errorMessage = '토큰이 없습니다.';
        debugPrint(_errorMessage);
        _isLoading = false;
        notifyListeners();
        return;
      }

      final resp = await findPwRepositoryProvider.findPwRepository.updatePw(
        authHeader: "Bearer $tempToken",
        body: {
          "loginId": id,
          "password": pw,
          "passwordConfirmation": confirmPw,
          "verificationCode": code,
        },
      );

      if (resp.isSuccess) {
        debugPrint("비밀번호 변경 성공");
      } else {
        _errorMessage = resp.message;
        throw Exception(resp.message);
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
