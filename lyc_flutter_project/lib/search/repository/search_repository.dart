import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/search/model/search_chats_model.dart';
import 'package:lyc_flutter_project/search/model/search_directors_general_model.dart';
import 'package:lyc_flutter_project/search/model/search_directors_keyword_model.dart';
import 'package:lyc_flutter_project/search/model/search_postings_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_repository.g.dart';

class SearchRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late SearchRepository repository;

  SearchRepositoryProvider({required this.dio}) {
    repository = SearchRepository(
      dio,
      baseUrl: "http://$ip/lyc/searches",
    );
  }
}

@RestApi()
abstract class SearchRepository {
  factory SearchRepository(Dio dio, {String baseUrl}) = _SearchRepository;

  @GET('/chats')
  @Headers({"accessToken": "true"})
  Future<ApiResponse<SearchChatsListModel>> searchChats({
    @Query('keyword') required String keyword,
  });

  @GET('/directors/general')
  @Headers({"accessToken": "true"})
  Future<ApiResponse<SearchDirectorsGeneralListModel>> searchDirectorGeneral({
    @Query('term') required String term,
  });

  @GET('/directors/keyword')
  @Headers({"accessToken": "true"})
  Future<ApiResponse<SearchDirectorsKeywordListModel>> searchDirectorKeyword({
    @Query('term') required List<String> term,
    @Query('orderType') required String orderType,
  });

  @GET('/postings')
  @Headers({"accessToken": "true"})
  Future<ApiResponse<SearchPostingsListModel>> searchPostings({
    @Query('keyword') required String term,
    @Query('orderType') required String orderType,
  });
}
