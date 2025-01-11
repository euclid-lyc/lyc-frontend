import 'package:json_annotation/json_annotation.dart';

part 'commission_terminate_result.g.dart';

@JsonSerializable()
class CommissionTerminateResult {
  final String code;
  final String message;
  final bool isSuccess;
  final CommissionTerminateDetail result;

  CommissionTerminateResult({
    required this.code,
    required this.message,
    required this.isSuccess,
    required this.result,
  });

  factory CommissionTerminateResult.fromJson(Map<String, dynamic> json) =>
      _$CommissionTerminateResultFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionTerminateResultToJson(this);
}

@JsonSerializable()
class CommissionTerminateDetail {
  final int commissionId;
  final String profileImage;
  final String nickname;
  final String loginId;
  final DateTime createdAt;

  CommissionTerminateDetail({
    required this.commissionId,
    required this.profileImage,
    required this.nickname,
    required this.loginId,
    required this.createdAt,
  });

  factory CommissionTerminateDetail.fromJson(Map<String, dynamic> json) =>
      _$CommissionTerminateDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionTerminateDetailToJson(this);
}
