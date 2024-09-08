import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostingDetailProvider extends ChangeNotifier {
  final MypageProvider mypageProvider;
  late SharedPreferences pref;

  PostingDetailProvider({
    required this.mypageProvider,
  }) {
    getPref();
  }

  int postingId = 0;
  bool isLiked = false;
  bool isSaved = false;

  List<String>? likedPostings;

  Future<CoordiPostingResult> initialize(int postingId) async {
    postingId = postingId;
    isLiked = await checkLiked(postingId);
    isSaved = mypageProvider.isSaved(postingId);
    print("initialized $postingId, liked: $isLiked, saved: $isSaved");
    return getDetail();
  }

  Future<void> getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> getLikedList() async {
    likedPostings = pref.getStringList("likedPostings");
  }

  Future<bool> checkLiked(int postingId) async {
    String id = postingId.toString();
    getLikedList();
    if (likedPostings == null) {
      return false;
    } else {
      return likedPostings!.contains(id);
    }
  }

  Future<void> addLike(int postingId) async {
    String id = postingId.toString();
    if (likedPostings == null) {
      likedPostings = [id];
    } else {
      likedPostings!.add(id);
    }
    pref.setStringList("likedPostings", likedPostings!);
  }

  Future<void> removeLike(int postingId) async {
    String id = postingId.toString();
    if (likedPostings != null) {
      if (likedPostings!.contains(id)) {
        likedPostings!.remove(id);
        pref.setStringList("likedPostings", likedPostings!);
      }
    }
  }

  void pressLike() {
    isLiked = !isLiked;
    notifyListeners();
    if (isLiked) {
      removeLike(postingId);
      mypageProvider.dislike(postingId);
    } else {
      addLike(postingId);
      mypageProvider.like(postingId);
    }
  }

  void pressSave() {
    isLiked = !isLiked;
    notifyListeners();
    if (isSaved) {
      mypageProvider.unsave(postingId);
    } else {
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
      print("get detail");
      final resp = await mypageProvider
          .mypageRepositoryProvider.mypageRepository
          .getCoordi(postingId: postingId);
      return resp.result;
    } catch (e) {
      rethrow;
    }
  }
}
