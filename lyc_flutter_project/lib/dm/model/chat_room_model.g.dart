// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    ChatRoomModel(
      commissionId: (json['commissionId'] as num).toInt(),
      chatMembers: (json['chatMembers'] as List<dynamic>)
          .map((e) => ChatMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatRoomModelToJson(ChatRoomModel instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'chatMembers': instance.chatMembers,
      'messages': instance.messages,
    };
