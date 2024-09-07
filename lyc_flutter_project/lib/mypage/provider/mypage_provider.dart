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
  }

  Profile? _profile;
  bool hasProfile = false;

  List<CoordiPostingPreview> myCoordi = [];
  List<CoordiPostingPreview> savedCoordi = [];
  List<ClosetPostingPreview> myCloset = [];

  int _category = 0;

  get profile => _profile;

  get category => _category;

  Future<void> getProfile() async {
    final resp = await mypageRepositoryProvider.mypageRepository
        .getProfile(memberId: cur_member);
    if (resp.isSuccess) {
      _profile = resp.result;
      hasProfile = true;
      notifyListeners();
    } else {
      throw Exception(resp.message);
    }
  }

  void categorySelected(int selected) {
    _category = selected;
    notifyListeners();
  }

  Widget renderList() {
    getList();
    switch (_category) {
      case 0:
        return GridWidgetWithButton(
          postings: myCoordi,
          category: 0,
        );
      case 1:
        return GridWidgetWithButton(
          postings: savedCoordi,
          category: 1,
        );
      case 2:
        return MyClosetList(
          postings: myCloset,
        );
      default:
        return const CustomLoading();
    }
  }

  getList({
    int pageSize = 20,
    String cursorDateTime = "9999-12-31T23:59:59.0000",
  }) async {
    PaginateQuery paginateQuery = PaginateQuery(
      pageSize: pageSize,
      cursorDateTime: cursorDateTime,
    );
    try {
      switch (_category) {
        case 0:
          final ApiResponse<CoordieResult> resp =
              await mypageRepositoryProvider.mypageRepository.getMyCoorides(
            memberId: cur_member,
            paginateQuery: paginateQuery,
          );
          myCoordi = [
            ...myCoordi,
            ...resp.result.imageList,
          ];
          notifyListeners();
        case 1:
          mypageRepositoryProvider.mypageRepository.getSavedCoordies(
            memberId: cur_member,
            paginateQuery: paginateQuery,
          );
        case 2:
          mypageRepositoryProvider.mypageRepository.getMyCloset(
            memberId: cur_member,
            paginateQuery: paginateQuery,
          );
        default:
          Exception();
      }
    } catch (e) {
      Exception(e);
    }
  }
}
