import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/mypage/model/follow_model.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';

class FollowProvider extends ChangeNotifier {
  final MypageRepositoryProvider repositoryProvider;

  FollowProvider({required this.repositoryProvider});

  bool _isFollower = true;
  List<FollowListModel> follower = [];
  List<FollowListModel> following = [];

  bool _loadingFollower = false;
  bool _loadingFollowing = false;

  bool _hasMoreFollower = true;
  bool _hasMoreFollowing = true;

  get isFollower => _isFollower;

  void setCategory({bool? isFollower}) {
    if (isFollower != null) {
      _isFollower = isFollower;
    } else {
      if (_isFollower) {
        _isFollower = false;
      } else {
        _isFollower = true;
      }
    }
    getList();
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

  Future<List<FollowListModel>> renderList() async {
    await getList();
    return _isFollower ? follower : following;
  }

  Future<void> getList({
    bool refresh = false,
    int pageSize = 10,
    String? cursorNickname,
  }) async {
    if (getLoading() || !getHasMore()) return;

    FollowPaginateQuery paginateQuery = FollowPaginateQuery(
      pageSize: pageSize,
    );

    if (!refresh) {
      if (_isFollower) {
        if (follower.isNotEmpty) {
          paginateQuery = FollowMorePaginateQuery(pageSize: pageSize, cursorNickname: follower.last.nickname);
        }
      } else {
        if (following.isNotEmpty) {
          paginateQuery = FollowMorePaginateQuery(pageSize: pageSize, cursorNickname: following.last.nickname);
        }
      }
    }

    try {
      updateLoading(true);
      if (_isFollower) {
        final resp = await repositoryProvider.mypageRepository.getFollowerList(
          memberId: cur_member,
          paginateQuery: paginateQuery,
        );
        final lst = resp.result.members;
        follower = refresh ? [...follower] : [...follower, ...lst];
        updateHasMore(lst.length >= pageSize);
      } else {
        final resp = await repositoryProvider.mypageRepository.getFollowingList(
          memberId: cur_member,
          paginateQuery: paginateQuery,
        );
        final lst = resp.result.members;
        follower = refresh ? [...following] : [...following, ...lst];
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
