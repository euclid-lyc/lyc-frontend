import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';

class DioProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  DioProvider() {
    _dio.interceptors.add(CustomInterceptor(_storage));
    _dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, responseHeader: true));
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Dio get dio => _dio;

  FlutterSecureStorage get storage => _storage;
}

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor(this.storage);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    print("[REQ] [${options.method}] ${options.uri}");

    // 토큰을 Authorization 헤더에 추가
    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');
    }

    final token = await storage.read(key: ACCESS_TOKEN);
    options.headers.addAll({
      "authorization": "Bearer $token",
    });

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken');

      /* final token = await storage.read(key: REFRESH_TOKEN);
    options.headers.addAll({
       'authorization': 'Bearer $token',
    });*/
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {


    print(
        "[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}");

    // ApiResponse 객체 생성
    final apiResponse = ApiResponse<Map<String, dynamic>>(
      code: response.data['code'],
      message: response.data['message'],
      result: response.data['result'],
      isSuccess: response.data['isSuccess'],
      headers: response.headers.map, // 응답 헤더를 ApiResponse에 포함
    );

    // ApiResponse에서 필요한 데이터를 추출하여 새로운 Response 객체 생성
    final newResponseData = {
      'code': apiResponse.code,
      'message': apiResponse.message,
      'result': apiResponse.result,
      'isSuccess': apiResponse.isSuccess,
    };

    final newResponse = Response<Map<String, dynamic>>(
      requestOptions: response.requestOptions,
      data: newResponseData,
      headers: response.headers,
      statusCode: response.statusCode,
    );

    handler.next(newResponse);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("[ERR] [${err.message}]");

    // 에러 응답 처리 (예: 토큰 만료 시 재시도 로직 추가 가능)
    handler.next(err);
  }
}
