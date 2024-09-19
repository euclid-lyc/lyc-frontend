// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowListModel _$FollowListModelFromJson(Map<String, dynamic> json) =>
    FollowListModel(
      memberId: (json['memberId'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String,
      introduction: json['introduction'] as String,
    );

Map<String, dynamic> _$FollowListModelToJson(FollowListModel instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'introduction': instance.introduction,
    };

FollowListResult _$FollowListResultFromJson(Map<String, dynamic> json) =>
    FollowListResult(
      members: (json['members'] as List<dynamic>)
          .map((e) => FollowListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FollowListResultToJson(FollowListResult instance) =>
    <String, dynamic>{
      'members': instance.members,
    };

FollowPaginateQuery _$FollowPaginateQueryFromJson(Map<String, dynamic> json) =>
    FollowPaginateQuery(
      pageSize: (json['pageSize'] as num).toInt(),
    );

Map<String, dynamic> _$FollowPaginateQueryToJson(
        FollowPaginateQuery instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
    };

FollowFirstPaginateQuery _$FollowFirstPaginateQueryFromJson(
        Map<String, dynamic> json) =>
    FollowFirstPaginateQuery(
      pageSize: (json['pageSize'] as num).toInt(),
    );

Map<String, dynamic> _$FollowFirstPaginateQueryToJson(
        FollowFirstPaginateQuery instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
    };

FollowMorePaginateQuery _$FollowMorePaginateQueryFromJson(
        Map<String, dynamic> json) =>
    FollowMorePaginateQuery(
      pageSize: (json['pageSize'] as num).toInt(),
      cursorNickname: json['cursorNickname'] as String,
    );

Map<String, dynamic> _$FollowMorePaginateQueryToJson(
        FollowMorePaginateQuery instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'cursorNickname': instance.cursorNickname,
    };

FollowActingResult _$FollowActingResultFromJson(Map<String, dynamic> json) =>
    FollowActingResult(
      memberId: (json['memberId'] as num).toInt(),
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      follower: (json['follower'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      profileImage: json['profileImage'] as String,
    );

Map<String, dynamic> _$FollowActingResultToJson(FollowActingResult instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'follower': instance.follower,
      'following': instance.following,
      'profileImage': instance.profileImage,
    };
