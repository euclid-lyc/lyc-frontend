import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';

class CoordiProvider extends ChangeNotifier {
  final CoordiRepositoryProvider repositoryProvider;
  final LoginProvider loginProvider;
  late int myId;

  CoordiProvider({
    required this.repositoryProvider,
    required this.loginProvider,
  }) {
    getMyId();
  }

  void getMyId() {
    myId = loginProvider.memberId!;
  }

  CoordiPosting _posting = CoordiPosting(
    minTemp: 0,
    maxTemp: 0,
  );

  List<Map<String, dynamic>> points = [];

  get minTemp => _posting.minTemp;

  get maxTemp => _posting.maxTemp;

  get image => _posting.image;

  get selectedStyle => _posting.style;

  void resetSetting() {
    _posting = CoordiPosting(
      writerId: _posting.writerId,
      image: _posting.image,
      content: _posting.content,
      toMemberId: _posting.toMemberId,
      fromMemberId: _posting.fromMemberId,
      maxTemp: 0,
      minTemp: 0,
    );
  }

  void updateMinTemp(int temp) {
    _posting = _posting.copyWith(minTemp: temp.toDouble());
    notifyListeners();
  }

  void updateMaxTemp(int temp) {
    _posting = _posting.copyWith(maxTemp: temp.toDouble());
    notifyListeners();
  }

  void updateStyle(String style) {
    _posting = _posting.copyWith(style: style);
  }

  void updateContent(String content) {
    _posting = _posting.copyWith(content: content);
  }

  void updateToMemberId(int id) {
    _posting = _posting.copyWith(toMemberId: id);
  }

  void updateImage(String image) {
    _posting = _posting.copyWith(image: image);
    notifyListeners();
  }

  void updateLinkList(String link) {
    if (!_posting.linkList.contains(link)) {
      _posting.linkList.add(link);
    }
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
        "fromMemberId": myId,
        "toMemberId": myId,
        });
      final resp = await repositoryProvider.repository
          .uploadCoordi(postingSaveDTO: postingSaveDTO);
      if (!resp.isSuccess) {
        Exception(resp.message);
        return;
      }

      final postingId = resp.result.postingId;
      final linkDTO = jsonEncode({
        "links": [_posting.linkList],
      });
      final image = await MultipartFile.fromFile(_posting.image!);
      final imageList = [image];

      await repositoryProvider.repository.uploadImage(
        postingId: postingId,
        linkDTO: linkDTO,
        multipartFiles: imageList,
      );
    }
  }
}
