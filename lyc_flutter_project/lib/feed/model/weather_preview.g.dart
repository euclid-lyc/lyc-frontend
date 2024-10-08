// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherPreview _$WeatherPreviewFromJson(Map<String, dynamic> json) =>
    WeatherPreview(
      postingId: (json['postingId'] as num).toInt(),
      image: json['image'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$WeatherPreviewToJson(WeatherPreview instance) =>
    <String, dynamic>{
      'postingId': instance.postingId,
      'image': instance.image,
      'createdAt': instance.createdAt,
    };

WeatherPreviewResult _$WeatherPreviewResultFromJson(
        Map<String, dynamic> json) =>
    WeatherPreviewResult(
      posting: (json['posting'] as List<dynamic>)
          .map((e) => WeatherPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherPreviewResultToJson(
        WeatherPreviewResult instance) =>
    <String, dynamic>{
      'posting': instance.posting,
    };
