import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/model/paginate_query.dart';
import 'package:lyc_flutter_project/mypage/model/result.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
import 'package:retrofit/retrofit.dart';

part 'coordi_repository.g.dart';

class CoordiRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late CoordiRepository repository;

  CoordiRepositoryProvider({required this.dio}) {
    repository = CoordiRepository(
      dio,
      baseUrl: "http://$ip/lyc/postings",
    );
  }
}

@RestApi()
abstract class CoordiRepository {
  factory CoordiRepository(Dio dio, {String baseUrl}) = _CoordiRepository;

  @POST("")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<CoordiPostingResult>> uploadCoordi({
    @Body() required postingSaveDTO,
  });

  @POST("/{postingId}")
  @Headers({"accessToken": "true"})
  @MultiPart()
  Future<ApiResponse<CoordiPostingResult>> uploadImage({
    @Path() required int postingId,
    @Part(name: "linkDTO") required linkDTO,
    @Part() required List<MultipartFile> multipartFiles,
  });

  @GET("/{postingId}/like-status")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<bool>> getLikedStatus({
    @Path() required postingId,
  });

  @GET("/{postingId}/save-status")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<bool>> getSaveStatus({
    @Path() required postingId,
  });

  @GET("/members/{memberId}/reviews")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<CoordieResult>> getReviewList({
    @Path() required int memberId,
    @Queries() required PaginateQuery paginateQuery,
  });

}
