// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionListModel _$CommissionListModelFromJson(Map<String, dynamic> json) =>
    CommissionListModel(
      commissions: (json['commissions'] as List<dynamic>)
          .map((e) => CommissionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommissionListModelToJson(
        CommissionListModel instance) =>
    <String, dynamic>{
      'commissions': instance.commissions,
    };

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
