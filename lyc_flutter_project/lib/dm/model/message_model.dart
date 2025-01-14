import 'package:flutter_chat_bubble/bubble_type.dart';

class MessageModel {
  final String content;
  final BubbleType type;
  final String? image;
  final String createdAt;
  final bool isText;

  const MessageModel({
    required this.content,
    required this.type,
    required this.createdAt,
    required this.isText,
    this.image,
  });
}

class MessageRequest {
  final String content;
  final bool isText;
  final String accessToken;

  MessageRequest({
    required this.content,
    required this.isText,
    required String token,
  }) : accessToken = 'Bearer $token';

  Map<String, dynamic> toJson() => {
    'content': content,
    'isText': isText,
    'accessToken': accessToken,
  };
}

class MessageResponse {
  final String sender;
  final String profileImage;
  final String content;
  final bool isText;
  final bool isChecked;
  final DateTime createdAt;

  MessageResponse({
    required this.sender,
    required this.profileImage,
    required this.content,
    required this.isText,
    required this.isChecked,
    required this.createdAt,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      sender: json['sender'],
      profileImage: json['profileImage'],
      content: json['content'],
      isText: json['isText'],
      isChecked: json['isChecked'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}