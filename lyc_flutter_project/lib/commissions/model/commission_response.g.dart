// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionResponse _$CommissionResponseFromJson(Map<String, dynamic> json) =>
    CommissionResponse(
      code: json['code'] as String,
      message: json['message'] as String,
      result: CommissionResult.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool,
    );

Map<String, dynamic> _$CommissionResponseToJson(CommissionResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
      'isSuccess': instance.isSuccess,
    };

CommissionResult _$CommissionResultFromJson(Map<String, dynamic> json) =>
    CommissionResult(
      commissionId: (json['commissionId'] as num).toInt(),
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommissionResultToJson(CommissionResult instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
