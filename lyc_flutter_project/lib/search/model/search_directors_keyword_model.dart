import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_directors_keyword_model.g.dart';

@JsonSerializable()
class SearchDirectorsKeywordListModel {
  List<SearchDirectorsKeywordModel> members;

  SearchDirectorsKeywordListModel({
    required this.members,
  });

  factory SearchDirectorsKeywordListModel.fromJson(Map<String, dynamic> json)
  => _$SearchDirectorsKeywordListModelFromJson(json);
}

@JsonSerializable()
class SearchDirectorsKeywordModel {
  final int memberId;
  final String nickname;
  final String loginId;
  final String introduction;
  final String profileImage;
  final List<SearchDirectorsKeywordStyleModel> styles;

  const SearchDirectorsKeywordModel({
    required this.memberId,
    required this.nickname,
    required this.loginId,
    required this.introduction,
    required this.profileImage,
    required this.styles,
  });

  factory SearchDirectorsKeywordModel.fromJson(Map<String, dynamic> json)
  => _$SearchDirectorsKeywordModelFromJson(json);
}

@JsonSerializable()
class SearchDirectorsKeywordStyleModel {
  final List<String> styles;

  SearchDirectorsKeywordStyleModel({
    required this.styles,
  });

  factory SearchDirectorsKeywordStyleModel.fromJson(Map<String, dynamic> json)
  => _$SearchDirectorsKeywordStyleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDirectorsKeywordStyleModelToJson(this);
}
