// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatListModel _$ChatListModelFromJson(Map<String, dynamic> json) =>
    ChatListModel(
      chats: (json['chats'] as List<dynamic>)
          .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatListModelToJson(ChatListModel instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      chatId: (json['chatId'] as num).toInt(),
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      profileImage: json['profileImage'] as String,
      isText: json['isText'] as bool,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'chatId': instance.chatId,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'profileImage': instance.profileImage,
      'isText': instance.isText,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };
