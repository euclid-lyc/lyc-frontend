import 'package:json_annotation/json_annotation.dart';

part 'chat_image_model.g.dart';

@JsonSerializable()
class ChatImageModel {
  final int imageId;
  final String imageUrl;
  final String createdAt;

  const ChatImageModel({
    required this.imageId,
    required this.imageUrl,
    required this.createdAt,
  });
  
  factory ChatImageModel.fromJson(Map<String, dynamic> json)
  => _$ChatImageModelFromJson(json);
}

@JsonSerializable()
class ChatImageListModel {
  final List<ChatImageModel> images;

  const ChatImageListModel({
    required this.images,
  });

  factory ChatImageListModel.fromJson(Map<String, dynamic> json)
  => _$ChatImageListModelFromJson(json);
}