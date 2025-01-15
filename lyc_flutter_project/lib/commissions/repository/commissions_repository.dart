import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/model/commission_terminate_result.dart';
import 'package:lyc_flutter_project/commissions/model/commission_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../common/model/api_response.dart';
import '../../config/secret.dart';
import '../model/commission_model.dart';

// Retrofit 인터페이스 정의
part 'commissions_repository.g.dart';

class CommissionsRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late CommissionsRepository commissionsRepository;

  CommissionsRepositoryProvider({required this.dio}) {
    commissionsRepository =
        CommissionsRepository(dio, baseUrl: "http://$ip/lyc/");
  }
}

@RestApi()
abstract class CommissionsRepository {
  factory CommissionsRepository(Dio dio, {String baseUrl}) =
      _CommissionsRepository;

  //의뢰 목록 불러오기
  @GET('/chats/commissions')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<List<CommissionResult>>> getCommissionList({
    @Query("pageSize") required int pageSize,
    @Query("cursorDateTime") required String dateTime,
  });

  //의뢰서 작성하기
  @POST('/chats/commissions')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> createCommission({
    @Body() CommissionModel? commissionModel,
  });

  //의뢰서 확인하기
  @GET('/chats/commissions/{commissionsId}')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> checkCommission({
    @Path() required int commissionId,
  });


  //의뢰서 수정하기
  @PATCH('/chats/commissions/{commissionsId}')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> updateCommission({
    @Path() required int commissionId,
    @Body() CommissionModel? commissionModel,
  });

  //의뢰 승낙하기
  @PATCH('/chats/commissions/{commissionsId}/accept')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> acceptCommission({
    @Path() required int commissionId,
  });

  //의뢰 거절하기
  @PATCH('/chats/commissions/{commissionsId}/decline')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> declineCommission({
    @Path() required int commissionId,
  });

  //의뢰 종료 승낙하기
  @PATCH('/chats/{chatId}/commissions/termination')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> acceptTerminate({
    @Path() required int chatId,
  });

  //의뢰 종료 거절하기
  @PATCH('/chats/{chatId}/commissions/termination-cancel')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> cancelTerminate({
    @Path() required int chatId,
  });


  //의뢰 종료 요청하기
  @PATCH('/chats/{chatId}/commissions/termination-request')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionTerminateResult>> terminateCommission({
    @Path() required int chatId,
  });



}
