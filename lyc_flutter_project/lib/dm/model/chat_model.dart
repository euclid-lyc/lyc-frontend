import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatListModel {
  List<ChatModel> chats;

  ChatListModel({
    required this.chats,
  });
  
  factory ChatListModel.fromJson(Map<String, dynamic> json)
  => _$ChatListModelFromJson(json);
}

@JsonSerializable()
class ChatModel {
  final int chatId;
  final String nickname;
  final String loginId;
  final String profileImage;
  final bool isText;
  final String content;
  final String createdAt;

  ChatModel({
    required this.chatId,
    required this.nickname,
    required this.loginId,
    required this.profileImage,
    required this.isText,
    required this.content,
    required this.createdAt,
  });

  ChatModel copyWith({
    int? chatId,
    String? nickname,
    String? loginId,
    String? profileImage,
    bool? isText,
    String? content,
    String? createdAt,
  }) {
    return ChatModel(
      chatId: chatId ?? this.chatId,
      nickname: nickname ?? this.nickname,
      loginId: loginId ?? this.loginId,
      profileImage: profileImage ?? this.profileImage,
      isText: isText ?? this.isText,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
  
  factory ChatModel.fromJson(Map<String, dynamic> json)
  => _$ChatModelFromJson(json);
}
