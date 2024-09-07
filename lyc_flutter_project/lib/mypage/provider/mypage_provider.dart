import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/model/paginate_query.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/model/profile.dart';
import 'package:lyc_flutter_project/mypage/model/result.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/mypage/widget/grid_widget_with_button.dart';
import 'package:lyc_flutter_project/mypage/widget/my_closet_list.dart';

class MypageProvider extends ChangeNotifier {
  final MypageRepositoryProvider mypageRepositoryProvider;

  MypageProvider({
    required this.mypageRepositoryProvider,
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

  List<String> likedCoordi = [];
  List<String> blockMember = [];

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

  Future<void> getProfile() async {
    final resp = await mypageRepositoryProvider.mypageRepository
        .getProfile(memberId: cur_member);
    if (resp.isSuccess) {
      _profile = resp.result;
      _hasProfile = true;
      notifyListeners();
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
        return GridWidgetWithButton(
          postings: myCoordi,
          category: 0,
          provider: this,
        );
      case 1:
        return GridWidgetWithButton(
          postings: savedCoordi,
          category: 1,
          provider: this,
        );
      case 2:
        return MyClosetList(
          postings: myCloset,
          provider: this,
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
    int pageSize = 10,
    String cursorDateTime = "9999-12-31T23:59:59.0000",
  }) async {
    if (getLoading() || !getHasMore()) return;

    PaginateQuery paginateQuery = PaginateQuery(
      pageSize: pageSize,
      cursorDateTime: cursorDateTime,
    );

    if (!refresh) {
      switch (_category) {
        case 0:
          if (myCoordi.isNotEmpty) {
            paginateQuery.copyWith(cursorDateTime: myCoordi.last.createdAt);
          }
        case 1:
          if (savedCoordi.isNotEmpty) {
            paginateQuery.copyWith(cursorDateTime: savedCoordi.last.createdAt);
          }
        case 2:
          if (myCloset.isNotEmpty) {
            paginateQuery.copyWith(cursorDateTime: myCloset.last.createdAt);
          }
      }
    }

    try {
      updateLoading(true);
      switch (_category) {
        case 0:
          final ApiResponse<CoordieResult> resp =
              await mypageRepositoryProvider.mypageRepository.getMyCoorides(
            memberId: cur_member,
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
            memberId: cur_member,
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
            memberId: cur_member,
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
          Exception();
      }
    } catch (e) {
      Exception(e);
    } finally {
      updateLoading(false);
      notifyListeners();
    }
  }
}
