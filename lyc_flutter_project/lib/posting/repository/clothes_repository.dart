import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/posting/model/clothes_posting.dart';
import 'package:retrofit/retrofit.dart';

part 'clothes_repository.g.dart';

class ClothesRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late ClothesRepository repository;

  ClothesRepositoryProvider({required this.dio}) {
    repository = ClothesRepository(
      dio,
      baseUrl: "http://$ip/lyc/clothes",
    );
  }
}

@RestApi()
abstract class ClothesRepository {
  factory ClothesRepository(Dio dio, {String baseUrl}) = _ClothesRepository;

  @POST("/images")
  @Headers({"accessToken": "true"})
  @MultiPart()
  Future<ApiResponse<ClothesPostingImageResult>> uploadPostingImage({
    @Part(name: "clothesByImageDTO") required String clothesByImageDTO,
    @Part(name: "image") required File image,
  });
}
