import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/model/commission_model.dart';
import 'package:lyc_flutter_project/commissions/model/commission_terminate_result.dart';
import 'package:lyc_flutter_project/commissions/model/commission_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../common/model/api_response.dart';
import '../../config/secret.dart';
import '../model/commission_request.dart';

// Retrofit 인터페이스 정의
part 'commissions_repository.g.dart';

class CommissionsRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late CommissionsRepository commissionsRepository;

  CommissionsRepositoryProvider({required this.dio}) {
    commissionsRepository =
        CommissionsRepository(dio, baseUrl: "http://$ip/lyc");
  }
}

@RestApi()
abstract class CommissionsRepository {
  factory CommissionsRepository(Dio dio, {String baseUrl}) =
      _CommissionsRepository;

  @POST('/chats/commissions')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> createCommission({
    @Body() CommissionRequest? commissionRequest,
  });

  @GET('/chats/commissions')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionListModel>> getCommissionList({
    @Query("pageSize") required int pageSize,
    @Query("cursorDateTime") required String dateTime,
  });

  @PATCH('/chats/{chatId}/commissions/termination-request')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionTerminateResult>> terminateCommission({
    @Path() required int chatId,
  });

  @PATCH('/chats/commissions/{commissionsId}')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> updateCommission({
    @Path() required int commissionId,
  });

  @GET('/chats/commissions/{commissionsId}')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> checkCommission({
    @Path() required int commissionId,
  });
}
