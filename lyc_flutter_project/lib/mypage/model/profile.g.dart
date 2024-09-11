// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      memberId: (json['memberId'] as num).toInt(),
      nickName: json['nickName'] as String,
      loginId: json['loginId'] as String,
      follower: (json['follower'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      profileImage: json['profileImage'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'follower': instance.follower,
      'following': instance.following,
      'profileImage': instance.profileImage,
    };
