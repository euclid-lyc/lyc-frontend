import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/config/secret.dart';

class DioProvider extends ChangeNotifier {
  final _dio = Dio();

  DioProvider() {
    _dio.interceptors.add(CustomInterceptor());
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

      // 아직 로그인 기능 구현이 안됐기 때문에 일단은
      // postman으로 로그인->토큰 받아서 옮기는 식으로 하드코딩 할게요

      // accessToken이어도 깃허브에 올리는 건 좀 아닌 거 같아서
      // 약간의 보안 작업?을 함
      // 아마 오류가 날텐데 common/config/secret.dart 파일을 만들어주세용
      // const String ACCESS_TOKEN = {여기에 토큰값 넣어주기};

      // final token = await storage.read(key: ACCESS_TOKEN_KEY);
      const token = ACCESS_TOKEN;
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
