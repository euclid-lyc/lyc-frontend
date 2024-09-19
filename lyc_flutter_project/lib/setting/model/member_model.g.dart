// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) =>
    DeliveryModel(
      postalCode: (json['postalCode'] as num).toInt(),
      address: json['address'] as String,
      detailAddress: json['detailAddress'] as String,
    );

Map<String, dynamic> _$DeliveryModelToJson(DeliveryModel instance) =>
    <String, dynamic>{
      'postalCode': instance.postalCode,
      'address': instance.address,
      'detailAddress': instance.detailAddress,
    };

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
      introduction: json['introduction'] as String?,
      loginId: json['loginId'] as String,
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
      'introduction': instance.introduction,
      'loginId': instance.loginId,
    };

PushAlarmModel _$PushAlarmModelFromJson(Map<String, dynamic> json) =>
    PushAlarmModel(
      dm: json['dm'] as bool,
      feed: json['feed'] as bool,
      schedule: json['schedule'] as bool,
      likeMark: json['likeMark'] as bool,
      event: json['event'] as bool,
      ad: json['ad'] as bool,
    );

Map<String, dynamic> _$PushAlarmModelToJson(PushAlarmModel instance) =>
    <String, dynamic>{
      'dm': instance.dm,
      'feed': instance.feed,
      'schedule': instance.schedule,
      'likeMark': instance.likeMark,
      'event': instance.event,
      'ad': instance.ad,
    };

PasswordModel _$PasswordModelFromJson(Map<String, dynamic> json) =>
    PasswordModel(
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$PasswordModelToJson(PasswordModel instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };
