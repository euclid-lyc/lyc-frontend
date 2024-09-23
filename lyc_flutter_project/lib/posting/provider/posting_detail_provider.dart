import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';

class PostingDetailProviderFactory extends ChangeNotifier {
  final MypageRepositoryProvider mypageRepositoryProvider;
  final CoordiRepositoryProvider coordiRepositoryProvider;
  final Map<int, PostingDetailProvider> _providers = {};

  PostingDetailProviderFactory({
    required this.mypageRepositoryProvider,
    required this.coordiRepositoryProvider,
  });

  PostingDetailProvider getProvider(int postingId) {
    if (!_providers.containsKey(postingId)) {
      _providers[postingId] = PostingDetailProvider(
        mypageRepositoryProvider: mypageRepositoryProvider,
        coordiRepositoryProvider: coordiRepositoryProvider,
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
  final MypageRepositoryProvider mypageRepositoryProvider;
  final CoordiRepositoryProvider coordiRepositoryProvider;
  final int postingId;

  PostingDetailProvider({
    required this.mypageRepositoryProvider,
    required this.coordiRepositoryProvider,
    required this.postingId,
  });

  bool isLiked = false;
  bool isSaved = false;
  bool isMyPosting = false;

  bool initialized = false;
  CoordiPostingResult? _posting;

  bool loadingState = true;

  get posting => _posting;

  Future<CoordiPostingResult> initialize(bool isMyPosting) async {
    this.isMyPosting = isMyPosting;
    final lResp = await coordiRepositoryProvider.repository
        .getLikedStatus(postingId: postingId);
    isLiked = lResp.result;
    if (!isMyPosting) {
      final sResp = await coordiRepositoryProvider.repository
          .getSaveStatus(postingId: postingId);
      isSaved = sResp.result;
    }
    if (_posting == null) {
      getDetail();
    }
    notifyListeners();
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
      mypageRepositoryProvider.mypageRepository.dislikePosting(
        postingId: postingId,
      );
    } else {
      isLiked = true;
      notifyListeners();
      mypageRepositoryProvider.mypageRepository.likePosting(
        postingId: postingId,
      );
    }
  }

  void pressSave() {
    if (isSaved) {
      isSaved = false;
      notifyListeners();
      mypageRepositoryProvider.mypageRepository.unsavePosting(
        postingId: postingId,
      );
    } else {
      isSaved = true;
      notifyListeners();
      mypageRepositoryProvider.mypageRepository.savePosting(
        postingId: postingId,
      );
    }
  }

  Future<void> delete() async {
    final resp = await mypageRepositoryProvider.mypageRepository.deleteCoordi(
      postingId: postingId,
    );
    if (!resp.isSuccess) {
      Exception(resp.message);
    }
  }

  Future<void> getDetail() async {
    try {
      if (_posting == null) {
        final resp = await mypageRepositoryProvider.mypageRepository.getCoordi(
          postingId: postingId,
        );
        _posting = resp.result;
        loadingState = false;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
