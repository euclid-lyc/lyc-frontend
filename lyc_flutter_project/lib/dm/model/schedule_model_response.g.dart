// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModelListResponse _$ScheduleModelListResponseFromJson(
        Map<String, dynamic> json) =>
    ScheduleModelListResponse(
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => ScheduleModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleModelListResponseToJson(
        ScheduleModelListResponse instance) =>
    <String, dynamic>{
      'schedules': instance.schedules,
    };

ScheduleModelResponse _$ScheduleModelResponseFromJson(
        Map<String, dynamic> json) =>
    ScheduleModelResponse(
      date: json['date'] as String,
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$ScheduleModelResponseToJson(
        ScheduleModelResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'memo': instance.memo,
    };
