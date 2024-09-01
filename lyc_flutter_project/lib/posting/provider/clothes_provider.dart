import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/utils/data_utils.dart';
import 'package:lyc_flutter_project/posting/model/clothes_posting.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';

class ClothesProvider extends ChangeNotifier {
  final ClothesRepositoryProvider repositoryProvider;
  ClothesPostingImage _postingImage = ClothesPostingImage();

  ClothesProvider({
    required this.repositoryProvider,
  });

  final ClothesPostingImage _posting = ClothesPostingImage();

  void updateImage(XFile image) {
    final text = DataUtils.xfileToUrl(image);
    _postingImage = _postingImage.copyWith(image: text);
    print("update image: $text");
  }

  void updateTitle(String text) {
    _postingImage = _postingImage.copyWith(title: text);
    print("update title: $text");
  }

  void updateContent(String text) {
    _postingImage = _postingImage.copyWith(text: text);
    print("update content: $text");
  }

  Future<bool> canUploadImage() async {
    if (_postingImage.memberId != null &&
        _postingImage.image != null &&
        _postingImage.text != null &&
        _postingImage.title != null) {
      return true;
    } else {
      return false;
    }
  }

  void uploadImage() async {
    if (await canUploadImage()) {
      await repositoryProvider.repository.uploadPostingImage(posting: _posting);
    }
  }
}
