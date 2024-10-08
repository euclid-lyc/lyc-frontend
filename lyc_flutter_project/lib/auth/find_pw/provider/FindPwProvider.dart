import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/auth/find_pw/model/VerificationInfo.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import '../../../common/const/data.dart';
import '../../service/StorageService.dart';
import '../model/Info.dart';
import 'package:lyc_flutter_project/config/secret.dart';

class FindPwProvider extends ChangeNotifier {
  final DioProvider dioProvider;
  late final Dio dio;
  final StorageService storageService;
  final storage = DioProvider().storage;
  Info? _info;

  bool _isLoading = false; // 로딩 상태
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  FindPwProvider(this.dioProvider, this.storageService) {
    dio = dioProvider.dio;
  }

  String get name => _info?.name ?? '';

  String get loginId => _info?.loginId ?? '';

  String get email => _info?.email ?? '';

  Future<void> getVerificationCode({required Info info}) async {
    final url = 'http://$ip/lyc/auths/sign-in/find-pw/send-verification-code';
    _info = info;

    try {
      final requestBody = info.toJson();

      final response = await dio.post(url, data: requestBody);

      if (response.statusCode == 200) {
        final headers = response.headers;
        final tempToken = headers.value('temp-token') ?? '';
        await storageService.write(tempTokenKey, tempToken);
        await storage.write(key: 'loginId', value: loginId);
      } else {
        throw Exception(
            'Verification code request failed: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
      }
      throw Exception('API 요청 실패: ${e.message}');
    } catch (e) {
      print('Error: ${e.toString()}');
      throw Exception('API 요청 실패: ${e.toString()}');
    }
  }

  // 인증 코드 전송
  Future<void> sendVerification({
    required String verificationCode,
  }) async {
    final url = 'http://$ip/lyc/auths/find-pw';
    _isLoading = true; // 로딩 시작
    notifyListeners(); // UI 업데이트
    try {
      final tempToken = await storageService.read(tempTokenKey);
      if (tempToken == null) {
        _errorMessage = '임시 토큰을 찾을 수 없습니다.';
        print(_errorMessage);
        throw Exception(_errorMessage);
      }

      final options = Options(headers: {
        'accept': '*/*',
        'Authorization': "Bearer $tempToken",
      });

      final response = await dio.post(url,
          options: options, queryParameters: {'code': verificationCode});

      if (response.statusCode == 200) {
        storage.write(key: 'verificationCode', value: verificationCode);
      } else {
        _errorMessage =
            'Verification failed with status: ${response.statusCode}';
        throw Exception(_errorMessage);
      }
    } on DioException catch (e) {
      _errorMessage = 'DioException: ${e.message}';
      print(_errorMessage);
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
      }
      throw Exception('API 요청 실패: ${e.message}');
    } catch (e) {
      _errorMessage = 'Error: ${e.toString()}';
      print(_errorMessage);
      throw Exception('API 요청 실패: ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners(); // 로딩 완료, UI 업데이트
    }
  }

  Future<void> updatePw({
    required String loginId,
    required String password,
    required String passwordConfirmation,
    required String verificationCode,
  }) async {
    final url = 'http://$ip/lyc/auths/find-pw/update';

    _isLoading = true; // 로딩 시작
    notifyListeners(); // UI 업데이트

    try {

      final tempToken = await storageService.read(tempTokenKey);

      if (tempToken == null) {
        _errorMessage = '토큰이 없습니다.';
        print(_errorMessage);
        throw Exception(_errorMessage);
      }


      final options = Options(headers: {
        'accept': '*/*',
        'Authorization': "Bearer $tempToken",
        'Content-Type': 'application/json',
      });

      final verificationInfoRequest = VerificationInfo(
        loginId: loginId,
        password: password,
        passwordConfirmation: passwordConfirmation,
        verificationCode: verificationCode,
      );

      final response = await dio.patch(
        url,
        data: verificationInfoRequest.toJson(),
        options: options,
      );

      if (response.statusCode == 200) {

      } else {
        _errorMessage = 'Verification failed with status: ${response.statusCode}';
        throw Exception(_errorMessage);
      }
    } on DioException catch (e) {
      _errorMessage = 'DioException: ${e.message}';
      print(_errorMessage);
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
      }
      throw Exception('API 요청 실패: ${e.message}');
    } catch (e) {
      _errorMessage = 'Error: ${e.toString()}';
      print(_errorMessage);
      throw Exception('API 요청 실패: ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners(); // UI 업데이트
    }
  }



}
