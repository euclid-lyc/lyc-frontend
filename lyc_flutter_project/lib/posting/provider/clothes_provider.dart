import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/utils/data_utils.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/posting/model/clothes_posting.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';

class ClothesProvider extends ChangeNotifier {
  final ClothesRepositoryProvider repositoryProvider;
  ClothesPostingImage _postingImage = ClothesPostingImage(
    memberId: cur_member,
  );

  ClothesProvider({
    required this.repositoryProvider,
  });

  void updateImage(XFile image) {
    // _postingImage = _postingImage.copyWith(image: image.path);
    // final file = await DataUtils.pathToMultipart(_postingImage.image!);
    // _postingImage.copyWith(image: image.path);
    _postingImage = ClothesPostingImage(
      memberId: _postingImage.memberId,
      image: image.path,
      title: _postingImage.title,
      text: _postingImage.text,
    );
    print("path: ${_postingImage.image}");
    // print("update image: $text");
    notifyListeners();
  }

  void updateTitle(String text) {
    _postingImage = _postingImage.copyWith(title: text);
    // print("update title: $text");
    notifyListeners();
  }

  void updateContent(String text) {
    _postingImage = _postingImage.copyWith(text: text);
    // print("update content: $text");
    notifyListeners();
  }

  Future<bool> canUploadImage() async {
    // if (_postingImage.memberId != null &&
    //     _postingImage.image != null &&
    //     _postingImage.text != null &&
    //     _postingImage.title != null) {
    //   return true;
    // } else {
    //   return false;
    // }
    if (_postingImage.memberId == null) {
      print("memberId is null");
      return false;
    }
    if (_postingImage.title == null) {
      print("title is null");
      return false;
    }
    if (_postingImage.text == null) {
      print("text is null");
      return false;
    }
    if (_postingImage.image == null) {
      print("image is null");
      return false;
    }
    return true;
  }

  void uploadImage() async {
    if (await canUploadImage()) {
      // final file = await DataUtils.pathToMultipart(_postingImage.image!);
      final clothesByImageDTO = jsonEncode({
        'memberId': _postingImage.memberId!,
        'title': _postingImage.title!,
        'text': _postingImage.text!,
      });

      final image = File(_postingImage.image!);

      await repositoryProvider.repository.uploadPostingImage(
        clothesByImageDTO: clothesByImageDTO,
        image: image,
      );
    }
    else {
      print("can't upload");
    }
  }
}