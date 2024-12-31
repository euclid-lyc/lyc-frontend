import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import '../../service/storage_service.dart';
import '../model/info.dart';
import 'package:lyc_flutter_project/config/secret.dart';

class SendEmailProvider extends ChangeNotifier {
  final DioProvider dioProvider;
  late final Dio dio;
  final StorageService storageService;
  final storage = DioProvider().storage;
  Info? _info;

  SendEmailProvider(this.dioProvider, this.storageService) {
    dio = dioProvider.dio;
  }

  String get name => _info?.name ?? '';

  String get email => _info?.email ?? '';

  Future<void> getVerificationCode({required Info info}) async {
    const url = 'http://$ip/lyc/auths/sign-in/find-id/send-verification-code';
    _info = info;

    try {

      final requestBody = info.toJson();

      final response = await dio.post(url, data: requestBody);

      if (response.statusCode == 200) {
        final headers = response.headers;
        final tempToken = headers.value(tempTokenKey) ?? '';
        await storageService.write(
            tempTokenKey, tempToken);


      } else {
        throw Exception(
            'Verification code request failed: ${response.statusCode}');
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
}
