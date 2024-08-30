import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_preview.dart';
import 'package:retrofit/retrofit.dart';

part 'mypage_repository.g.dart';

class MypageRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late MypageRepository mypageRepository;

  MypageRepositoryProvider({required this.dio}) {
    mypageRepository = MypageRepository(
      dio,
      baseUrl: "http://$ip/lyc",
    );
  }
}

@RestApi()
abstract class MypageRepository {
  // baseUrl: "http://$ip/lyc"
  factory MypageRepository(Dio dio, {String baseUrl}) = _MypageRepository;

  @GET("/members/{memberId}/coordies")
  @Headers({
    'accessToken': 'true',
  })
  Future<CoordiPreview> getMyCoorides({
    @Path() required int memberId,
  });

  @GET("/members/{memberId}/saved-postings")
  @Headers({
    "accessToken": "true",
  })
  Future<CoordiPreview> getSavedCoordies({
    @Path() required int memberId,
  });

  @GET("/clothes/members/{memberId}")
  @Headers({
    "accessToken": "true",
  })
  Future<ClosetPreview> getMyCloset({
    @Path() required int memberId,
  });
}
