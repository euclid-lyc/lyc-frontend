import 'package:json_annotation/json_annotation.dart';

part 'mypage_posting_preview.g.dart';

@JsonSerializable()
class CoordiPostingPreview {
  final int postingId;
  final String image;

  CoordiPostingPreview({
    required this.postingId,
    required this.image,
  });
  
  factory CoordiPostingPreview.fromJson(Map<String, dynamic> json)
  => _$CoordiPostingPreviewFromJson(json);
}

@JsonSerializable()
class ClosetPostingPreview {
  final int clothesId;
  final String image;
  final String title;

  ClosetPostingPreview({
    required this.clothesId,
    required this.image,
    required this.title,
  });
  
  factory ClosetPostingPreview.fromJson(Map<String, dynamic> json)
  => _$ClosetPostingPreviewFromJson(json);
}
