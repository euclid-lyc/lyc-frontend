import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes_model.freezed.dart';
part 'clothes_model.g.dart';

@freezed
class ClothesModel with _$ClothesModel {
  const factory ClothesModel({
    int? clothesId, // Optional field
    required String imageUrl,
    required String clothesUrl,
  }) = _ClothesModel;

  factory ClothesModel.fromJson(Map<String, dynamic> json) =>
      _$ClothesModelFromJson(json);
}
