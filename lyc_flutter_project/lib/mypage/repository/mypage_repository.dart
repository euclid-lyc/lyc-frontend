import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/model/paginate_query.dart';
import 'package:lyc_flutter_project/mypage/model/follow_model.dart';
import 'package:lyc_flutter_project/mypage/model/possible_reviews.dart';
import 'package:lyc_flutter_project/mypage/model/profile.dart';
import 'package:lyc_flutter_project/mypage/model/result.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
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
  Future<ApiResponse<CoordieResult>> getMyCoorides({
    @Path() required int memberId,
    @Queries() required PaginateQuery paginateQuery,
  });

  @GET("/members/{memberId}/saved-postings")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<CoordieResult>> getSavedCoordies({
    @Path() required int memberId,
    @Queries() required PaginateQuery paginateQuery,
  });

  @GET("/clothes/members/{memberId}")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<ClosetResult>> getMyCloset({
    @Path() required int memberId,
    @Queries() required PaginateQuery paginateQuery,
  });

  @GET("/socials/members/{memberId}")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<Profile>> getProfile({
    @Path() required int memberId,
  });

  @POST("/socials/block-members/{memberId}")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<Profile>> blockMember({
    @Path() required memberId,
    @Queries() required myId,
  });

  @DELETE("/socials/block-members/{memberId}")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<Profile>> unblockMember({
    @Path() required int memberId,
    @Queries() required myId,
  });

  @PATCH("/postings/{postingId}/dislikes")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<CoordiPostingResult>> dislikePosting({
    @Path() required int postingId,
  });

  @POST("/postings/{postingId}/likes")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<CoordiPostingResult>> likePosting({
    @Path() required int postingId,
  });

  @POST("/postings/{postingId}/saved-postings")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<CoordiPostingResult>> savePosting({
    @Path() required int postingId,
  });

  @DELETE("/postings/{postingId}/saved-postings")
  @Headers({
    "accessToken": "true",
  })
  Future<ApiResponse<SavedResult>> unsavePosting({
    @Path() required int postingId,
  });

  @GET("/postings/{postingId}")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<CoordiPostingResult>> getCoordi({
    @Path() required int postingId,
  });

  @DELETE("/postings/{postingId}")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<DelPosting>> deleteCoordi({
    @Path() required int postingId,
  });

  @GET("/socials/members/{memberId}/followers")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<FollowListResult>> getFollowerList({
    @Path() required int memberId,
    @Queries() required FollowPaginateQuery paginateQuery,
  });

  @GET("/socials/members/{memberId}/followings")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<FollowListResult>> getFollowingList({
    @Path() required int memberId,
    @Queries() required FollowPaginateQuery paginateQuery,
  });

  @POST("/socials/members/{memberId}/followings")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<FollowActingResult>> followUser({
    @Path() required int memberId,
  });

  @DELETE("/socials/members/{memberId}/followings")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<FollowActingResult>> unfollowUser({
    @Path() required int memberId,
  });

  @GET("/members/{memberId}/reviews")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<CoordieResult>> getReviewList({
    @Path() required int memberId,
    @Queries() required PaginateQuery paginateQuery,
  });

  @GET("/reviews/directors")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<PossibleReviewList>> getPossibleReviewList({
    @Query("pageSize") required int pageSize,
    @Query("cursorDateTime") String? cursorDateTime,
    @Query("cursorId") int? cursorId,
  });
}
