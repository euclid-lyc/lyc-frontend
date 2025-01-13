// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatImageModel _$ChatImageModelFromJson(Map<String, dynamic> json) =>
    ChatImageModel(
      imageId: (json['imageId'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ChatImageModelToJson(ChatImageModel instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
    };

ChatImageListModel _$ChatImageListModelFromJson(Map<String, dynamic> json) =>
    ChatImageListModel(
      images: (json['images'] as List<dynamic>)
          .map((e) => ChatImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatImageListModelToJson(ChatImageListModel instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
