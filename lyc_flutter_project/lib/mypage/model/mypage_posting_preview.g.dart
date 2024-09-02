// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_posting_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePostingPreview _$BasePostingPreviewFromJson(Map<String, dynamic> json) =>
    BasePostingPreview();

Map<String, dynamic> _$BasePostingPreviewToJson(BasePostingPreview instance) =>
    <String, dynamic>{};

CoordiPostingPreview _$CoordiPostingPreviewFromJson(
        Map<String, dynamic> json) =>
    CoordiPostingPreview(
      postingId: (json['postingId'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$CoordiPostingPreviewToJson(
        CoordiPostingPreview instance) =>
    <String, dynamic>{
      'postingId': instance.postingId,
      'image': instance.image,
    };

ClosetPostingPreview _$ClosetPostingPreviewFromJson(
        Map<String, dynamic> json) =>
    ClosetPostingPreview(
      clothesId: (json['clothesId'] as num).toInt(),
      image: json['image'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$ClosetPostingPreviewToJson(
        ClosetPostingPreview instance) =>
    <String, dynamic>{
      'clothesId': instance.clothesId,
      'title': instance.title,
      'image': instance.image,
    };
