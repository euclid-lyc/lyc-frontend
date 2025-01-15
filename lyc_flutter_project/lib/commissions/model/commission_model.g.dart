// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionModel _$CommissionModelFromJson(Map<String, dynamic> json) =>
    CommissionModel(
      commissionId: (json['commissionId'] as num).toInt(),
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$CommissionModelToJson(CommissionModel instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'createdAt': instance.createdAt,
    };
