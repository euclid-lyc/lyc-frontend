import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../config/secret.dart';
import '../../service/StorageService.dart';
import '../../../common/const/data.dart';
import '../model/register_member_dto.dart';
import '../model/user_verification.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class JoinRepository {
  final Dio dio;
  final StorageService storageService;

  JoinRepository({
    required this.dio,
    required this.storageService,
  });

  //인증 코드 요청
  Future<void> getVerificationCode({
    required UserVerification userVerification,
  }) async {
    final url = 'http://$ip/lyc/auths/sign-up/send-verification-code';
    final requestBody = userVerification.toJson();
    final response = await dio.post(url, data: requestBody);
    if (response.statusCode == 200) {
      final headers = response.headers;
      final tempToken = headers.value('temp-token') ?? '';
      await storageService.write(tempTokenKey, tempToken);
    } else {
      throw Exception('인증 코드 송신에 실패했습니다. : ${response.statusCode}');
    }
  }

  // 인증 코드 검증
  Future<void> sendVerification(String verificationCode) async {
    final url = 'http://$ip/lyc/auths/sign-up/verification';
    final tempToken = await storageService.read(tempTokenKey);
    if (tempToken == null) {
      throw Exception('임시 토큰을 찾을 수 없습니다.');
    }
    final options = Options(headers: {
      'accept': '*/*',
      'Authorization': "Bearer $tempToken",
    });

    final response = await dio.post(url,
        options: options, queryParameters: {'code': verificationCode});
    if (response.statusCode != 200) {
      throw Exception('인증 코드가 올바르지 않습니다.: ${response.statusCode}');
    }

    await storageService.write('verificationCode', verificationCode);
  }

  //회원 가입
  Future<void> registerMember({
    required RegisterMemberDTO registerMemberDTO,
    required String imagePath,
  }) async {
    try {
      final url = 'http://$ip/lyc/auths/sign-up';
      final tempToken = await storageService.read(tempTokenKey);

      final registerMemberDTOJson = jsonEncode(registerMemberDTO.toJson());
      final fileExtension = path.extension(imagePath).toLowerCase();

      MediaType contentType;
      switch (fileExtension) {
        case '.jpg':
        case '.jpeg':
          contentType = MediaType('image', 'jpeg');
          break;
        case '.png':
          contentType = MediaType('image', 'png');
          break;
        case '.gif':
          contentType = MediaType('image', 'gif');
          break;
        default:
          contentType = MediaType('application', 'octet-stream');
      }

      final formData = FormData.fromMap({
        'registerMemberDTO': registerMemberDTOJson,
        'image': await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
          contentType: contentType,
        ),
      });

      final options = Options(
        headers: {
          'accept': '*/*',
          'Authorization': "Bearer $tempToken",
          'Content-Type': 'multipart/form-data',
        },
        validateStatus: (status) {
          return status! < 500;
        },
      );

      final response = await dio.post(
        url,
        data: formData,
        options: options,
      );

      if (response.statusCode != 200) {
        throw Exception(
            '회원 가입 실패: ${response.statusCode}\nResponse: ${response.data}');
      }
    } catch (e) {
      print('오류 발생: $e');
      if (e is DioError) {
      }
      rethrow;
    }
  }
}
