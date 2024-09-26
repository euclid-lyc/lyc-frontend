import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/setting/model/block_member.dart';
import 'package:lyc_flutter_project/setting/model/member_model.dart';
import 'package:retrofit/retrofit.dart';

part 'setting_repository.g.dart';

class SettingRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late SettingRepository repository;

  SettingRepositoryProvider({required this.dio}) {
    repository = SettingRepository(
      dio,
      baseUrl: "http://$ip/lyc",
    );
  }
}

@RestApi()
abstract class SettingRepository {
  factory SettingRepository(Dio dio, {String baseUrl}) = _SettingRepository;

  @GET("/members/delivery")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<DeliveryModel>> getDeliveryInfo();

  @PATCH("/members/delivery")
  @Headers({"accessToken": "true"})
  Future<DeliveryModel> updateDeliveryInfo({
    @Body() required DeliveryModel deliveryModel,
  });

  @GET("/members/info")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<MemberModel>> getMemberInfo();

  @PATCH("/members/info")
  @Headers({"accessToken": "true"})
  Future<MemberModel> updateMemberInfo({
    @Body() required MemberModel memberModel,
  });

  @PATCH("/members/pw-info")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<MemberModel>> updatePassword({
    @Body() required PasswordModel passwordModel,
  });

  @GET("/socials/block-members")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<BlockMemberList>> getBlockMembers({
    @Query("pageSize") required int pageSize,
    @Query("blockMemberId") int? blockMemberId,
  });
}
