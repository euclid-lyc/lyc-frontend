import 'package:dio/dio.dart';
import 'package:lyc_flutter_project/commissions/model/basic_info.dart';
import 'package:lyc_flutter_project/commissions/model/other_matters.dart';
import '../../config/secret.dart';
import '../model/commissions_response.dart';


class CommissionsRepository {
  final Dio dio;

  CommissionsRepository({required this.dio});

  Future<CommissionsResponse> submitCommission(
      {required String directerId,
        required BasicInfo basicInfo,
        required OtherMatters otherMatters}) async {
    try {
      const url = 'http://$ip/lyc/chats/commissions';

      final data  = {
        directerId: directerId,
        basicInfo: basicInfo,
        OtherMatters: otherMatters
      };
      final response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        return CommissionsResponse.fromJson(response.data);
      } else {
        throw Exception('데이터 요청에 실패했습니다');
      }
    } catch (e) {
      rethrow;
    }
  }
}
