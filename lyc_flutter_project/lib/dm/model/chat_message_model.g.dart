// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageListModel _$ChatMessageListModelFromJson(
        Map<String, dynamic> json) =>
    ChatMessageListModel(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatMessageListModelToJson(
        ChatMessageListModel instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      sender: json['sender'] as String,
      profileImage: json['profileImage'] as String,
      content: json['content'] as String,
      isText: json['isText'] as bool,
      isChecked: json['isChecked'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'profileImage': instance.profileImage,
      'content': instance.content,
      'isText': instance.isText,
      'isChecked': instance.isChecked,
      'createdAt': instance.createdAt,
    };
