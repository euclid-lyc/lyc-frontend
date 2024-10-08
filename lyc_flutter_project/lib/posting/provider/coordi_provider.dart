import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
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

  String? _image;
  String? _content;
  int _minTemp = 0;
  int _maxTemp = 0;
  List<String> _style = [];
  List<Map<String, dynamic>> points = [];

  get minTemp => _minTemp;

  get maxTemp => _maxTemp;

  List<String> get style => _style;

  get image => _image;

  void resetSetting() {
    _maxTemp = 0;
    _maxTemp = 0;
    _style = [];
    points = [];
  }

  void updateMinTemp(int temp) {
    _minTemp = temp;
    notifyListeners();
  }

  void updateMaxTemp(int temp) {
    _maxTemp = temp;
    notifyListeners();
  }

  void updateStyle(String style) {
    if (_style.contains(style)) {
      _style.clear();
    } else {
      _style.clear();
      _style.add(style);
    }
    notifyListeners();
  }

  void updateContent(String content) {
    _content = content;
  }

  void updateImage(String image) {
    _image = image;
    notifyListeners();
  }

  String? checkPostingSetting() {
    if (_style.isEmpty) {
      return "스타일을 선택해주세요";
    }
    return null;
  }

  String? checkPosting() {
    if (_image == null) {
      return "사진을 선택해주세요";
    }
    if (_content == null) {
      return "내용을 입력해주세요";
    }
    if (checkPostingSetting() != null) {
      return "세부설정을 입력해주세요";
    } else {
      return null;
    }
  }

  bool canUpload() {
    if (_image == null) {
      return false;
    }
    if (_content == null) {
      return false;
    }
    if (_style.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> upload() async {
    if (canUpload()) {
      final postingSaveDTO = jsonEncode({
        "minTemp": _minTemp,
        "maxTemp": _maxTemp,
        "style": _style[0],
        "content": _content,
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
        "links": points.expand((map) => map.values).toList(),
      });
      final image = await MultipartFile.fromFile(_image!);
      final imageList = [image];

      await repositoryProvider.repository.uploadImage(
        postingId: postingId,
        linkDTO: linkDTO,
        multipartFiles: imageList,
      );
    }
  }
}
