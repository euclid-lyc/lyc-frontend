import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/model/paginate_query.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';

class ReviewProvider extends ChangeNotifier {
  final CoordiRepositoryProvider repositoryProvider;
  final LoginProvider loginProvider;

  ReviewProvider({
    required this.repositoryProvider,
    required this.loginProvider,
  });

  int? _myId;

  bool _loading = false;
  bool _hasMore = true;

  List<CoordiPostingPreview> _reviews = [];

  get loading => _loading;

  get hasMore => _hasMore;

  get reviews => _reviews;

  Future<void> refreshReviews() async {
    await getReviews(refresh: true);
  }

  Future<void> getReviews({
    bool refresh = false,
    int pageSize = 10,
    String cursorDateTime = "9999-12-31T23:59:59.0000",
  }) async {
    if (_loading || (!refresh && !hasMore)) return;

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
      final resp = await repositoryProvider.repository.getReviewList(
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
}
