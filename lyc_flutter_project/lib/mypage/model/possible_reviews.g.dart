// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'possible_reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PossibleReview _$PossibleReviewFromJson(Map<String, dynamic> json) =>
    PossibleReview(
      commissionId: (json['commissionId'] as num).toInt(),
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
      finishedAt: json['finishedAt'] as String,
    );

Map<String, dynamic> _$PossibleReviewToJson(PossibleReview instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
      'finishedAt': instance.finishedAt,
    };

PossibleReviewList _$PossibleReviewListFromJson(Map<String, dynamic> json) =>
    PossibleReviewList(
      commissions: (json['commissions'] as List<dynamic>)
          .map((e) => PossibleReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PossibleReviewListToJson(PossibleReviewList instance) =>
    <String, dynamic>{
      'commissions': instance.commissions,
    };
