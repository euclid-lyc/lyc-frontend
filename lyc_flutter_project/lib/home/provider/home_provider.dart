import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/feed/repository/feed_repository.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';

class HomeProvider extends ChangeNotifier {
  final FeedRepositoryProvider feedRepositoryProvider;

  HomeProvider({
    required this.feedRepositoryProvider,
  });

  Future<List<CoordiPostingPreview>> getPostingPreview() async {
    try {
      final resp = await feedRepositoryProvider.repository.getFeedPreview();
      print(resp.result);
      return resp.result;
    } catch (e) {
      rethrow;
    }
  }
}
