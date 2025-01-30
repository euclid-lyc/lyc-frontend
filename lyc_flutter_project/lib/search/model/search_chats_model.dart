import 'package:json_annotation/json_annotation.dart';

part 'search_chats_model.g.dart';

@JsonSerializable()
class SearchChatsListModel {
  List<SearchChatsModel> chats;

  SearchChatsListModel({
    required this.chats,
  });

  factory SearchChatsListModel.fromJson(Map<String, dynamic> json)
  => _$SearchChatsListModelFromJson(json);
}

@JsonSerializable()
class SearchChatsModel {
  final int chatId;
  final String nickname;
  final String loginId;
  final String profileImage;
  final bool isText;
  final String content;
  final String createdAt;

  const SearchChatsModel({
    required this.chatId,
    required this.nickname,
    required this.loginId,
    required this.profileImage,
    required this.isText,
    required this.content,
    required this.createdAt,
  });

  factory SearchChatsModel.fromJson(Map<String, dynamic> json)
  => _$SearchChatsModelFromJson(json);
}
