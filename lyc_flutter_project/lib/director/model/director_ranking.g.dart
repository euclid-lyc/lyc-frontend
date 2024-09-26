// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorRanking _$DirectorRankingFromJson(Map<String, dynamic> json) =>
    DirectorRanking(
      memberId: (json['memberId'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String,
      followerCount: (json['followerCount'] as num).toInt(),
    );

Map<String, dynamic> _$DirectorRankingToJson(DirectorRanking instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'followerCount': instance.followerCount,
    };

DirectorRankingList _$DirectorRankingListFromJson(Map<String, dynamic> json) =>
    DirectorRankingList(
      directors: (json['directors'] as List<dynamic>)
          .map((e) => DirectorRanking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DirectorRankingListToJson(
        DirectorRankingList instance) =>
    <String, dynamic>{
      'directors': instance.directors,
    };
