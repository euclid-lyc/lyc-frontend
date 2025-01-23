import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/model/clothes_model.dart';
import 'package:lyc_flutter_project/commissions/model/commission_terminate_result.dart';
import 'package:lyc_flutter_project/commissions/model/commission_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../common/model/api_response.dart';
import '../../config/secret.dart';

import '../model/commission_response_model.dart';


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



  //저장한 옷 관련 api

  //디렉터가 저장한 옷 목록 불러오기
  @GET('chats/{chatId}/commissions/saved-clothes')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<List<ClothesModel>>> getClothesList({
    @Path() required int chatId,
  });

  //옷 저장하기
  @POST('chats/{chatId}/commissions/saved-clothes')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<ClothesModel>> saveClothes({
    @Path() required int chatId,
    @Body() required ClothesModel clothes,
  });

  //저장한 옷 삭제하기
  @DELETE('chats/{chatId}/commissions/saved-clothes/{clothesId}')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<ClothesModel>> deleteClothes({
    @Path() required int chatId,
    @Path() required int clothesId
  });

  //디렉터가 저장한 옷 공유 해제하기
  @PATCH('chats/{chatId}/commissions/saved-clothes/private')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<ClothesModel>> unshareClothes({
    @Path() required int chatId,
  });



  //의뢰서 관련 api

  //의뢰 목록 불러오기
  @GET('/chats/commissions')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<List<CommissionResponse>>> getCommissionList({
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
  @GET('/chats/commissions/{commissionId}')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponseModel?>> getCommission({
    @Path() required int commissionId,

  });

  //의뢰서 수정하기
  @PATCH('/chats/commissions/{commissionId}')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> updateCommission({
    @Path() required int commissionId,
    @Body() CommissionModel? commissionModel,
  });

  //의뢰 승낙하기
  @PATCH('/chats/commissions/{commissionId}/accept')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> acceptCommission({
    @Path() required int commissionId,
  });

  //의뢰 거절하기
  @PATCH('/chats/commissions/{commissionId}/decline')
  @Headers({
    'accessToken': 'true',
  })
  Future<ApiResponse<CommissionResponse>> declineCommission({
    @Path() required int commissionId,
  });



  //의뢰 종료 관련 API

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
