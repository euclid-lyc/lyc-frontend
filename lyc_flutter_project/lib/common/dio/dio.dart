import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioProvider extends ChangeNotifier {
  final _dio = Dio();

  DioProvider() {
    _dio.interceptors.add(CustomInterceptor());
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Dio get dio => _dio;
}

class CustomInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    print("[REQ] [${options.method}] ${options.uri}");

    if (options.headers['accessToken'] == 'true') {
      {
        options.headers.remove('accessToken');
      }
      // 원래는 secure storage에 토큰을 저장해놓고 불러와서 사용하지만
      // 아직 로그인 구현이 안됐기 때문에 일단은
      // postman으로 로그인->토큰 받아서 옮기는 식으로 하드코딩 할게요

      // final token = await storage.read(key: ACCESS_TOKEN_KEY);
      const token =
          "eyJhbGciOiJIUzM4NCJ9.eyJpc3MiOiJldWNsaWQtbHljIiwic3ViIjoic3RyaW5nIiwiaWF0IjoxNzI0OTkzMjU5LCJleHAiOjE3MjQ5OTY4NTl9.oaQI3y4ndj2PFl0nP8RifJQlAk9LDfj9AIckFIaHvHO6PiwARbdpiaOLnRwnBFR-";
      options.headers.addAll({
        // 'authorization': 'Bearer $token',
        "authorization": "Bearer $token",
      });
    }

    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken');

      // final token = await storage.read(key: REFRESH_TOKEN_KEY);
      options.headers.addAll({
        // 'authorization': 'Bearer $token',
      });
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    print(
        "[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}");
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    print("[ERR] [${err.message}]");
  }
}
