// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_posting_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePostingPreview _$BasePostingPreviewFromJson(Map<String, dynamic> json) =>
    BasePostingPreview(
      image: DataUtils.pathToUrl(json['image'] as String),
    );

Map<String, dynamic> _$BasePostingPreviewToJson(BasePostingPreview instance) =>
    <String, dynamic>{
      'image': instance.image,
    };

CoordiPostingPreview _$CoordiPostingPreviewFromJson(
        Map<String, dynamic> json) =>
    CoordiPostingPreview(
      postingId: (json['postingId'] as num).toInt(),
      image: DataUtils.pathToUrl(json['image'] as String),
    );

Map<String, dynamic> _$CoordiPostingPreviewToJson(
        CoordiPostingPreview instance) =>
    <String, dynamic>{
      'image': instance.image,
      'postingId': instance.postingId,
    };

ClosetPostingPreview _$ClosetPostingPreviewFromJson(
        Map<String, dynamic> json) =>
    ClosetPostingPreview(
      clothesId: (json['clothesId'] as num).toInt(),
      image: DataUtils.pathToUrl(json['image'] as String),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ClosetPostingPreviewToJson(
        ClosetPostingPreview instance) =>
    <String, dynamic>{
      'image': instance.image,
      'clothesId': instance.clothesId,
      'title': instance.title,
    };
