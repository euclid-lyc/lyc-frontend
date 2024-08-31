import 'package:flutter/cupertino.dart';

enum Category {
  myCoordi,
  savedCoordi,
  myCloset
}
// 를 쓰고싶긴 한데 고쳐야할게 너무 많아서
// 일단은 0 1 2 쓰겠음

class CategoryProvider extends ChangeNotifier {
  int _curCategory = 0;
  int get curCategory => _curCategory;

  onSelected(int selected) {
    _curCategory = selected;
    notifyListeners();
  }
}