import 'package:json_annotation/json_annotation.dart';

part 'director_ranking.g.dart';

@JsonSerializable()
class DirectorRanking {
  final int memberId;
  final String nickname;
  final String profileImage;
  final int followerCount;

  const DirectorRanking({
    required this.memberId,
    required this.nickname,
    required this.profileImage,
    required this.followerCount,
  });

  factory DirectorRanking.fromJson(Map<String, dynamic> json)
  => _$DirectorRankingFromJson(json);
}

@JsonSerializable()
class DirectorRankingList {
  final List<DirectorRanking> directors;

  const DirectorRankingList({
    required this.directors,
  });
  
  factory DirectorRankingList.fromJson(Map<String, dynamic> json)
  => _$DirectorRankingListFromJson(json);
}