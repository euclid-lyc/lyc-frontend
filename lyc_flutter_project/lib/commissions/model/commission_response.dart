import 'package:json_annotation/json_annotation.dart';

part 'commission_response.g.dart';

@JsonSerializable()
class CommissionResponse {
  final int commissionId;
  final String profileImage;
  final String nickname;
  final String loginId;
  final DateTime createdAt;

  CommissionResponse({
    required this.commissionId,
    required this.profileImage,
    required this.nickname,
    required this.loginId,
    required this.createdAt,
  });

  factory CommissionResponse.fromJson(Map<String, dynamic> json) =>
      _$CommissionResponseFromJson(json);
}
