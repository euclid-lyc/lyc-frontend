import 'package:json_annotation/json_annotation.dart';

part 'VerificationCode.g.dart';

@JsonSerializable()
class VerificationCode {
  final String name;
  final String email;
  final String verificationCode;

  // 생성자에서 필드 초기화
  VerificationCode({
    required this.name,
    required this.email,
    required this.verificationCode, // 기본값 설정
  });

  factory VerificationCode.fromJson(Map<String, dynamic> json) => _$VerificationCodeFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationCodeToJson(this);
}
