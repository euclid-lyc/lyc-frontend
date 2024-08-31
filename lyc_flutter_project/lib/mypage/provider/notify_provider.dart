import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifyProvider extends ChangeNotifier {
  List<int> _notifiedIds = [];
  bool isNotified(int memberId) => _notifiedIds.contains(memberId);

  setNotify(int memberId) {
    if (!_notifiedIds.contains(memberId)) {
      _notifiedIds.add(memberId);
    }
    notifyListeners();
  }
}