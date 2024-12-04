import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:lyc_flutter_project/dm/widget/message_bubble.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final int chatId;
  final String nickname;
  final String profileImage;

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.nickname,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(
        chatId: chatId,
        nickname: nickname,
        profileImage: profileImage,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: NormalAppbar(title: nickname),
        body: Consumer<ChatProvider>(
          builder: (context, value, child) {
            if (value.loading) {
              return const Center(child: CustomLoading());
            }
            return Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: value.scrollController,
                      reverse: true,
                      padding: const EdgeInsets.only(top: 12.0, bottom: 20.0, right: 12.0, left: 12.0),
                      itemCount: value.messageList.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(
                          messageModel: value.messageList[index],
                          previousModel: index + 1< value.messageList.length ? value.messageList[index + 1] : null,
                          nextModel: index > 0 ? value.messageList[index - 1] : null,
                        );
                      },
                    ),
                  ),
                ),
                const _BottomInputField(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _BottomInputField extends StatelessWidget {
  const _BottomInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
        ),
        child: Stack(
          children: [
            TextField(
              focusNode: context.read<ChatProvider>().focusNode,
              controller: context.read<ChatProvider>().textEditingController,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  context.read<ChatProvider>().onFieldSubmitted();
                },
                icon: const Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
