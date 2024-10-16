import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyc_flutter_project/common/const/data.dart';

class DioProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  DioProvider() {
    _dio.interceptors.add(CustomInterceptor(_storage, _dio));
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Dio get dio => _dio;

  FlutterSecureStorage get storage => _storage;
}

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Dio dio;

  CustomInterceptor(this.storage, this.dio);

  @override
  Future<void> onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    print("[REQ] [${options.method}] ${options.uri}");

    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');
      final accessToken = await storage.read(key: accessTokenKey);
      options.headers.addAll({
        "Authorization": "Bearer $accessToken",
      });
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "[RES] [${response.requestOptions.method}] ${response.requestOptions
            .uri}");

    handler.next(response);
  }

  @override
  Future<void> onError(DioException err,
      ErrorInterceptorHandler handler,) async {
    print("[ERR] [${err.message}]");

    if (err.response?.statusCode == 401) {
      final errorCode = err.response?.data['code'];

      if (errorCode == "AA4005") {
        final accessToken = await storage.read(key: accessTokenKey);
        final options = err.requestOptions;
        options.headers['Authorization'] = "Bearer $accessToken";

        try {
          final response = await dio.fetch(options);
          handler.resolve(response);
          return;
        } on DioException catch (e) {
          if (e.response?.statusCode == 401) {
            handler.next(e);
          }
        }

        if (errorCode == 'AA4008') {
          final newAccessToken = err.response?.headers.value('access-token');
          final newRefreshToken = err.response?.headers.value('refresh-token');

          if (newAccessToken != null && newRefreshToken != null) {
            await storage.write(key: accessTokenKey, value: newAccessToken);
            await storage.write(key: refreshTokenKey, value: newRefreshToken);

            final options = err.requestOptions;
            options.headers['Authorization'] = "Bearer $newAccessToken";

            try {
              final response = await dio.fetch(options);
              handler.resolve(response);
              return;
            } on DioException catch (e) {
              if (e.response?.statusCode == 401) {
                // 로그아웃
                return;
              }
            }
          }
        }
      }
      handler.next(err);
    }
  }
}