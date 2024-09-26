import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/const/data.dart';
import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';

class HomeProvider extends ChangeNotifier {
  final FeedRepositoryProvider feedRepositoryProvider;

  HomeProvider({
    required this.feedRepositoryProvider,
  });

  List<CoordiPostingPreview> _feedPreviewList = [];

  bool _loadingFeedPreview = true;

  get loadingFeedPreview => _loadingFeedPreview;

  get feedPreviewList => _feedPreviewList;

  Future<void> getPostingPreview() async {
    if (_feedPreviewList.isNotEmpty) return;

    try {
      _loadingFeedPreview = true;
      notifyListeners();
      final resp = await feedRepositoryProvider.dio.get(
        "http://$ip/lyc/feeds/preview",
        options: Options(headers: {"accessToken": "true"}),
      );
      if (resp.data is Map<String, dynamic> &&
          resp.data['result'] is Map<String, dynamic> &&
          resp.data['result']['posting'] is List) {
        final List<dynamic> rawPostings = resp.data['result']['posting'];
        _feedPreviewList = rawPostings
            .map((item) => CoordiPostingPreview.fromJson(item))
            .toList();
      } else {
        _feedPreviewList = [];
      }
      _loadingFeedPreview = false;
      notifyListeners();
    } catch (e) {
      print("에러: $e");
      _loadingFeedPreview = false;
      notifyListeners();
      rethrow;
    }
  }
}
