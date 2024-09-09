// import 'package:dio/dio.dart' hide Headers;
// import 'package:flutter/material.dart';
// import 'package:lyc_flutter_project/Join/model/Credential.dart';
// import 'package:lyc_flutter_project/common/const/data.dart';
// import 'package:lyc_flutter_project/common/model/api_response.dart';
// import 'package:retrofit/http.dart';
//
//
//
// class LoginRepositoryProvider extends ChangeNotifier {
//   final Dio dio;
//   late LoginRepository loginRepository;
//
//   LoginRepositoryProvider({required this.dio}) {
//     loginRepository = LoginRepository(
//       dio,
//       baseUrl: "http://$ip/lyc",
//     );
//   }
// }
//
// @RestApi()
// abstract class LoginRepository {
//   factory LoginRepository(Dio dio, {String baseUrl}) = _LoginRepository;
//
//   // 로그인 API 요청
//   @POST("/auths/sign-in")
//   @Headers({
//     'Content-Type': 'application/json',
//   })
//   Future<ApiResponse<Map<String, dynamic>>> login(
//     @Body() Credential credential
//   );
//
// }
//

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class LoginRepositoryProvider extends ChangeNotifier {
  final Dio dio;

  LoginRepositoryProvider({required this.dio});
}

