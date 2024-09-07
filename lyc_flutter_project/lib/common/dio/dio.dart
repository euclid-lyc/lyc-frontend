import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';

class DioProvider extends ChangeNotifier {
  final Dio _dio = Dio();

  DioProvider() {
    _dio.interceptors.add(CustomInterceptor());
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, responseHeader: true));
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Dio get dio => _dio;
}

class CustomInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    print("[REQ] [${options.method}] ${options.uri}");

    // 토큰을 Authorization 헤더에 추가
    final token = ACCESS_TOKEN;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    print("[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}");

    // 응답 헤더 처리
    final refreshToken = response.headers.value('refresh-token');
    final accessToken = response.headers.value('access-token');

    print('Access Token: $accessToken');
    print('Refresh Token: $refreshToken');

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
    super.onError(err, handler);
    print("[ERR] [${err.message}]");

    // 에러 응답 처리 (예: 토큰 만료 시 재시도 로직 추가 가능)
    handler.next(err);
  }
}
