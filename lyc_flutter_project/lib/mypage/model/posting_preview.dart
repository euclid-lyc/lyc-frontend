import 'package:json_annotation/json_annotation.dart';
part 'posting_preview.g.dart';

@JsonSerializable()
class PostingPreview {
  final String postingId;
  final String image;


  PostingPreview({
    required this.postingId,
    required this.image,
  });

  factory PostingPreview.fromJson(Map<String, dynamic> json)
  => _$PostingPreviewFromJson(json);
}
