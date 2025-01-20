import 'package:json_annotation/json_annotation.dart';

part 'chat_member_model.g.dart';

@JsonSerializable()
class ChatMemberListModel {
  final List<ChatMemberModel> members;

  const ChatMemberListModel({
    required this.members,
  });

  ChatMemberListModel defaultValue() {
    return const ChatMemberListModel(members: []);
  }

  factory ChatMemberListModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberListModelFromJson(json);
}

@JsonSerializable()
class ChatMemberModel {
  final String nickname;
  final String profileImage;
  final bool isMine;
  final bool isDirector;

  ChatMemberModel({
    required this.nickname,
    required this.profileImage,
    required this.isMine,
    required this.isDirector,
  });

  static ChatMemberModel defaultValue() {
    return ChatMemberModel(
        nickname: '', profileImage: '', isMine: false, isDirector: false);
  }

  // Factory constructor for creating a new `ChatMemberModel` instance from a map.
  factory ChatMemberModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberModelFromJson(json);

  // Method to convert a `ChatMemberModel` instance into a map.
  Map<String, dynamic> toJson() => _$ChatMemberModelToJson(this);
}
