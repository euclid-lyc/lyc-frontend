import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/director/model/director_ranking.dart';
import 'package:lyc_flutter_project/director/repository/director_repository.dart';

class DirectorProvider extends ChangeNotifier {
  final DirectorRepositoryProvider repositoryProvider;

  DirectorProvider({
    required this.repositoryProvider,
  }) {
    getRanking();
  }

  bool _loading = false;
  bool _hasMore = true;

  List<DirectorRanking> _directors = [];

  get loading => _loading;

  get directors => _directors;

  Future<void> refreshRanking() async {
    await getRanking(refresh: true);
  }

  Future<void> getRanking({
    bool refresh = false,
    int pageSize = 10,
    int? followerCount,
  }) async {
    if (_loading || !_hasMore) return;

    if (!refresh && _directors.isNotEmpty) {
      followerCount = _directors.last.followerCount;
    }

    try {
      _loading = true;
      notifyListeners();
      final resp = await repositoryProvider.repository.getDirectorRanking(
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
        print("error in getRanking: ${e.message}");
      } else {
        print("error in getRanking");
      }
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
