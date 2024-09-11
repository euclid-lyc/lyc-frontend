import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final int memberId;
  final String nickname;
  final String loginId;
  final int follower;
  final int following;
  final String profileImage;

  Profile({
    required this.memberId,
    required this.nickname,
    required this.loginId,
    required this.follower,
    required this.following,
    required this.profileImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json)
  => _$ProfileFromJson(json);
}
