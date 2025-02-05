import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/auth/find_id/model/info.dart';
import 'package:lyc_flutter_project/auth/find_id/repository/find_id_repository.dart';
import '../../../common/dio/dio.dart';
import '../../service/storage_service.dart';
import '../model/verification_code.dart';
import 'package:lyc_flutter_project/config/secret.dart';

class FindIdProvider extends ChangeNotifier {
  final DioProvider dioProvider;
  final Dio dio;
  final StorageService storageService;
  final FindIdRepositoryProvider findIdRepositoryProvider;
  final storage = DioProvider().storage;

  String? _name;
  String? _email;
  bool _isLoading = false;
  String? _errorMessage;

  FindIdProvider({
    required this.dioProvider,
    required this.storageService,
    required this.dio,
    required this.findIdRepositoryProvider,
  });

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  String get name => _name ?? '';

  String get email => _email ?? '';

  set name(String value) => _name = value;

  set email(String value) => _email = value;

  Future<void> getVerificationCode() async {
    _isLoading = true;
    notifyListeners();

    try {
      final resp = await findIdRepositoryProvider.getVerificationCode(
          info: Info(name: name, email: email));

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
    }
  }

  // 인증 코드 확인
  Future<String> checkVerificationCode(String code) async {
    _isLoading = true;
    notifyListeners();

    try {
      final tempToken = await storageService.read(tempTokenKey);

      if (tempToken == null) {
        debugPrint('토큰이 존재하지 않습니다.');
        throw Exception(_errorMessage);
      }

      final verificationCodeRequest = VerificationCode(
        name: name,
        email: email,
        verificationCode: code,
      );

      final resp = await findIdRepositoryProvider.findIdRepository
          .checkVerificationCode(
              authHeader: "Bearer $tempToken",
              verificationCode: verificationCodeRequest);

      if (resp.isSuccess) {
        return resp.result.loginId;
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
    }
  }
}
