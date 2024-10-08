// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VerificationInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationInfo _$VerificationInfoFromJson(Map<String, dynamic> json) =>
    VerificationInfo(
      loginId: json['loginId'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
      verificationCode: json['verificationCode'] as String,
    );

Map<String, dynamic> _$VerificationInfoToJson(VerificationInfo instance) =>
    <String, dynamic>{
      'loginId': instance.loginId,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
      'verificationCode': instance.verificationCode,
    };
