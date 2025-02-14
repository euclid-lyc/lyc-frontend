import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/director/model/director_ranking.dart';
import 'package:lyc_flutter_project/director/repository/director_repository.dart';
import 'package:lyc_flutter_project/search/model/search_directors_general_model.dart';
import 'package:lyc_flutter_project/search/repository/search_repository.dart';

class DirectorProvider extends ChangeNotifier {
  final DirectorRepository directorRepository;
  final SearchRepository searchRepository;

  DirectorProvider({
    required this.directorRepository,
    required this.searchRepository,
  }) {
    getRanking();
  }

  String _term = "";
  String? _generalSearchMessage;

  bool _loading = false;
  bool _hasMore = true;
  bool _loadingGeneralSearch = false;
  bool _showGeneralSearchResult = false;

  List<DirectorRanking> _directors = [];
  List<SearchDirectorsGeneralModel> _generalSearchResult = [];

  get loading => _loading;

  get directors => _directors;

  List<SearchDirectorsGeneralModel> get generalSearchResult => _generalSearchResult;

  bool get loadingGeneralSearch => _loadingGeneralSearch;

  bool get showGeneralSearchResult => _showGeneralSearchResult;

  String? get generalSearchMessage => _generalSearchMessage;

  Future<void> refreshRanking() async {
    await getRanking(refresh: true);
  }

  Future<void> getRanking({
    bool refresh = false,
    int pageSize = 10,
    int? followerCount,
  }) async {
    if (_loading || (!refresh && !_hasMore)) return;

    if (!refresh && _directors.isNotEmpty) {
      followerCount = _directors.last.followerCount;
    }

    try {
      _loading = true;
      notifyListeners();
      final resp = await directorRepository.getDirectorRanking(
        pageSize: pageSize,
        followerCount: followerCount,
      );
      final list = resp.result.directors;
      _directors = refresh
          ? [...list]
          : [
              ..._directors,
              ...list,
            ];
      _hasMore = list.length >= pageSize;
    } catch (e) {
      if (e is ApiResponse) {
        debugPrint("error in getRanking: ${e.message}");
      } else {
        debugPrint("error in getRanking");
      }
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> searchGeneral() async {
    if (_loadingGeneralSearch) return;
    _loadingGeneralSearch = true;
    try {
      final result = await searchRepository.searchDirectorGeneral(term: _term);
        _generalSearchResult = [...result.result.members];
        _showGeneralSearchResult = true;
        _generalSearchMessage = null;
    } catch (e) {
        _generalSearchMessage = '사용자를 찾을 수 없습니다';
        debugPrint("디렉터: searchGeneral: ${e.toString()}");
      _loadingGeneralSearch = false;
    } finally {
      _loadingGeneralSearch = false;
      _showGeneralSearchResult = true;
      notifyListeners();
    }
  }

  void onTermChanged({required String term}) {
    _term = term;
  }
}
