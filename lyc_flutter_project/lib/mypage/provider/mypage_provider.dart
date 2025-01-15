import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/model/paginate_query.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/model/profile.dart';
import 'package:lyc_flutter_project/mypage/model/result.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';

class MypageProviderFactory extends ChangeNotifier {
  final MypageRepositoryProvider mypageRepositoryProvider;
  final Map<int, MypageProvider> _providers = {};

  MypageProviderFactory({
    required this.mypageRepositoryProvider,
  });

  MypageProvider getProvider(int memberId, bool isLoginUser) {
    if (!_providers.containsKey(memberId)) {
      _providers[memberId] = MypageProvider(
        mypageRepositoryProvider: mypageRepositoryProvider,
        memberId: memberId,
        isLoginUser: isLoginUser,
      );
    }
    return _providers[memberId]!;
  }

  void disposeProvider(int memberId) {
    _providers.remove(memberId)?.dispose();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    for (var provider in _providers.values) {
      provider.dispose();
    }
    _providers.clear();
  }
}

class MypageProvider extends ChangeNotifier {
  final MypageRepositoryProvider mypageRepositoryProvider;
  final int memberId;
  final bool isLoginUser;

  MypageProvider({
    required this.mypageRepositoryProvider,
    required this.memberId,
    required this.isLoginUser,
  }) {
    getProfile();
    getList();
  }

  Profile? _profile;
  bool _hasProfile = false;

  bool _loadingCoordi = false;
  bool _loadingSaved = false;
  bool _loadingCloset = false;

  bool _hasMoreCoordi = true;
  bool _hasMoreSaved = true;
  bool _hasMoreCloset = true;

  List<CoordiPostingPreview> myCoordi = [];
  List<CoordiPostingPreview> savedCoordi = [];
  List<ClosetPostingPreview> myCloset = [];

  List<int> blockMember = [];

  int _category = 0;

  get profile => _profile;

  get category => _category;

  get hasProfile => _hasProfile;

  int get listLength {
    if (_category == 0) {
      return myCoordi.length;
    } else if (_category == 1) {
      return savedCoordi.length;
    } else {
      return myCloset.length;
    }
  }

  get postings {
    if (_category == 0) {
      return myCoordi;
    } else if (_category == 1) {
      return savedCoordi;
    } else {
      return myCloset;
    }
  }

  bool get loading {
    if (_category == 0) {
      return _loadingCoordi;
    } else if (_category == 1) {
      return _loadingSaved;
    } else {
      return _loadingCloset;
    }
  }

  Future<void> save(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository.savePosting(
      postingId: postingId,
    );
    if (resp.isSuccess) {
      getList(type: 1, refresh: true);
    } else {
      Exception(resp.message);
    }
  }

  Future<void> unsave(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository.unsavePosting(
      postingId: postingId,
    );
    if (resp.isSuccess) {
      getList(type: 1, refresh: true);
    } else {
      Exception(resp.message);
    }
  }

  Future<void> like(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository.likePosting(
      postingId: postingId,
    );
    if (!resp.isSuccess) Exception(resp.message);
  }

  Future<void> dislike(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository.dislikePosting(
      postingId: postingId,
    );
    if (!resp.isSuccess) Exception(resp.message);
  }

  bool getLoading() {
    switch (category) {
      case 0:
        return _loadingCoordi;
      case 1:
        return _loadingSaved;
      case 2:
        return _loadingCloset;
      default:
        return true;
    }
  }

  void updateLoading(bool boolean) {
    switch (category) {
      case 0:
        _loadingCoordi = boolean;
      case 1:
        _loadingSaved = boolean;
      case 2:
        _loadingCloset = boolean;
    }
  }

  void updateHasMore(bool boolean) {
    switch (category) {
      case 0:
        _hasMoreCoordi = boolean;
      case 1:
        _hasMoreSaved = boolean;
      case 2:
        _hasMoreCloset = boolean;
    }
  }

