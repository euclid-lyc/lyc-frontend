import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';

class PostingDetailProviderFactory extends ChangeNotifier {
  final MypageProvider mypageProvider;
  final Map<int, PostingDetailProvider> _providers = {};

  PostingDetailProviderFactory({required this.mypageProvider});

  PostingDetailProvider getProvider(int postingId) {
    if (!_providers.containsKey(postingId)) {
      _providers[postingId] = PostingDetailProvider(
        mypageProvider: mypageProvider,
        postingId: postingId,
      );
    }
    return _providers[postingId]!;
  }

  void disposeProvider(int postingId) {
    _providers.remove(postingId)?.dispose();
    notifyListeners();
  }

  @override
  void dispose() {
    for (var provider in _providers.values) {
      provider.dispose();
    }
    _providers.clear();
    super.dispose();
  }
}

class PostingDetailProvider extends ChangeNotifier {
  final MypageProvider mypageProvider;
  final int postingId;

  PostingDetailProvider({
    required this.mypageProvider,
    required this.postingId,
  });

  bool isLiked = false;
  bool isSaved = false;

  bool initialized = false;

  Future<CoordiPostingResult> initialize(int postingId) async {
    return getDetail();
  }

  void pressLike() {
    if (isLiked) {
      isLiked = false;
      notifyListeners();
      mypageProvider.dislike(postingId);
    } else {
      isLiked = true;
      notifyListeners();
      mypageProvider.like(postingId);
    }
  }

  void pressSave() {
    if (isSaved) {
      isSaved = false;
      notifyListeners();
      mypageProvider.unsave(postingId);
    } else {
      isSaved = true;
      notifyListeners();
      mypageProvider.save(postingId);
    }
  }

  Future<void> delete() async {
    final resp = await mypageProvider.mypageRepositoryProvider.mypageRepository
        .deleteCoordi(postingId: postingId);
    if (resp.isSuccess) {
      mypageProvider.getList(refresh: true, type: 0);
    } else {
      Exception(resp.message);
    }
  }

  Future<CoordiPostingResult> getDetail() async {
    try {
      final resp = await mypageProvider
          .mypageRepositoryProvider.mypageRepository
          .getCoordi(postingId: postingId);
      return resp.result;
    } catch (e) {
      rethrow;
    }
  }
}
