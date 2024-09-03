import 'dart:convert';

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
    minTemp: 0,
    maxTemp: 0,
    content: "",
    image: "",
    style: "",
  );

  CoordiProvider({required this.repositoryProvider});

  List<Map<String, dynamic>> points = [];

  get minTemp => _posting.minTemp;

  get maxTemp => _posting.maxTemp;

  get image => _posting.image;

  get selectedStyle => _posting.style;

  void onStyleButtonPressed(String element) {
    if (_posting.style == element) {
      styleToNull();
    } else {
      updateStyle(element);
    }
  }

  void resetSetting() {
    _posting = CoordiPosting(
      writerId: _posting.writerId,
      image: _posting.image,
      content: _posting.content,
      toMemberId: _posting.toMemberId,
      fromMemberId: _posting.fromMemberId,
    );
  }

  void updateMinTemp(int temp) {
    _posting = _posting.copyWith(minTemp: temp);
    notifyListeners();
    // print("update mintemp: ${_posting.minTemp}");
  }

  void updateMaxTemp(int temp) {
    _posting = _posting.copyWith(maxTemp: temp);
    notifyListeners();
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
    print("update style: ${_posting.style}");
  }

  void updateContent(String content) {
    _posting = _posting.copyWith(content: content);
    // print("update content: ${_posting.content}");
  }

  void updateToMemberId(int id) {
    _posting = _posting.copyWith(toMemberId: id);
    // print("update toMemberId: ${_posting.toMemberId}");
  }

  void updateImage(String image) {
    _posting = _posting.copyWith(image: image);
    notifyListeners();
    print("update image: ${_posting.image}");
  }

  void updateLinkList(String link) {
    if (!_posting.linkList.contains(link)) {
      _posting.linkList.add(link);
    }
    // print("update linkList: ${_posting.linkList}");
  }

  bool canUpload() {
    if (_posting.image == null) {
      print("image is null");
      return false;
    }
    if (_posting.content == null) {
      print("content is null");
      return false;
    }
    if (_posting.minTemp == null) {
      print("minTemp is null");
      return false;
    }
    if (_posting.maxTemp == null) {
      print("maxTemp is null");
      return false;
    }
    if (_posting.style == null) {
      print("style is null");
      return false;
    }
    return true;
  }

  Future<void> upload() async {
    if (canUpload()) {
      final postingSaveDTO = jsonEncode({
        "minTemp": _posting.minTemp,
        "maxTemp": _posting.maxTemp,
        "style": _posting.style,
        "content": _posting.content,
        "fromMemberId": _posting.fromMemberId,
        "toMemberId": _posting.toMemberId,
        "writerId": _posting.writerId,
      });
      final resp = await repositoryProvider.repository
          .uploadCoordi(postingSaveDTO: postingSaveDTO);
      if (!resp.isSuccess) {
        print(resp.message);
        return;
      }
      final postingId = resp.result.postingId;
      final linkDTO = jsonEncode({
        "image": _posting.image,
        "links": _posting.linkList,
      });
      await repositoryProvider.repository.uploadImage(
        postingId: postingId,
        linkDTO: linkDTO,
      );
    }
  }
}
