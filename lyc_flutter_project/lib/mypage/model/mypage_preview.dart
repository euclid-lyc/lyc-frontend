import 'package:json_annotation/json_annotation.dart';
import 'package:lyc_flutter_project/mypage/model/base_preview.dart';
import 'package:lyc_flutter_project/mypage/model/result.dart';

part 'mypage_preview.g.dart';

@JsonSerializable()
class CoordiPreview extends BasePreview<CoordieResult> {
  CoordiPreview({
    required super.code,
    required super.message,
    required super.result,
    required super.isSuccess,
  });

  factory CoordiPreview.fromJson(Map<String, dynamic> json)
  => _$CoordiPreviewFromJson(json);
}

@JsonSerializable()
class ClosetPreview extends BasePreview<ClosetResult> {
  ClosetPreview({
    required super.code,
    required super.message,
    required super.result,
    required super.isSuccess,
  });
  
  factory ClosetPreview.fromJson(Map<String, dynamic> json)
  => _$ClosetPreviewFromJson(json);
}