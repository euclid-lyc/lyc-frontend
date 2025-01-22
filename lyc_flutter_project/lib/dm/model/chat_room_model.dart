import 'package:json_annotation/json_annotation.dart';

import 'package:lyc_flutter_project/dm/model/chat_member_model.dart';
import 'package:lyc_flutter_project/dm/model/chat_message_model.dart';


part 'chat_room_model.g.dart';

@JsonSerializable()
class ChatRoomModel {
  final int commissionId;
  final ChatMemberListModel chatMembers;
  final ChatMessageListModel messages;

  ChatRoomModel({
    required this.commissionId,
    required this.chatMembers,
    required this.messages,
  });

  /// JSON으로부터 객체를 생성하는 팩토리 메서드
  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  /// 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() => _$ChatRoomModelToJson(this);
}
