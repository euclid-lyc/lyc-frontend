import 'package:json_annotation/json_annotation.dart';

part 'possible_reviews.g.dart';

@JsonSerializable()
class PossibleReview {
  final int commissionId;
  final String profileImage;
  final String nickname;
  final String finishedAt;

  const PossibleReview({
    required this.commissionId,
    required this.profileImage,
    required this.nickname,
    required this.finishedAt,
  });

  factory PossibleReview.fromJson(Map<String, dynamic> json)
  => _$PossibleReviewFromJson(json);
}

@JsonSerializable()
class PossibleReviewList {
  List<PossibleReview> commissions;

  PossibleReviewList({
    required this.commissions,
  });
  
  factory PossibleReviewList.fromJson(Map<String, dynamic> json)
  => _$PossibleReviewListFromJson(json);
}