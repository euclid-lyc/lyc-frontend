import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/common/const/assets.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
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
                          previousModel: index + 1 < value.messageList.length ? value.messageList[index + 1] : null,
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
  const _BottomInputField();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: const EdgeInsets.only(left: 24.0, right: 16.0),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const ChatBottomSheet(),
                  );
                },
                icon: SvgPicture.asset(
                  "assets/icon_plus.svg",
                  height: 18.0,
                  width: 18.0,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  onTapOutside: (event) => FocusScope.of(context).unfocus,
                  focusNode: context.read<ChatProvider>().focusNode,
                  controller: context.read<ChatProvider>().textEditingController,
                  maxLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide.none),
                    hintText: "메시지 입력",
                    hintStyle: TextStyle(
                      color: AppColor.deepGrey.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: AppColor.grey.withOpacity(0.5),
                  ),
                  style: const TextStyle(fontSize: 16.0),
                  cursorColor: AppColor.deepGrey,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.only(left: 16.0, right: 20.0),
                onPressed: () {
                  context.read<ChatProvider>().onFieldSubmitted();
                },
                icon: SvgPicture.asset(
                  "assets/icon_dm.svg",
                  height: 30.0,
                  width: 30.0,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
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

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28.0).copyWith(top: 24.0, bottom: 28.0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 16.0,
        runSpacing: 12.0,
        children: [
          Expanded(
            child: ChatPlusButton(
              label: '사진',
              asset: Assets.photoButton,
              onTap: () {},
            ),
          ),
          Expanded(
            child: ChatPlusButton(
              label: '카메라',
              asset: Assets.cameraButton,
              onTap: () {},
            ),
          ),
          Expanded(
            child: ChatPlusButton(
              label: '일정',
              asset: Assets.scheduleButton,
              onTap: () {},
            ),
          ),
          Expanded(
            child: ChatPlusButton(
              label: '의뢰',
              asset: Assets.commissionButton,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPlusButton extends StatelessWidget {
  final String label;
  final String asset;
  final VoidCallback onTap;

  const ChatPlusButton({
    super.key,
    required this.label,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: SvgPicture.asset(asset),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
