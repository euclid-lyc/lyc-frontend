// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_chats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchChatsListModel _$SearchChatsListModelFromJson(
        Map<String, dynamic> json) =>
    SearchChatsListModel(
      chats: (json['chats'] as List<dynamic>)
          .map((e) => SearchChatsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchChatsListModelToJson(
        SearchChatsListModel instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };

SearchChatsModel _$SearchChatsModelFromJson(Map<String, dynamic> json) =>
    SearchChatsModel(
      chatId: (json['chatId'] as num).toInt(),
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      profileImage: json['profileImage'] as String,
      isText: json['isText'] as bool,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$SearchChatsModelToJson(SearchChatsModel instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'profileImage': instance.profileImage,
      'isText': instance.isText,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };
