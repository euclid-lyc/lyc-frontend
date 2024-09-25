import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/model/paginate_query.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/model/profile.dart';
import 'package:lyc_flutter_project/mypage/model/result.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/mypage/widget/director_closet_list.dart';
import 'package:lyc_flutter_project/mypage/widget/director_coordi_grid_view.dart';
import 'package:lyc_flutter_project/mypage/widget/my_coordi_grid_view.dart';
import 'package:lyc_flutter_project/mypage/widget/my_closet_list.dart';

class MypageProviderFactory extends ChangeNotifier {
  final MypageRepositoryProvider mypageRepositoryProvider;
  final int memberId;
  final Map<int, MypageProvider> _providers = {};

  MypageProviderFactory({
    required this.mypageRepositoryProvider,
    required this.memberId,
  });

  MypageProvider getProvider(int memberId, bool isLoginUser) {
    if (memberId == null) Exception;
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

  get listLength => {
        if (_category == 0)
          myCoordi.length
        else if (_category == 1)
          savedCoordi.length
        else
          myCloset.length
      };

  Future<void> save(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository
        .savePosting(postingId: postingId);
    if (resp.isSuccess) {
      getList(type: 1, refresh: true);
    } else {
      Exception(resp.message);
    }
  }

  Future<void> unsave(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository
        .unsavePosting(postingId: postingId);
    if (resp.isSuccess) {
      getList(type: 1, refresh: true);
    } else {
      Exception(resp.message);
    }
  }

  Future<void> like(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository
        .likePosting(postingId: postingId);
    if (!resp.isSuccess) Exception(resp.message);
  }

  Future<void> dislike(int postingId) async {
    final resp = await mypageRepositoryProvider.mypageRepository
        .dislikePosting(postingId: postingId);
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

  Widget renderList() {
    if (getLoading()) {
      const Center(
        child: CustomLoading(),
      );
      notifyListeners();
    }
    switch (_category) {
      case 0:
        return isLoginUser
            ? MyCoordiGridView(
                postings: myCoordi,
                category: 0,
                provider: this,
              )
            : DirectorCoordiGridView(
                postings: myCoordi,
                category: 0,
                provider: this,
              );
      case 1:
        return isLoginUser
            ? MyCoordiGridView(
                postings: savedCoordi,
                category: 1,
                provider: this,
              )
            : DirectorCoordiGridView(
                postings: myCoordi,
                category: 1,
                provider: this,
              );
      case 2:
        return isLoginUser
            ? MyClosetList(
                postings: myCloset,
                provider: this,
                memberId: memberId,
              )
            : DirectorClosetList(
                postings: myCloset,
                provider: this,
                memberId: memberId,
              );
      default:
        return const CustomLoading();
    }
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
    if (getLoading() || !getHasMore()) return;

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
            paginateQuery =
                paginateQuery.copyWith(cursorDateTime: myCoordi.last.createdAt);
          }
        case 1:
          if (savedCoordi.isNotEmpty) {
            paginateQuery = paginateQuery.copyWith(
                cursorDateTime: savedCoordi.last.createdAt);
          }
        case 2:
          if (myCloset.isNotEmpty) {
            paginateQuery =
                paginateQuery.copyWith(cursorDateTime: myCloset.last.createdAt);
          }
      }
    }

    try {
      updateLoading(true);
      switch (type) {
        case 0:
          final ApiResponse<CoordieResult> resp =
              await mypageRepositoryProvider.mypageRepository.getMyCoorides(
            memberId: memberId,
            paginateQuery: paginateQuery,
          );
          myCoordi = refresh
              ? [...resp.result.imageList]
              : [
                  ...myCoordi,
                  ...resp.result.imageList,
                ];
          updateHasMore(resp.result.imageList.length >= pageSize);
        case 1:
          final resp =
              await mypageRepositoryProvider.mypageRepository.getSavedCoordies(
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
          final resp =
              await mypageRepositoryProvider.mypageRepository.getMyCloset(
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
      Exception(e);
    } finally {
      updateLoading(false);
      notifyListeners();
    }
  }
}
