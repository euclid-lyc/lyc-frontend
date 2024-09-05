// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResult _$WeatherResultFromJson(Map<String, dynamic> json) =>
    WeatherResult(
      tempMin: (json['temp_min'] as num).toInt(),
      tempMax: (json['temp_max'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherResultToJson(WeatherResult instance) =>
    <String, dynamic>{
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };

WeatherQuery _$WeatherQueryFromJson(Map<String, dynamic> json) => WeatherQuery(
      city: json['city'] as String,
    );

Map<String, dynamic> _$WeatherQueryToJson(WeatherQuery instance) =>
    <String, dynamic>{
      'city': instance.city,
    };
