import 'package:json_annotation/json_annotation.dart';

part 'clothes_posting.g.dart';

@JsonSerializable()
class ClothesPostingImage {
  final int? memberId;
  @JsonKey(ignore: true)
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
class ClothesPostingText {
  final String? title;
  final String? text;
  final String? material;
  final String? fit;

  ClothesPostingText({
    this.title,
    this.text,
    this.material,
    this.fit,
  });

  factory ClothesPostingText.fromJson(Map<String, dynamic> json) =>
      _$ClothesPostingTextFromJson(json);

  Map<String, dynamic> toJson() => _$ClothesPostingTextToJson(this);
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

@JsonSerializable()
class ClothesPostingTextResult {
  final int memberId;
  final int clothesId;
  final int clothesTextId;
  final String title;
  final String material;
  final String fit;
  final String text;

  ClothesPostingTextResult({
    required this.memberId,
    required this.clothesId,
    required this.clothesTextId,
    required this.title,
    required this.material,
    required this.fit,
    required this.text,
  });
  
  factory ClothesPostingTextResult.fromJson(Map<String, dynamic> json)
  => _$ClothesPostingTextResultFromJson(json);
}
