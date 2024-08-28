import 'package:flutter/material.dart';

class BlockProvider extends ChangeNotifier {
  List<int> _blockedIds = [];
  bool isBlocked(int memberId) => _blockedIds.contains(memberId);

  toggleBlock(int memberId) {
    if (_blockedIds.contains(memberId)) {
      _blockedIds.remove(memberId);
    } else {
      _blockedIds.add(memberId);
      print("blocked $memberId");
    }
    notifyListeners();
  }
}