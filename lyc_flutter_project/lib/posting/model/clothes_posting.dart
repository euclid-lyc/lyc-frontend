import 'package:json_annotation/json_annotation.dart';

part 'clothes_posting.g.dart';

@JsonSerializable()
class ClothesPostingImage {
  final int? memberId;
  final String? image;
  final String? text;
  final String? title;

  ClothesPostingImage({
    this.memberId,
    this.image,
    this.text,
    this.title,
  });

  factory ClothesPostingImage.fromJson(Map<String, dynamic> json) =>
      _$ClothesPostingImageFromJson(json);

  Map<String, dynamic> toJson() => _$ClothesPostingImageToJson(this);

  ClothesPostingImage copyWith({
    int? memberId,
    String? image,
    String? text,
    String? title,
  }) {
    return ClothesPostingImage(
      memberId: memberId ?? this.memberId,
      image: image ?? this.image,
      text: text ?? this.text,
      title: title ?? this.title,
    );
  }
}

@JsonSerializable()
class ClothesPostingImageResult {
  final int memberId;
  final int clothesId;
  final int clothesImageId;
  final String image;
  final String text;

  ClothesPostingImageResult({
    required this.memberId,
    required this.clothesId,
    required this.clothesImageId,
    required this.image,
    required this.text,
  });

  factory ClothesPostingImageResult.fromJson(Map<String, dynamic> json) =>
      _$ClothesPostingImageResultFromJson(json);
}
