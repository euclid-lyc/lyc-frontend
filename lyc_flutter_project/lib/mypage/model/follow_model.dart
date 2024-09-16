import 'package:json_annotation/json_annotation.dart';

part 'follow_model.g.dart';

@JsonSerializable()
class FollowListModel {
  final int memberId;
  final String nickname;
  final String profileImage;
  final String introduction;

  FollowListModel({
    required this.memberId,
    required this.nickname,
    required this.profileImage,
    required this.introduction,
  });

  Map<String, dynamic> toJson() => _$FollowListModelToJson(this);

  factory FollowListModel.fromJson(Map<String, dynamic> json) =>
      _$FollowListModelFromJson(json);
}

@JsonSerializable()
class FollowPaginateQuery {
  final int pageSize;
  final String cursorNickname;

  FollowPaginateQuery({
    required this.pageSize,
    required this.cursorNickname,
  });

  Map<String, dynamic> toJson() => _$FollowPaginateQueryToJson(this);

  factory FollowPaginateQuery.fromJson(Map<String, dynamic> json) =>
      _$FollowPaginateQueryFromJson(json);
}

@JsonSerializable()
class FollowActingResult {
  final int memberId;
  final String nickname;
  final int loginId;
  final int follower;
  final int following;
  final String profileImage;

  FollowActingResult({
    required this.memberId,
    required this.nickname,
    required this.loginId,
    required this.follower,
    required this.following,
    required this.profileImage,
  });

  Map<String, dynamic> toJson() => _$FollowActingResultToJson(this);

  factory FollowActingResult.fromJson(Map<String, dynamic> json) =>
      _$FollowActingResultFromJson(json);
}
