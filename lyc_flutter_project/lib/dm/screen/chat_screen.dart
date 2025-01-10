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
            myNickname: '나',
            myProfile: '',
            othersNickname: nickname,
            othersProfile: profileImage,
            closeDrawer: () => key.currentState!.closeEndDrawer(),
            provider: value,
          ),
          body: value.loading
              ? const Center(child: CustomLoading())
              : Column(
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
        ),
      ),
    );
  }
}
