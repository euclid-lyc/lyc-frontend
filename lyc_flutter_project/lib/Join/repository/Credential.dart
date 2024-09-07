import 'package:json_annotation/json_annotation.dart';

part 'Credential.g.dart';

@JsonSerializable()
class Credential {
  final String loginId;
  final String loginPw;

  Credential({required this.loginId, required this.loginPw});

  Map<String, dynamic> toJson() => {
    "loginId": loginId,
    "loginPw": loginPw,
  };
}

