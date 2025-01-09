import 'package:json_annotation/json_annotation.dart';

part 'commissions_response.g.dart';

@JsonSerializable()
class CommissionsResponse {
  final String code;
  final String message;
  final commissionResult result;
  final bool isSuccess;

  CommissionsResponse({
    required this.code,
    required this.message,
    required this.result,
    required this.isSuccess,
  });

  factory CommissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommissionsResponseFromJson(json);
}

@JsonSerializable()
class commissionResult {
  final int commissionId;
  final String profileImage;
  final String nickname;
  final String loginId;
  final DateTime createdAt;

  commissionResult({
    required this.commissionId,
    required this.profileImage,
    required this.nickname,
    required this.loginId,
    required this.createdAt,
  });

  factory commissionResult.fromJson(Map<String, dynamic> json) =>
      _$commissionResultFromJson(json);
}
