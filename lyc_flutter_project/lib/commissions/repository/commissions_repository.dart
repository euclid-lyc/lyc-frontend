import 'package:dio/dio.dart';
import 'package:lyc_flutter_project/commissions/model/basic_info.dart';
import 'package:lyc_flutter_project/commissions/model/desired_style.dart';
import 'package:lyc_flutter_project/commissions/model/other_matters.dart';
import '../../config/secret.dart';


class CommissionsRepository {
  final Dio dio;

  CommissionsRepository({required this.dio});

  Future<void> submitCommission(
      {required String directerId,
      required BasicInfo basicInfo,
      required DesiredStyle desiredStyle,
      required OtherMatters otherMatters}) async {
    try {
      const url = 'http://$ip/lyc/chats/commissions';

      final data = {
        'directerId': directerId,
        'basicInfo': basicInfo,
        'style': desiredStyle,
        'otherMatters': otherMatters
      };
      final options = Options(headers: {
        'Content-Type': 'application/json',
        'accept':'*/*',
      });
      final response = await dio.post(url, data: data,options: options);
      if (response.statusCode == 200) {
        print("데이터 전송 성공");
      } else {
        throw Exception('데이터 요청에 실패했습니다');
      }
    } catch (e) {
      rethrow;
    }
  }
}
