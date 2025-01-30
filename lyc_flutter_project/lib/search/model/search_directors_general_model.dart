import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_directors_general_model.g.dart';

@JsonSerializable()
class SearchDirectorsGeneralListModel {
  final List<SearchDirectorsGeneralModel> members;

  const SearchDirectorsGeneralListModel({
    required this.members,
  });

  factory SearchDirectorsGeneralListModel.fromJson(Map<String, dynamic> json)
  => _$SearchDirectorsGeneralListModelFromJson(json);
}

@JsonSerializable()
class SearchDirectorsGeneralModel {
  final int memberId;
  final String loginId;
  final String profileImage;
  final String nickname;

  const SearchDirectorsGeneralModel({
    required this.memberId,
    required this.loginId,
    required this.profileImage,
    required this.nickname,
  });

  factory SearchDirectorsGeneralModel.fromJson(Map<String, dynamic> json)
  => _$SearchDirectorsGeneralModelFromJson(json);
}
