import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/common/const/assets.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:lyc_flutter_project/dm/repository/chat_repository.dart';
import 'package:lyc_flutter_project/dm/widget/chat_drawer.dart';
import 'package:lyc_flutter_project/dm/widget/chat_input_field.dart';
import 'package:lyc_flutter_project/dm/widget/message_bubble.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final int chatId;
  final String nickname;
  final String profileImage;
  final String createdAt;

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.nickname,
    required this.profileImage,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();

    return ChangeNotifierProvider(
      create: (context) => ChatProvider(
        repository: context.read<ChatRepositoryProvider>().repository,
        chatId: chatId,
        nickname: nickname,
        profileImage: profileImage,
        createdAt: createdAt,
      ),
      child: Consumer<ChatProvider>(
        builder: (context, value, child) => Scaffold(
          key: key,
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: NormalAppbar(
            title: nickname,
            icon: SvgPicture.asset(
              Assets.menu,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            onTap: () => key.currentState!.openEndDrawer(),
          ),
          endDrawer: ChatDrawer(
            closeDrawer: () => key.currentState!.closeEndDrawer(),
            provider: value,
          ),
          body: value.loading
              ? const Center(child: CustomLoading())
              : Stack(
                  children: [
                    Column(
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
                                  previousModel: index + 1 < value.messageList.length ? value.messageList[index + 1] : null,
                                  nextModel: index > 0 ? value.messageList[index - 1] : null,
                                );
                              },
                            ),
                          ),
                        ),
                        ChatInputField(provider: value),
                      ],
                    ),
                    // 전송할 이미지
                    if (value.imageToSend != null)
                      Positioned(
                        left: 50.0, // 글래스 효과를 이미지 영역보다 약간 넓게
                        bottom: 70.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              height: 132.0, // 이미지보다 약간 더 큰 영역
                              width: 140.0,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (value.imageToSend != null)
                      Positioned(
                        left: 60.0,
                        bottom: 72.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.file(
                            File(value.imageToSend!.path),
                            fit: BoxFit.cover,
                            height: 120.0,
                            width: 120.0,
                          ),
                        ),
                      ),
                    if (value.imageToSend != null)
                      Positioned(
                        left: 156.0,
                        bottom: 168.0,
                        child: IconButton(
                          onPressed: () => value.removeImageToSend(),
                          icon: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: const Icon(Icons.close),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