  bool getHasMore() {
    switch (category) {
      case 0:
        return _hasMoreCoordi;
      case 1:
        return _hasMoreSaved;
      case 2:
        return _hasMoreCloset;
      default:
        return false;
    }
  }

  Future<bool> getProfile() async {
    final resp = await mypageRepositoryProvider.mypageRepository.getProfile(
      memberId: memberId,
    );
    if (resp.isSuccess) {
      _profile = resp.result;
      _hasProfile = true;
      notifyListeners();
      return true;
    } else {
      throw Exception(resp.message);
    }
  }

  void categorySelected(int selected) {
    _category = selected;
    getList();
    notifyListeners();
  }

  Future<void> refresh() async {
    getList(refresh: true);
  }

  void getList({
    bool refresh = false,
    int type = 5,
    int pageSize = 10,
    String cursorDateTime = "9999-12-31T23:59:59.0000",
  }) async {
    debugPrint("mypage provider: getList: 호출");
    debugPrint("mypage provider: getList: loading=$loading");
    debugPrint("mypage provider: getList: refresh=$refresh");
    debugPrint("mypage provider: getList: 호출");
    if (loading || (!refresh && !getHasMore())) return;
    debugPrint("mypage provider: getList: 시작");

    if (type == 5) {
      type = _category;
    }

    PaginateQuery paginateQuery = PaginateQuery(
      pageSize: pageSize,
      cursorDateTime: cursorDateTime,
    );

    if (!refresh) {
      switch (type) {
        case 0:
          if (myCoordi.isNotEmpty) {
            paginateQuery = paginateQuery.copyWith(
              cursorDateTime: myCoordi.last.createdAt,
            );
          }
        case 1:
          if (savedCoordi.isNotEmpty) {
            paginateQuery = paginateQuery.copyWith(
              cursorDateTime: savedCoordi.last.createdAt,
            );
          }
        case 2:
          if (myCloset.isNotEmpty) {
            paginateQuery = paginateQuery.copyWith(
              cursorDateTime: myCloset.last.createdAt,
            );
          }
      }
    }

    try {
      updateLoading(true);
      debugPrint("mypage provider: getList: 코디 API 호출");
      debugPrint("mypage provider: getList: path=$memberId");
      debugPrint("mypage provider: getList: query=${paginateQuery.pageSize}, ${paginateQuery.cursorDateTime}");
      switch (type) {
        case 0:
          final resp = await mypageRepositoryProvider.mypageRepository.getMyCoordies(
            memberId: memberId,
            paginateQuery: paginateQuery,
          );
          debugPrint("mypage provider: getList: 코디 API 성공");
          myCoordi = refresh
              ? [...resp.result.imageList]
              : [
                  ...myCoordi,
                  ...resp.result.imageList,
                ];
          updateHasMore(resp.result.imageList.length >= pageSize);
          debugPrint("mypage provider: getList: myCoordi=$myCoordi");
        case 1:
          final ApiResponse<CoordiResult> resp = await mypageRepositoryProvider.mypageRepository.getSavedCoordies(
            memberId: memberId,
            paginateQuery: paginateQuery,
          );
          savedCoordi = refresh
              ? [...resp.result.imageList]
              : [
                  ...savedCoordi,
                  ...resp.result.imageList,
                ];
          updateHasMore(resp.result.imageList.length >= pageSize);
        case 2:
          final resp = await mypageRepositoryProvider.mypageRepository.getMyCloset(
            memberId: memberId,
            paginateQuery: paginateQuery,
          );
          myCloset = refresh
              ? [...resp.result.clothesList]
              : [
                  ...myCloset,
                  ...resp.result.clothesList,
                ];
          updateHasMore(resp.result.clothesList.length >= pageSize);
        default:
          throw Exception("카테고리 오류");
      }
    } catch (e) {
      if (e is ApiResponse) {
        debugPrint("mypage privider: getList: 오류: ${e.message}");
      } else {
        debugPrint("mypage privider: getList: 오류: $e");
      }
    } finally {
      updateLoading(false);
      notifyListeners();
    }
  }
}
