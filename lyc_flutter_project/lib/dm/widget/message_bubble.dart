import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/model/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel messageModel;
  final MessageModel? previousModel;
  final MessageModel? nextModel;

  const MessageBubble({
    super.key,
    required this.messageModel,
    this.previousModel,
    this.nextModel,
  });

  @override
  Widget build(BuildContext context) {
    bool isMe = messageModel.type == BubbleType.sendBubble;
    bool showImage = !isMe && ((previousModel == null) || (previousModel != null && previousModel!.type != messageModel.type));
    bool reduceHeightMargin = nextModel != null && (messageModel.type == nextModel!.type);
    return Container(
      margin: EdgeInsets.only(bottom: reduceHeightMargin ? 6.0 : 12.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4.0),
            height: 36.0,
            width: 36.0,
            child: showImage ? ProfileImageNetworking(messageModel.image!) : null,
          ),
          if (messageModel.isText)
            ChatBubble(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              clipper: ChatBubbleClipper5(type: messageModel.type),
              backGroundColor: isMe ? AppColor.brown : AppColor.grey,
              child: Text(
                messageModel.content,
                textAlign: isMe ? TextAlign.right : TextAlign.left,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 16.0,
                ),
              ),
            )
          else
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(1.0, 1.0),
                    spreadRadius: 0.0,
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  messageModel.content,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
