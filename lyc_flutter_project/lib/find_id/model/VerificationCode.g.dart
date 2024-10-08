// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VerificationCode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationCode _$VerificationCodeFromJson(Map<String, dynamic> json) =>
    VerificationCode(
      name: json['name'] as String,
      email: json['email'] as String,
      verificationCode: json['verificationCode'] as String,
    );

Map<String, dynamic> _$VerificationCodeToJson(VerificationCode instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'verificationCode': instance.verificationCode,
    };
