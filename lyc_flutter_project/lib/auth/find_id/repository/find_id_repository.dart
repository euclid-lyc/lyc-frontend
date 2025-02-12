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

  Future<Response> getVerificationCode({
    required Info info,
  }) async {
    const url = 'http://$ip/lyc/auths/sign-in/find-id/send-verification-code';
    final requestBody = info.toJson();

    final options = Options(
      validateStatus: (status) => true,  // 모든 상태코드 허용
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    try {
      final response = await dio.post(
        url,
        data: requestBody,
        options: options,
      );

      // 성공이 아닌 모든 경우에 예외 발생
      if (response.statusCode != 200) {
        final errorMessage = response.data['message'] ?? '요청 처리 중 오류가 발생했습니다.';
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          message: errorMessage,
        );
      }

      return response;

    } on DioException catch (e) {
      debugPrint('DioException 발생: ${e.type} - ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('기타 예외 발생: $e');
      throw Exception('요청 처리 중 오류가 발생했습니다: $e');
    }
  }
  FindIdRepositoryProvider({required this.dio}) {
    findIdRepository = FindIdRepository(dio, baseUrl: "http://$ip/lyc/auths/");
  }
}

@RestApi()
abstract class FindIdRepository {
  factory FindIdRepository(Dio dio, {String baseUrl}) = _FindIdRepository;

  // 인증 코드 검증
  @POST('find-id')
  Future<ApiResponse<MemberModel>> checkVerificationCode({
    @Header('Authorization') required String authHeader,
    @Body() required VerificationCode verificationCode,
  });
}
