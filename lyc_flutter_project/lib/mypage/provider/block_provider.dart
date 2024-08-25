import 'package:flutter/material.dart';

class BlockProvider extends ChangeNotifier {
  bool _isBlocked = false;
  bool get isBlocked => _isBlocked;

  toggleBlock() {
    _isBlocked = !_isBlocked;
    notifyListeners();
  }
}