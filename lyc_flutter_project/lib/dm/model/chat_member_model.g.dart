// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMemberListModel _$ChatMemberListModelFromJson(Map<String, dynamic> json) =>
    ChatMemberListModel(
      members: (json['members'] as List<dynamic>)
          .map((e) => ChatMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatMemberListModelToJson(
        ChatMemberListModel instance) =>
    <String, dynamic>{
      'members': instance.members,
    };

ChatMemberModel _$ChatMemberModelFromJson(Map<String, dynamic> json) =>
    ChatMemberModel(
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String,
      isMine: json['isMine'] as bool,
      isDirector: json['isDirector'] as bool,
    );

Map<String, dynamic> _$ChatMemberModelToJson(ChatMemberModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'isMine': instance.isMine,
      'isDirector': instance.isDirector,
    };
