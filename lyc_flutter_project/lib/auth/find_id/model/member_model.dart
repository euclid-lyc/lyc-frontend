import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class MemberModel {
  final int memberId;
  final String loginId;
  final String profileImage;
  final String nickname;

  MemberModel({
    required this.memberId,
    required this.loginId,
    required this.profileImage,
    required this.nickname,
  });


  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);


  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}
