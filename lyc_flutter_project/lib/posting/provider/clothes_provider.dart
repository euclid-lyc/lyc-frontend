import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/posting/model/clothes_posting.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';

class ClothesProvider extends ChangeNotifier {
  final ClothesRepositoryProvider repositoryProvider;

  ClothesProvider({
    required this.repositoryProvider,
  });

  final ClothesPostingImage _posting = ClothesPostingImage(
      text: "안녕", image: "string", memberId: 1, title: "안녕안녕요");

  uploadImage() async {
    await repositoryProvider.repository.uploadPostingImage(posting: _posting);
  }
}
