// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockMember _$BlockMemberFromJson(Map<String, dynamic> json) => BlockMember(
      memberId: (json['memberId'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String,
      introduction: json['introduction'] as String,
    );

Map<String, dynamic> _$BlockMemberToJson(BlockMember instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'introduction': instance.introduction,
    };

BlockMemberList _$BlockMemberListFromJson(Map<String, dynamic> json) =>
    BlockMemberList(
      members: (json['members'] as List<dynamic>)
          .map((e) => BlockMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockMemberListToJson(BlockMemberList instance) =>
    <String, dynamic>{
      'members': instance.members,
    };
