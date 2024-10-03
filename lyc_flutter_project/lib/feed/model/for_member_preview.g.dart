// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_member_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForMemberPreview _$ForMemberPreviewFromJson(Map<String, dynamic> json) =>
    ForMemberPreview(
      postingId: (json['postingId'] as num).toInt(),
      image: json['image'] as String,
      createdAt: json['createdAt'] as String,
      totalScore: (json['totalScore'] as num).toInt(),
    );

Map<String, dynamic> _$ForMemberPreviewToJson(ForMemberPreview instance) =>
    <String, dynamic>{
      'postingId': instance.postingId,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'totalScore': instance.totalScore,
    };

ForMemberPreviewResult _$ForMemberPreviewResultFromJson(
        Map<String, dynamic> json) =>
    ForMemberPreviewResult(
      postings: (json['postings'] as List<dynamic>)
          .map((e) => ForMemberPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForMemberPreviewResultToJson(
        ForMemberPreviewResult instance) =>
    <String, dynamic>{
      'postings': instance.postings,
    };
