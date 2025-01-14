import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/director/model/director_ranking.dart';
import 'package:lyc_flutter_project/director/repository/director_repository.dart';
import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';

class HomeProvider extends ChangeNotifier {
  final FeedRepositoryProvider feedRepositoryProvider;
  final DirectorRepository directorRepository;

  HomeProvider({
    required this.feedRepositoryProvider,
    required this.directorRepository,
  });

  List<CoordiPostingPreview> _feedPreviewList = [];

  bool _loadingFeedPreview = true;

  get loadingFeedPreview => _loadingFeedPreview;

  List<CoordiPostingPreview> get feedPreviewList => _feedPreviewList;

  List<DirectorRanking> _directorList = [];
  List<DirectorRanking> get directors => _directorList;

  Future<void> getPostingPreview() async {
    if (_feedPreviewList.isNotEmpty) return;

    _loadingFeedPreview = true;
    notifyListeners();

    try {
      final resp = await feedRepositoryProvider.dio.get(
        "http://$ip/lyc/feeds/preview",
        options: Options(headers: {"accessToken": "true"}),
      );

      if (resp.data is Map<String, dynamic> && resp.data['result'] is Map<String, dynamic> && resp.data['result']['posting'] is List) {
        final List<dynamic> rawPostings = resp.data['result']['posting'];
        _feedPreviewList = rawPostings.map((item) => CoordiPostingPreview.fromJson(item)).toList();
      } else {
        _feedPreviewList = [];
      }
    } catch (e) {
      debugPrint("에러: $e");
      _feedPreviewList = [];
    } finally {
      _loadingFeedPreview = false;
      notifyListeners();
    }
  }

  void getDirectors() async {
    try {
      final ApiResponse<DirectorRankingList> result = await directorRepository.getDirectorRanking(pageSize: 10);
      _directorList = result.result.directors;
    } catch (e) {
      debugPrint('홈: 디렉터 불러오기 오류: e');
    }
  }
}
