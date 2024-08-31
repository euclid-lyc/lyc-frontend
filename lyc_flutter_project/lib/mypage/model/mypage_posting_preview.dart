import 'package:json_annotation/json_annotation.dart';
import 'package:lyc_flutter_project/common/utils/data_utils.dart';

part 'mypage_posting_preview.g.dart';

@JsonSerializable()
class BasePostingPreview {
  @JsonKey(fromJson: DataUtils.pathToUrl)
  final String image;

  BasePostingPreview({
    required this.image,
  });

  factory BasePostingPreview.fromJson(Map<String, dynamic> json) =>
      _$BasePostingPreviewFromJson(json);
}

@JsonSerializable()
class CoordiPostingPreview extends BasePostingPreview {
  final int postingId;

  CoordiPostingPreview({
    required this.postingId,
    required super.image,
  });

  factory CoordiPostingPreview.fromJson(Map<String, dynamic> json) =>
      _$CoordiPostingPreviewFromJson(json);
}

@JsonSerializable()
class ClosetPostingPreview extends BasePostingPreview {
  final int clothesId;
  final String title;

  ClosetPostingPreview({
    required this.clothesId,
    required super.image,
    required this.title,
  });

  factory ClosetPostingPreview.fromJson(Map<String, dynamic> json) =>
      _$ClosetPostingPreviewFromJson(json);
}
