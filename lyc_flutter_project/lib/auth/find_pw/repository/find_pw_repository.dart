import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../common/model/api_response.dart';
import '../../../config/secret.dart';
import '../../../setting/model/member_model.dart';
import '../../find_pw/model/info.dart';

part 'find_pw_repository.g.dart';

class FindPwRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late FindPwRepository findPwRepository;

  FindPwRepositoryProvider({required this.dio}) {
    findPwRepository = FindPwRepository(dio, baseUrl: "http://$ip/lyc/auths");
  }
}

@RestApi()
abstract class FindPwRepository {
  factory FindPwRepository(Dio dio, {String baseUrl}) = _FindPwRepository;

  //인증번호 발급받기
  @POST('sign-in/find-pw/send-verification-code')
  Future<ApiResponse> getVerificationCode({@Body() required Info info});

//인증 코드 검증
  @POST('find-pw')
  Future<ApiResponse> checkVerificationCode({
    @Header('Authorization') required String authHeader,
    @Query('code') required String code,
  });

  //비밀번호 변경
  @PATCH('find-pw/update')
  Future<ApiResponse> updatePw({
    @Header('Authorization') required String authHeader,
    @Body() required Map<String, String> body,
  });
}
