import 'package:json_annotation/json_annotation.dart';

part 'for_member_preview.g.dart';

@JsonSerializable()
class ForMemberPreview {
  final int postingId;
  final String image;
  final String createdAt;
  final int totalScore;

  const ForMemberPreview({
    required this.postingId,
    required this.image,
    required this.createdAt,
    required this.totalScore,
  });

  factory ForMemberPreview.fromJson(Map<String, dynamic> json)
  => _$ForMemberPreviewFromJson(json);
}

@JsonSerializable()
class ForMemberPreviewResult {
  final List<ForMemberPreview> postings;

  const ForMemberPreviewResult({
    required this.postings,
  });
  
  factory ForMemberPreviewResult.fromJson(Map<String, dynamic> json)
  => _$ForMemberPreviewResultFromJson(json);
}