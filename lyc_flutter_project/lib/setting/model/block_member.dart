import 'package:json_annotation/json_annotation.dart';

part 'block_member.g.dart';

@JsonSerializable()
class BlockMember {
  final int memberId;
  final String nickname;
  final String profileImage;
  final String introduction;

  const BlockMember({
    required this.memberId,
    required this.nickname,
    required this.profileImage,
    required this.introduction,
  });

  factory BlockMember.fromJson(Map<String, dynamic> json)
  => _$BlockMemberFromJson(json);
}

@JsonSerializable()
class BlockMemberList {
  final List<BlockMember> members;

  const BlockMemberList({
    required this.members,
  });
  
  factory BlockMemberList.fromJson(Map<String, dynamic> json)
  => _$BlockMemberListFromJson(json);
}