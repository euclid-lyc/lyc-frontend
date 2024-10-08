import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/auth/join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/model/paginate_query.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/model/possible_reviews.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';

class ReviewProvider extends ChangeNotifier {
  final CoordiRepositoryProvider coordiRepositoryProvider;
  final LoginProvider loginProvider;
  final MypageRepositoryProvider mypageRepositoryProvider;

  ReviewProvider({
    required this.coordiRepositoryProvider,
    required this.loginProvider,
    required this.mypageRepositoryProvider,
  });

  int? _myId;

  bool _loading = false;
  bool _hasMore = true;

  List<CoordiPostingPreview> _reviews = [];

  bool _possibleLoading = false;
  bool _possibleHasMore = true;

  List<PossibleReview> _possibleReviews = [];

  get loading => _loading;

  get reviews => _reviews;

  get possibleLoading => _possibleLoading;

  get possibleReviews => _possibleReviews;

  Future<void> refreshReviews() async {
    await getReviews(refresh: true);
  }

  Future<void> getReviews({
    bool refresh = false,
    int pageSize = 10,
    String cursorDateTime = "9999-12-31T23:59:59.0000",
  }) async {
    if (_loading || (!refresh && !_hasMore)) return;

    _myId ??= loginProvider.memberId;

    PaginateQuery paginateQuery = PaginateQuery(
      pageSize: pageSize,
      cursorDateTime: cursorDateTime,
    );

    if (!refresh && _reviews.isNotEmpty) {
      paginateQuery = paginateQuery.copyWith(
        cursorDateTime: _reviews.last.createdAt,
      );
    }

    try {
      _loading = true;
      notifyListeners();

      final resp =
          await mypageRepositoryProvider.mypageRepository.getReviewList(
        memberId: _myId!,
        paginateQuery: paginateQuery,
      );
      final list = resp.result.imageList;
      _reviews = refresh ? [...list] : [..._reviews, ...list];
      _hasMore = list.length >= pageSize;
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> refreshPossibleReview() async {
    await getPossibleReviews(refresh: true);
  }

  Future<void> getPossibleReviews({
    bool refresh = false,
    int pageSize = 10,
    String? cursorDateTime,
    int? cursorId,
  }) async {
    if (_possibleLoading || (!refresh && !_possibleHasMore)) return;

    if (!refresh && _possibleReviews.isNotEmpty) {
      cursorDateTime = _possibleReviews.last.finishedAt;
      cursorId = _possibleReviews.last.commissionId;
    }

    try {
      _possibleLoading = true;
      notifyListeners();

      final resp =
          await mypageRepositoryProvider.mypageRepository.getPossibleReviewList(
        pageSize: pageSize,
        cursorDateTime: cursorDateTime,
        cursorId: cursorId,
      );
      final list = resp.result.commissions;

      _possibleReviews = refresh ? [...list] : [..._possibleReviews, ...list];
      _possibleHasMore = list.length >= pageSize;
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    } finally {
      _possibleLoading = false;
      notifyListeners();
    }
  }
}
