// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credential _$CredentialFromJson(Map<String, dynamic> json) => Credential(
      loginId: json['loginId'] as String,
      loginPw: json['loginPw'] as String,
    );

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      'loginId': instance.loginId,
      'loginPw': instance.loginPw,
    };
