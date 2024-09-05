import 'package:json_annotation/json_annotation.dart';

part 'mypage_posting_preview.g.dart';

@JsonSerializable()
class BasePostingPreview {}

@JsonSerializable()
class CoordiPostingPreview extends BasePostingPreview {
  final int postingId;
  final String image;

  CoordiPostingPreview({
    required this.postingId,
    required this.image,
  });

  factory CoordiPostingPreview.fromJson(Map<String, dynamic> json) =>
      _$CoordiPostingPreviewFromJson(json);
}

@JsonSerializable()
class ClosetPostingPreview extends BasePostingPreview {
  final int clothesId;
  final String title;
  final String? image;

  ClosetPostingPreview({
    required this.clothesId,
    this.image,
    required this.title,
  });

  factory ClosetPostingPreview.fromJson(Map<String, dynamic> json) =>
      _$ClosetPostingPreviewFromJson(json);
}
