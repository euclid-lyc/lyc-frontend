import 'package:flutter/material.dart';

class FollowProvider extends ChangeNotifier {
  bool _isFollowing = false;
  bool get isFollowing => _isFollowing;

  toggleFollow() {
    _isFollowing = !_isFollowing;
    notifyListeners();
  }
}