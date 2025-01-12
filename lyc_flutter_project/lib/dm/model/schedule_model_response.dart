import 'package:json_annotation/json_annotation.dart';

part 'schedule_model_response.g.dart';

@JsonSerializable()
class ScheduleModelListResponse {
  final List<ScheduleModelResponse> schedules;

  const ScheduleModelListResponse({
    required this.schedules,
  });

  factory ScheduleModelListResponse.fromJson(Map<String, dynamic> json)
  => _$ScheduleModelListResponseFromJson(json);
}

@JsonSerializable()
class ScheduleModelResponse {
  final String date;
  final String memo;

  const ScheduleModelResponse({
    required this.date,
    required this.memo,
  });

  factory ScheduleModelResponse.fromJson(Map<String, dynamic> json)
  => _$ScheduleModelResponseFromJson(json);
}