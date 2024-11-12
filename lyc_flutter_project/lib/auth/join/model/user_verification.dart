import 'package:json_annotation/json_annotation.dart';

part 'user_verification.g.dart';

@JsonSerializable()
class UserVerification {
  final String email;
  final String loginId;
  final String loginPw;
  final String loginPwCheck;

  UserVerification({
    required this.email,
    required this.loginId,
    required this.loginPw,
    required this.loginPwCheck,
  });


  factory UserVerification.fromJson(Map<String, dynamic> json) =>
      _$UserVerificationFromJson(json);


  Map<String, dynamic> toJson() => _$UserVerificationToJson(this);
}
