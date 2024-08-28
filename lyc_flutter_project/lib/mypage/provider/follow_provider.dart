import 'package:flutter/material.dart';

class FollowProvider extends ChangeNotifier {
  List<int> _followedIds = [];
  bool isFollowing(int memberId) => _followedIds.contains(memberId);

  toggleFollow(int memberId) {
    if (_followedIds.contains(memberId)) {
      _followedIds.remove(memberId);
    } else {
      _followedIds.add(memberId);
    }
    notifyListeners();
  }
}