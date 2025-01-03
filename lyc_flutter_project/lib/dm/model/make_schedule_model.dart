import 'package:json_annotation/json_annotation.dart';

part 'make_schedule_model.g.dart';

@JsonSerializable()
class MakeScheduleModel {
  final String date;
  final String memo;

  const MakeScheduleModel({
    required this.date,
    required this.memo,
  });

  factory MakeScheduleModel.fromJson(Map<String, dynamic> json) => _$MakeScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$MakeScheduleModelToJson(this);
}
