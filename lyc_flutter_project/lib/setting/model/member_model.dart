import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class DeliveryModel {
  final int postalCode;
  final String address;
  final String detailAddress;

  DeliveryModel({
    required this.postalCode,
    required this.address,
    required this.detailAddress,
  });

  Map<String, dynamic> toJson() => _$DeliveryModelToJson(this);

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);
}

@JsonSerializable()
class MemberModel {
  final String profileImage;
  final String nickname;
  final String introduction;
  final String loginId;

  MemberModel({
    required this.profileImage,
    required this.nickname,
    required this.introduction,
    required this.loginId,
  });

  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}

@JsonSerializable()
class PushAlarmModel {
  final bool dm;
  final bool feed;
  final bool schedule;
  final bool likeMark;
  final bool event;
  final bool ad;

  PushAlarmModel({
    required this.dm,
    required this.feed,
    required this.schedule,
    required this.likeMark,
    required this.event,
    required this.ad,
  });

  Map<String, dynamic> toJson() => _$PushAlarmModelToJson(this);

  factory PushAlarmModel.fromJson(Map<String, dynamic> json) =>
      _$PushAlarmModelFromJson(json);
}

@JsonSerializable()
class PasswordModel {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  PasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$PasswordModelToJson(this);

  factory PasswordModel.fromJson(Map<String, dynamic> json)
  => _$PasswordModelFromJson(json);
}
