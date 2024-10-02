import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../Service/StorageService.dart';
import '../model/VerificationCode.dart';
import 'SendEmailProvider.dart';

class FindIdProvider extends ChangeNotifier {
  final DioProvider dioProvider;
  late final Dio dio;
  final StorageService storageService; // StorageService를 주입받음
  final SendEmailProvider sendEmailProvider;

  bool _isLoading = false; // 로딩 상태
  String? _errorMessage; // 오류 메시지

  FindIdProvider(this.dioProvider, this.sendEmailProvider, this.storageService) {
    dio = dioProvider.dio;
  }

  bool get isLoading => _isLoading; // 로딩 상태 getter
  String? get errorMessage => _errorMessage; // 오류 메시지 getter

  // 인증 코드 전송
  Future<void> sendVerification({
    required String name,
    required String email,
    required String verificationCode,
  }) async {
    final url = 'http://$ip/lyc/auths/find-id';

    _isLoading = true; // 로딩 시작
    notifyListeners(); // UI 업데이트

    try {

      final tempToken = await storageService.read('temp-token');

      if (tempToken == null) {
        _errorMessage = '토큰이 없습니다.'; // 오류 메시지 설정
        print(_errorMessage);
        throw Exception(_errorMessage);
      }


      final options = Options(headers: {
        'accept': '*/*',
        'Authorization': "Bearer $tempToken",
        'Content-Type': 'application/json',
      });

      final verificationCodeRequest = VerificationCode(
        name: name,
        email: email,
        verificationCode: verificationCode,
      );

      print('Request Body: ${verificationCodeRequest.toJson()}');
      print("요청 헤더: ${options.headers}");
      final response = await dio.post(
        url,
        data: verificationCodeRequest.toJson(),
        options: options,
      );

      if (response.statusCode == 200) {
        // 인증 성공 처리
      final responseBody = response.data;
      String loginId = responseBody["result"]["loginId"]; // 예시
      await storageService.write('loginId', loginId);

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
      _isLoading = false; // 로딩 종료
      notifyListeners(); // UI 업데이트
    }
  }
}
