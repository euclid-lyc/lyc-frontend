import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/director/model/director_ranking.dart';
import 'package:retrofit/retrofit.dart';

part 'director_repository.g.dart';

class DirectorRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late DirectorRepository repository;

  DirectorRepositoryProvider({required this.dio}) {
    repository =
        DirectorRepository(dio, baseUrl: "http://$ip/lyc/socials/directors");
  }
}

@RestApi()
abstract class DirectorRepository {
  factory DirectorRepository(Dio dio, {String baseUrl}) = _DirectorRepository;

  @GET("")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<DirectorRankingList>> getDirectorRanking({
    @Query("pageSize") required int pageSize,
    @Query("followerCount") int? followerCount,
  });
}
