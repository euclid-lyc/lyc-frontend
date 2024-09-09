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
  CoordiPostingResult? _posting;

  bool loadingState = true;

  get posting => _posting;

  Future<CoordiPostingResult> initialize() async {
    if (_posting == null) {
      getDetail();
    }
    return _posting!;
  }

  void setLoadingState() {
    loadingState = true;
    notifyListeners();
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
    if (!resp.isSuccess) {
      Exception(resp.message);
    }
  }

  Future<void> getDetail() async {
    try {
      if (_posting == null) {
        final resp = await mypageProvider
            .mypageRepositoryProvider.mypageRepository
            .getCoordi(postingId: postingId);
        _posting = resp.result;
        loadingState = false;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
