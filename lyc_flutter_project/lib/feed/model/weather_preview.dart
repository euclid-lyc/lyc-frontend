import 'package:json_annotation/json_annotation.dart';

part 'weather_preview.g.dart';

@JsonSerializable()
class WeatherPreview {
  final int postingId;
  final String image;
  final String createdAt;

  const WeatherPreview({
    required this.postingId,
    required this.image,
    required this.createdAt,
  });

  factory WeatherPreview.fromJson(Map<String, dynamic> json)
  => _$WeatherPreviewFromJson(json);
}

@JsonSerializable()
class WeatherPreviewResult {
  final List<WeatherPreview> posting;

  const WeatherPreviewResult({
    required this.posting,
  });

  factory WeatherPreviewResult.fromJson(Map<String, dynamic> json)
  => _$WeatherPreviewResultFromJson(json);
}