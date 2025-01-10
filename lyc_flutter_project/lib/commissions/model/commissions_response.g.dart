// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commissions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionsResponse _$CommissionsResponseFromJson(Map<String, dynamic> json) =>
    CommissionsResponse(
      code: json['code'] as String,
      message: json['message'] as String,
      result: commissionResult.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool,
    );

Map<String, dynamic> _$CommissionsResponseToJson(
        CommissionsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
      'isSuccess': instance.isSuccess,
    };

commissionResult _$commissionResultFromJson(Map<String, dynamic> json) =>
    commissionResult(
      commissionId: (json['commissionId'] as num).toInt(),
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$commissionResultToJson(commissionResult instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
