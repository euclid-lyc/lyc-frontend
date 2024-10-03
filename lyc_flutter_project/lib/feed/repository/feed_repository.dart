import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/feed/model/for_member_preview.dart';
import 'package:lyc_flutter_project/feed/model/weather_preview.dart';
import 'package:retrofit/retrofit.dart';

part 'feed_repository.g.dart';

class FeedRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late FeedRepository repository;

  FeedRepositoryProvider({required this.dio}) {
    repository = FeedRepository(
      dio,
      baseUrl: "http://$ip/lyc/feeds",
    );
  }
}

@RestApi()
abstract class FeedRepository {
  factory FeedRepository(Dio dio, {String baseUrl}) = _FeedRepository;

  @GET("/preview")
  @Headers({"accessToken": "true"})
  Future<ApiResponse> getFeedPreview();

  @GET("/by-weather")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<WeatherPreviewResult>> getWeatherPostings();

  @GET("/for-member")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<ForMemberPreviewResult>> getForMemberPostings();
}
