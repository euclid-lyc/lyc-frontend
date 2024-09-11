import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/feed/model/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_repository.g.dart';

class WeatherRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late WeatherRepository repository;

  WeatherRepositoryProvider({required this.dio}) {
    repository = WeatherRepository(
      dio,
      baseUrl: "http://$ip/lyc/weather",
    );
  }
}

@RestApi()
abstract class WeatherRepository {
  factory WeatherRepository(Dio dio, {String baseUrl}) = _WeatherRepository;

  @GET("")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<WeatherResult>>getWeather({
    @Queries() required WeatherQuery weatherQuery,
  });
}