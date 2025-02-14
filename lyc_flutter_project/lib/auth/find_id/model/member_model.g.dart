// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      memberId: (json['memberId'] as num).toInt(),
      loginId: json['loginId'] as String,
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'loginId': instance.loginId,
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
    };
