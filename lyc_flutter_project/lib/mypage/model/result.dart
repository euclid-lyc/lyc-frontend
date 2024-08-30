import 'package:json_annotation/json_annotation.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';

part 'result.g.dart';

@JsonSerializable()
class CoordieResult {
  final int memberId;
  final List<CoordiPostingPreview> imageList;

  CoordieResult({
    required this.memberId,
    required this.imageList,
  });

  factory CoordieResult.fromJson(Map<String, dynamic> json) =>
      _$CoordieResultFromJson(json);

  Map<String, dynamic> toJson() => _$CoordieResultToJson(this);
}

@JsonSerializable()
class ClosetResult {
  final int memberId;
  final List<ClosetPostingPreview> clothesList;

  ClosetResult({
    required this.memberId,
    required this.clothesList,
  });

  factory ClosetResult.fromJson(Map<String, dynamic> json) =>
      _$ClosetResultFromJson(json);

  Map<String, dynamic> toJson() => _$ClosetResultToJson(this);
}