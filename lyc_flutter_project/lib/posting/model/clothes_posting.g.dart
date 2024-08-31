// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClothesPostingImage _$ClothesPostingImageFromJson(Map<String, dynamic> json) =>
    ClothesPostingImage(
      memberId: (json['memberId'] as num?)?.toInt(),
      image: json['image'] as String?,
      text: json['text'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ClothesPostingImageToJson(
        ClothesPostingImage instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'image': instance.image,
      'text': instance.text,
      'title': instance.title,
    };

ClothesPostingImageResult _$ClothesPostingImageResultFromJson(
        Map<String, dynamic> json) =>
    ClothesPostingImageResult(
      memberId: (json['memberId'] as num).toInt(),
      clothesId: (json['clothesId'] as num).toInt(),
      clothesImageId: (json['clothesImageId'] as num).toInt(),
      image: json['image'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ClothesPostingImageResultToJson(
        ClothesPostingImageResult instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'clothesId': instance.clothesId,
      'clothesImageId': instance.clothesImageId,
      'image': instance.image,
      'text': instance.text,
    };
