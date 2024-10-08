import 'package:json_annotation/json_annotation.dart';

part 'VerificationInfo.g.dart';

@JsonSerializable()
class VerificationInfo {

  final String loginId;
  final String password;
  final String passwordConfirmation;
  final String verificationCode;

  VerificationInfo({
    required this.loginId,
    required this.password,
    required this.passwordConfirmation,
    required this.verificationCode, // 기본값 설정
  });

  factory VerificationInfo.fromJson(Map<String, dynamic> json) =>
      _$VerificationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationInfoToJson(this);
}
