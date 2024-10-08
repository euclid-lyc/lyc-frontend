import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/posting/model/clothes_posting.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';

class ClothesProvider extends ChangeNotifier {
  final ClothesRepositoryProvider repositoryProvider;
  final int memberId;
  late ClothesPostingImage _postingImage;
  late ClothesPostingText _postingText;

  ClothesProvider({
    required this.repositoryProvider,
    required this.memberId,
  }) {
    _postingImage = ClothesPostingImage(
      memberId: memberId,
    );
    _postingText = ClothesPostingText(
      title: "",
      text: "",
      material: "",
      fit: "",
    );
  }

  void iUpdateImage(XFile image) {
    _postingImage = ClothesPostingImage(
      memberId: _postingImage.memberId,
      image: image.path,
      title: _postingImage.title,
      text: _postingImage.text,
    );
    notifyListeners();
  }

  void iUpdateTitle(String text) {
    _postingImage = _postingImage.copyWith(title: text);
    notifyListeners();
  }

  void iUpdateContent(String text) {
    _postingImage = _postingImage.copyWith(text: text);
    notifyListeners();
  }

  void tUpdateTitle(String text) {
    _postingText = _postingText.copyWith(title: text);
    notifyListeners();
  }

  void tUpdateText(String text) {
    _postingText = _postingText.copyWith(text: text);
    notifyListeners();
  }

  void tUpdateMaterial(String text) {
    _postingText = _postingText.copyWith(material: text);
    notifyListeners();
  }

  void tUpdateFit(String text) {
    _postingText = _postingText.copyWith(fit: text);
    notifyListeners();
    print(_postingText.fit);
  }

  Future<bool> canUploadImage() async {
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

  bool canUploadText() {
    if (_postingText.title == "") {
      print("title is null");
      return false;
    }
    if (_postingText.material == "") {
      print("material is null");
      return false;
    }
    if (_postingText.fit == "") {
      print("fit is null");
      return false;
    }
    if (_postingText.text == "") {
      print("text is null");
      return false;
    }
    return true;
  }

  void uploadImage() async {
    if (await canUploadImage()) {
      final clothesByImageDTO = jsonEncode({
        'title': _postingImage.title!,
        'text': _postingImage.text!,
      });

      final image = File(_postingImage.image!);

      await repositoryProvider.repository.uploadPostingImage(
        clothesByImageDTO: clothesByImageDTO,
        image: image,
      );
    } else {
      print("can't upload");
    }
  }

  void uploadText() async {
    if (canUploadText()) {
      await repositoryProvider.repository.uploadPostingText(
        posting: _postingText,
      );
    } else {
      print("can't upload");
    }
  }
}
