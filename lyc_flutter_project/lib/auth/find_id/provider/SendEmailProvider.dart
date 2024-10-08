import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import '../../../common/const/data.dart';
import '../../service/StorageService.dart';
import '../model/Info.dart';
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
    final url = 'http://$ip/lyc/auths/sign-in/find-id/send-verification-code';
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
}
