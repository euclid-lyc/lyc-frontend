// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordiPreview _$CoordiPreviewFromJson(Map<String, dynamic> json) =>
    CoordiPreview(
      code: json['code'] as String,
      message: json['message'] as String,
      result: CoordieResult.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool,
    );

Map<String, dynamic> _$CoordiPreviewToJson(CoordiPreview instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
      'isSuccess': instance.isSuccess,
    };

ClosetPreview _$ClosetPreviewFromJson(Map<String, dynamic> json) =>
    ClosetPreview(
      code: json['code'] as String,
      message: json['message'] as String,
      result: ClosetResult.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool,
    );

Map<String, dynamic> _$ClosetPreviewToJson(ClosetPreview instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
      'isSuccess': instance.isSuccess,
    };
