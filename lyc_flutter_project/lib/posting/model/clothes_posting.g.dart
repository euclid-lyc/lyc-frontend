// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClothesPostingImage _$ClothesPostingImageFromJson(Map<String, dynamic> json) =>
    ClothesPostingImage(
      memberId: (json['memberId'] as num?)?.toInt(),
      text: json['text'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ClothesPostingImageToJson(
        ClothesPostingImage instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'text': instance.text,
      'title': instance.title,
    };

ClothesPostingText _$ClothesPostingTextFromJson(Map<String, dynamic> json) =>
    ClothesPostingText(
      title: json['title'] as String?,
      text: json['text'] as String?,
      material: json['material'] as String?,
      fit: json['fit'] as String?,
    );

Map<String, dynamic> _$ClothesPostingTextToJson(ClothesPostingText instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'material': instance.material,
      'fit': instance.fit,
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

ClothesPostingTextResult _$ClothesPostingTextResultFromJson(
        Map<String, dynamic> json) =>
    ClothesPostingTextResult(
      memberId: (json['memberId'] as num).toInt(),
      clothesId: (json['clothesId'] as num).toInt(),
      clothesTextId: (json['clothesTextId'] as num).toInt(),
      title: json['title'] as String,
      material: json['material'] as String,
      fit: json['fit'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ClothesPostingTextResultToJson(
        ClothesPostingTextResult instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'clothesId': instance.clothesId,
      'clothesTextId': instance.clothesTextId,
      'title': instance.title,
      'material': instance.material,
      'fit': instance.fit,
      'text': instance.text,
    };
