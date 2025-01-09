import 'package:dio/dio.dart'hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:retrofit/retrofit.dart';
import 'package:lyc_flutter_project/commissions/model/basic_info.dart';
import 'package:lyc_flutter_project/commissions/model/desired_style.dart';
import 'package:lyc_flutter_project/commissions/model/other_matters.dart';
import '../../config/secret.dart';

// Retrofit 인터페이스 정의
part 'commissions_repository.g.dart';

class CommissionsRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late CommissionsRepository commissionsRepository;

  CommissionsRepositoryProvider({required this.dio}) {
    commissionsRepository = CommissionsRepository(dio, baseUrl: "http://$ip/lyc");
  }
}
@RestApi()
abstract class CommissionsRepository {
  factory CommissionsRepository(Dio dio, {String baseUrl}) = _CommissionsRepository;

  // Future<void> submitCommission({
  //   required String directerId,
  //   required BasicInfo basicInfo,
  //   required DesiredStyle desiredStyle,
  //   required OtherMatters otherMatters,
  //   required BuildContext context, // context 추가
  // }) async {
  //   try {
  //     const url = 'http://$ip/lyc/chats/commissions';
  //     // final data = {
  //     //   'directerLoginId': directerId,
  //     //   'basicInfo': basicInfo,
  //     //   'style': desiredStyle,
  //     //   'otherMatters': otherMatters
  //     // };
  //     final data = {
  //       'directorLoginId': directerId,
  //       'basicInfo': {
  //         'height': basicInfo.height,
  //         'weight': basicInfo.weight,
  //         'topSize': basicInfo.topSize,
  //         'bottomSize': basicInfo.bottomSize,
  //         'postalCode': basicInfo.postalCode,
  //         'address': basicInfo.address,
  //         'detailAddress': basicInfo.detailAddress,
  //         'text': basicInfo.text,
  //         'infoStyle': {
  //           'preferredStyleList': basicInfo.infoStyle.preferredStyleList,
  //           'nonPreferredStyleList': basicInfo.infoStyle.nonPreferredStyleList
  //         },
  //         'infoFit': {
  //           'preferredFitList': basicInfo.infoFit.preferredFitList,
  //           'nonPreferredFitList': basicInfo.infoFit.nonPreferredFitList
  //         },
  //         'infoMaterial': {
  //           'preferredMaterialList':
  //               basicInfo.infoMaterial.preferredMaterialList,
  //           'nonPreferredMaterialList':
  //               basicInfo.infoMaterial.nonPreferredMaterialList
  //         },
  //         'infoBodyType': {
  //           'goodBodyTypeList': basicInfo.infoBodyType.goodBodyTypeList,
  //           'badBodyTypeList': basicInfo.infoBodyType.badBodyTypeList
  //         }
  //       },
  //       'style': {
  //         'occasion': desiredStyle.occasion,
  //         'styleList': desiredStyle.styleList.styleList, // 배열로 변경
  //         'fitList': desiredStyle.fitList.fitList, // 배열로 변경
  //         'materialList': desiredStyle.materialList.materialList, // 배열로 변경
  //         'colorList': desiredStyle.colorList.colorList // 배열로 변경
  //       },
  //       'otherMatters': {
  //         'minPrice': otherMatters.minPrice,
  //         'maxPrice': otherMatters.maxPrice,
  //         'dateToUse': otherMatters.dateToUse,
  //         'desiredDate': otherMatters.desiredDate,
  //         'text': otherMatters.text,
  //         'isShared': otherMatters.isShared
  //       }
  //     };
  //     final token = await storage.read(key: accessTokenKey);
  //
  //
  //     final options = Options(headers: {
  //       'accept': '*/*',
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json',
  //     });
  //     debugPrint ('보낸 데이터: $data');
  //     debugPrint ("토큰 : $token");
  //     final response = await dio.post(url, data: data, options: options);
  //
  //     if (response.statusCode == 200) {
  //       debugPrint ("데이터 전송 성공");
  //     } else {
  //       debugPrint (response.statusCode as String?);
  //       throw Exception('데이터 요청에 실패했습니다');
  //     }
  //   } catch (e) {
  //     if (e is DioException && e.response != null) {
  //       final responseData = e.response?.data as Map<String, dynamic>;
  //       final message = responseData['message'];
  //
  //       if (message != null && context.mounted) {
  //         _showErrorDialog(context, '데이터 요청 실패', message);
  //       }
  //     }
  //   }
  // }


  @PATCH('/chats/{chatId}/commissions/termination-request')
  @Headers({
    'accessToken': 'true',
  })
  Future<Response> terminateCommission({
    @Path() required int chatId,
  });
}
// void _showErrorDialog(BuildContext context, String title, String message) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('확인'),
//           ),
//         ],
//       );
//     },
//   );
// }
