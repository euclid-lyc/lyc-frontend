
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/auth/find_id/model/member_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../common/model/api_response.dart';
import '../../../config/secret.dart';

import '../../find_id/model/info.dart';
import '../model/verification_code.dart';

part 'find_id_repository.g.dart';

class FindIdRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late FindIdRepository findIdRepository;

  FindIdRepositoryProvider({required this.dio}) {
    findIdRepository =
        FindIdRepository(dio, baseUrl: "http://$ip/lyc/auths");
  }
}

@RestApi()
abstract class FindIdRepository {
  factory FindIdRepository(Dio dio, {String baseUrl}) =
  _FindIdRepository;



  //인증번호 발급받기
  @POST('sign-in/find-id/send-verification-code')
  Future<ApiResponse> getVerificationCode({
    @Body() required Info info
  });


  // 인증 코드 검증
  @POST('find-id')
  Future<ApiResponse<MemberModel>> checkVerificationCode({
    @Header('Authorization') required String authHeader,
    @Body() required VerificationCode verificationCode,
  });
}






