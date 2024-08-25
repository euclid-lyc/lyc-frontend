import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifyProvider extends ChangeNotifier {
  bool _isNotified = false;
  bool get isNotified => _isNotified;

  setNotify() {
    _isNotified = true;
    notifyListeners();
  }
}