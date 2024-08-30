// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePreview<T> _$BasePreviewFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePreview<T>(
      code: json['code'] as String,
      message: json['message'] as String,
      result: fromJsonT(json['result']),
      isSuccess: json['isSuccess'] as bool,
    );

Map<String, dynamic> _$BasePreviewToJson<T>(
  BasePreview<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': toJsonT(instance.result),
      'isSuccess': instance.isSuccess,
    };
