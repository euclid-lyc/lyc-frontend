import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/mypage/model/follow_model.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';

class FollowProvider extends ChangeNotifier {
  final MypageRepositoryProvider repositoryProvider;
  final bool initialIsFollower;
  final int memberId;

  FollowProvider({
    required this.repositoryProvider,
    required this.initialIsFollower,
    required this.memberId,
  }) {
    setCategory(isFollower: initialIsFollower);
  }

  bool _isFollower = true;
  List<FollowListModel> _follower = [];
  List<FollowListModel> _following = [];

  bool _loadingFollower = false;
  bool _loadingFollowing = false;

  bool _hasMoreFollower = true;
  bool _hasMoreFollowing = true;

  get isFollower => _isFollower;

  get list => _isFollower ? _follower : _following;

  Future<void> setCategory({bool? isFollower}) async {
    if (isFollower != null) {
      _isFollower = isFollower;
    } else {
      _isFollower = !_isFollower;
    }
    await getList(refresh: true);
    notifyListeners();
  }

  bool getLoading() {
    return _isFollower ? _loadingFollower : _loadingFollowing;
  }

  bool getHasMore() {
    return _isFollower ? _hasMoreFollower : _hasMoreFollowing;
  }

  void updateLoading(bool status) {
    _isFollower ? _loadingFollower = status : _loadingFollowing = status;
  }

  void updateHasMore(bool status) {
    _isFollower ? _hasMoreFollower = status : _hasMoreFollowing = status;
  }

  Future<void> unfollowUser({
    required int memberId,
  }) async {
    await repositoryProvider.mypageRepository.unfollowUser(memberId: memberId);
    getList(refresh: true);
  }

  Future<void> refresh() async {
    try {
      await getList(refresh: true);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getList({
    bool refresh = false,
    int pageSize = 10,
    String? cursorNickname,
    int? forceCategory,
  }) async {
    if (getLoading() || !getHasMore()) return;

    // 0=팔로워, 1=팔로잉
    int category = _isFollower ? 0 : 1;

    if (forceCategory != null && (forceCategory == 0 || forceCategory == 1)) {
      category = forceCategory;
    }

    FollowPaginateQuery paginateQuery = FollowPaginateQuery(
      pageSize: pageSize,
    );

    if (!refresh) {
      if (category == 0) {
        if (_follower.isNotEmpty) {
          paginateQuery = FollowMorePaginateQuery(
            pageSize: pageSize,
            cursorNickname: _follower.last.nickname,
          );
        }
      } else {
        if (_following.isNotEmpty) {
          paginateQuery = FollowMorePaginateQuery(
            pageSize: pageSize,
            cursorNickname: _following.last.nickname,
          );
        }
      }
    }

    try {
      updateLoading(true);
      if (category == 0) {
        final resp = await repositoryProvider.mypageRepository.getFollowerList(
          memberId: memberId,
          paginateQuery: paginateQuery,
        );
        final lst = resp.result.members;
        _follower = refresh ? [...lst] : [..._follower, ...lst];
        updateHasMore(lst.length >= pageSize);
      } else {
        final resp = await repositoryProvider.mypageRepository.getFollowingList(
          memberId: memberId,
          paginateQuery: paginateQuery,
        );
        final lst = resp.result.members;
        _following = refresh ? [...lst] : [..._following, ...lst];
        updateHasMore(lst.length >= pageSize);
      }
    } catch (e) {
      Exception(e);
    } finally {
      updateLoading(false);
      notifyListeners();
    }
  }
}
