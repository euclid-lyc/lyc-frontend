import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_postings_model.g.dart';

@JsonSerializable()
class SearchPostingsListModel {
  final List<SearchPostingsModel> imageList;

  const SearchPostingsListModel({
    required this.imageList,
  });

  factory SearchPostingsListModel.fromJson(Map<String, dynamic> json)
  => _$SearchPostingsListModelFromJson(json);
}

@JsonSerializable()
class SearchPostingsModel {
  final int postingId;
  final String image;
  final String createdAt;

  const SearchPostingsModel({
    required this.postingId,
    required this.image,
    required this.createdAt,
  });

  factory SearchPostingsModel.fromJson(Map<String, dynamic> json)
  => _$SearchPostingsModelFromJson(json);
}
