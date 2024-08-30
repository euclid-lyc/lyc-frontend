// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      memberId: (json['memberId'] as num?)?.toInt() ?? 1,
      nickName: json['nickName'] as String? ?? "",
      loginId: json['loginId'] as String? ?? "",
      follower: (json['follower'] as num?)?.toInt() ?? 0,
      following: (json['following'] as num?)?.toInt() ?? 0,
      profileImage: json['profileImage'] as String? ?? "",
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'memberId': instance.memberId,
      'nickName': instance.nickName,
      'loginId': instance.loginId,
      'follower': instance.follower,
      'following': instance.following,
      'profileImage': instance.profileImage,
    };
