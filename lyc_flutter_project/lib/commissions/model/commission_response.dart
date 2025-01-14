import 'package:json_annotation/json_annotation.dart';

part 'commission_response.g.dart';

@JsonSerializable()
class CommissionResponse {
  final String code;
  final String message;
  final CommissionResult result;
  final bool isSuccess;

  CommissionResponse({
    required this.code,
    required this.message,
    required this.result,
    required this.isSuccess,
  });

  factory CommissionResponse.fromJson(Map<String, dynamic> json) =>
      _$CommissionResponseFromJson(json);
}

@JsonSerializable()
class CommissionResult {
  final int commissionId;
  final String profileImage;
  final String nickname;
  final String loginId;
  final DateTime createdAt;

  CommissionResult({
    required this.commissionId,
    required this.profileImage,
    required this.nickname,
    required this.loginId,
    required this.createdAt,
  });

  factory CommissionResult.fromJson(Map<String, dynamic> json) =>
      _$CommissionResultFromJson(json);
}
