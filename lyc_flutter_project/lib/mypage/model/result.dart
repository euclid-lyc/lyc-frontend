import 'package:json_annotation/json_annotation.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';

part 'result.g.dart';

abstract class BaseResult {}

@JsonSerializable()
class CoordiResult extends BaseResult {
  final List<CoordiPostingPreview> imageList;

  CoordiResult({
    required this.imageList,
  });

  factory CoordiResult.fromJson(Map<String, dynamic> json) =>
      _$CoordiResultFromJson(json);

  Map<String, dynamic> toJson() => _$CoordiResultToJson(this);
}

@JsonSerializable()
class ClosetResult extends BaseResult {
  final List<ClosetPostingPreview> clothesList;

  ClosetResult({
    required this.clothesList,
  });

  factory ClosetResult.fromJson(Map<String, dynamic> json) =>
      _$ClosetResultFromJson(json);

  Map<String, dynamic> toJson() => _$ClosetResultToJson(this);
}