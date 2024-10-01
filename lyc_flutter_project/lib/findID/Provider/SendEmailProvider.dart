// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:lyc_flutter_project/common/const/data.dart';
// import '../../common/dio/dio.dart';
// import '../model/Info.dart';
//
// class SendEmailProvider extends ChangeNotifier {
//   final DioProvider dioProvider;
//   late final Dio dio;
//   Info? _info;
//
//
//   SendEmailProvider(this.dioProvider) {
//     dio = dioProvider.dio;
//     storage = dioProvider.storage;
//   }
//
//   String get name => _info?.name ?? '';
//
//   String get email => _info?.email ?? '';
//
//   Future<void> getVerificationCode({required Info info}) async {
//     final url = 'http://$ip/lyc/auths/sign-in/find-id/send-verification-code';
//     _info = info;
//     try {
//       Map<String, dynamic> requestBody = info.toJson();
//
//       final response = await dio.post(
//         url,
//         data: requestBody,
//       );
//
//       if (response.statusCode == 200) {
//         final headers = response.headers;
//         final tempToken = headers.value("temp-token") ?? '';
//         await storage.write(key: 'temp-token', value: tempToken);
//         print(tempToken);
//       } else {
//         throw Exception('Verification code request failedㅠㅠ');
//       }
//     } on DioError catch (e) {
//       print('DioError: ${e.message}');
//       throw Exception('API 요청 실패');
//     } catch (e) {
//       print('Error: ${e.toString()}');
//       throw Exception('API 요청 실패');
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import '../../common/const/data.dart';
import '../Service/StorageService.dart';
import '../model/Info.dart';

class SendEmailProvider extends ChangeNotifier {
  final DioProvider dioProvider;
  late final Dio dio;
 final StorageService storageService; // StorageService 추가
  Info? _info;

  SendEmailProvider(this.dioProvider,this.storageService) {
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
        final tempToken = headers.value("temp-token") ?? '';
        print("11111 temp:$tempToken");

        await storageService.write('temp-token', tempToken); // StorageService 사용

        print("2222 temp:$storageService.read('temp-token')");
      } else {
        throw Exception('Verification code request failed: ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('DioError: ${e.message}');
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
