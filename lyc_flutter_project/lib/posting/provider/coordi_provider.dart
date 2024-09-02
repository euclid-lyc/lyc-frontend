import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';

class CoordiProvider extends ChangeNotifier {
  final CoordiRepositoryProvider repositoryProvider;
  CoordiPosting _posting = CoordiPosting(writerId: cur_member);

  CoordiProvider({required this.repositoryProvider});

  void updateMinTemp(int temp) {
    _posting = _posting.copyWith(minTemp: temp);
  }

  void updateMaxTemp(int temp) {
    _posting = _posting.copyWith(maxTemp: temp);
  }

  void updateStyle(String style) {
    _posting = _posting.copyWith(style: style);
  }

  void updateToMemberId(int id) {
    _posting = _posting.copyWith(toMemberId: id);
  }

  void updateImage(String image) {
    _posting = _posting.copyWith(image: image);
  }

  void updateLinkList(String link) {
    if (_posting.linkList.contains(link)) {
      _posting.linkList.remove(link);
    }
    _posting.linkList.add(link);
  }
}
