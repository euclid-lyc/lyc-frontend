// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_terminate_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionTerminateResult _$CommissionTerminateResultFromJson(
        Map<String, dynamic> json) =>
    CommissionTerminateResult(
      code: json['code'] as String,
      message: json['message'] as String,
      isSuccess: json['isSuccess'] as bool,
      result: CommissionTerminateDetail.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommissionTerminateResultToJson(
        CommissionTerminateResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'result': instance.result,
    };

CommissionTerminateDetail _$CommissionTerminateDetailFromJson(
        Map<String, dynamic> json) =>
    CommissionTerminateDetail(
      commissionId: (json['commissionId'] as num).toInt(),
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommissionTerminateDetailToJson(
        CommissionTerminateDetail instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
