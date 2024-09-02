import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';

class CoordiProvider extends ChangeNotifier {
  final CoordiRepositoryProvider repositoryProvider;
  CoordiPosting _posting = CoordiPosting(
    writerId: cur_member,
    toMemberId: cur_member,
    fromMemberId: cur_member,
  );

  CoordiProvider({required this.repositoryProvider});

  void updateMinTemp(int temp) {
    _posting = _posting.copyWith(minTemp: temp);
    notifyListeners();
    // print("update mintemp: ${_posting.minTemp}");
  }

  void updateMaxTemp(int temp) {
    _posting = _posting.copyWith(maxTemp: temp);
    // print("update maxtemp: ${_posting.maxTemp}");
  }

  void styleToNull() {
    _posting = CoordiPosting(
      fromMemberId: _posting.fromMemberId,
      toMemberId: _posting.toMemberId,
      style: null,
      content: _posting.content,
      maxTemp: _posting.maxTemp,
      minTemp: _posting.minTemp,
      image: _posting.image,
      writerId: _posting.writerId,
    );
    // print("style to null: ${_posting.style}");
  }

  void updateStyle(String style) {
    _posting = _posting.copyWith(style: style);
    // print("update style: ${_posting.style}");
  }

  void updateContent(String content) {
    _posting = _posting.copyWith(content: content);
    // print("update content: ${_posting.content}");
  }

  void updateToMemberId(int id) {
    _posting = _posting.copyWith(toMemberId: id);
    // print("update toMemberId: ${_posting.toMemberId}");
  }

  void updateImage(String image) {_posting = CoordiPosting(
    fromMemberId: _posting.fromMemberId,
    toMemberId: _posting.toMemberId,
    style: _posting.style,
    content: _posting.content,
    maxTemp: _posting.maxTemp,
    minTemp: _posting.minTemp,
    image: image,
    writerId: _posting.writerId,
  );
    // print("update image: ${_posting.image}");
  }

  void updateLinkList(String link) {
    if (!_posting.linkList.contains(link)) {
      _posting.linkList.add(link);
    }
    // print("update linkList: ${_posting.linkList}");
  }
}
