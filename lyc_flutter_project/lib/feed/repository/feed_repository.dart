import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
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
}
