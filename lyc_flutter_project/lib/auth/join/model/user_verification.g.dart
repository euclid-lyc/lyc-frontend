// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVerification _$UserVerificationFromJson(Map<String, dynamic> json) =>
    UserVerification(
      email: json['email'] as String,
      loginId: json['loginId'] as String,
      loginPw: json['loginPw'] as String,
      loginPwCheck: json['loginPwCheck'] as String,
    );

Map<String, dynamic> _$UserVerificationToJson(UserVerification instance) =>
    <String, dynamic>{
      'email': instance.email,
      'loginId': instance.loginId,
      'loginPw': instance.loginPw,
      'loginPwCheck': instance.loginPwCheck,
    };
