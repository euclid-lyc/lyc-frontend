import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../common/model/api_response.dart';
import '../../../config/secret.dart';
import '../../find_pw/model/info.dart';

part 'find_pw_repository.g.dart';

class FindPwRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late FindPwRepository findPwRepository;

  Future<Response> getVerificationCode({
    required Info info,
  }) async {
    const url = 'http://$ip/lyc/auths/sign-in/find-pw/send-verification-code';
    final requestBody = info.toJson();
    final options = Options(
      validateStatus: (status) => true,
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    try {
      final response = await dio.post(
        url,
        data: requestBody,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      debugPrint('DioException 발생: ${e.type} - ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('기타 예외 발생: $e');
      throw Exception('요청 처리 중 오류가 발생했습니다: $e');
    }
  }

  Future<Response> updatePw({
    required String authHeader,
    required Map<String, String> body,
  }) async {
    try {
      final response =
          await dio.patch('http://$ip/lyc/auths/find-pw/update',
              data: body,
              options: Options(
                headers: {
                  'Authorization': authHeader,
                  'Content-Type': 'application/json',
                },
                validateStatus: (status) => true,
                responseType: ResponseType.json,
              ));
      return response;
    } on DioException catch (e) {
      debugPrint('DioException 발생: ${e.type} - ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('기타 예외 발생: $e');
      throw Exception('요청 처리 중 오류가 발생했습니다: $e');
    }
  }

  FindPwRepositoryProvider({required this.dio}) {
    findPwRepository = FindPwRepository(dio, baseUrl: "http://$ip/lyc/auths/");
  }
}

@RestApi()
abstract class FindPwRepository {
  factory FindPwRepository(Dio dio, {String baseUrl}) = _FindPwRepository;

  //인증 코드 검증
  @POST('find-pw')
  Future<ApiResponse> checkVerificationCode({
    @Header('Authorization') required String authHeader,
    @Query('code') required String code,
  });

//비밀번호 변경
// @PATCH('find-pw/update')
// Future<ApiResponse> updatePw({
//   @Header('Authorization') required String authHeader,
//   @Body() required Map<String, String> body,
// });
}
