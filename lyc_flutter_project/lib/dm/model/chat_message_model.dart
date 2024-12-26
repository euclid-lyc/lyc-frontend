import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageListModel {
  final List<ChatMessageModel> messages;

  const ChatMessageListModel({
    required this.messages,
  });
  
  factory ChatMessageListModel.fromJson(Map<String, dynamic> json)
  => _$ChatMessageListModelFromJson(json);
}

@JsonSerializable()
class ChatMessageModel {
  final String sender;
  final String profileImage;
  final String content;
  final bool isText;
  final bool isChecked;
  final String createdAt;

  const ChatMessageModel({
    required this.sender,
    required this.profileImage,
    required this.content,
    required this.isText,
    required this.isChecked,
    required this.createdAt,
  });
  
  factory ChatMessageModel.fromJson(Map<String, dynamic> json)
  => _$ChatMessageModelFromJson(json);
}
