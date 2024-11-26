import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

@JsonSerializable()
class Credential {
  final String loginId;
  final String loginPw;

  Credential({required this.loginId, required this.loginPw});


  factory Credential.fromJson(Map<String, dynamic> json) => _$CredentialFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialToJson(this);
}
