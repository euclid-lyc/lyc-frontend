import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherResult {
  @JsonKey(name: "temp_min")
  final int tempMin;
  @JsonKey(name: "temp_max")
  final int tempMax;

  WeatherResult({
    required this.tempMin,
    required this.tempMax,
  });

  factory WeatherResult.fromJson(Map<String, dynamic> json) =>
      _$WeatherResultFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResultToJson(this);
}

@JsonSerializable()
class WeatherQuery {
  final String city;

  WeatherQuery({
    required this.city,
  });

  factory WeatherQuery.fromJson(Map<String, dynamic> json) =>
      _$WeatherQueryFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherQueryToJson(this);
}
