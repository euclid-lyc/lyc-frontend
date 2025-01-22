// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    ChatRoomModel(
      commissionId: (json['commissionId'] as num).toInt(),
      chatMembers: ChatMemberListModel.fromJson(
          json['chatMembers'] as Map<String, dynamic>),
      messages: ChatMessageListModel.fromJson(
          json['messages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatRoomModelToJson(ChatRoomModel instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'chatMembers': instance.chatMembers,
      'messages': instance.messages,
    };
