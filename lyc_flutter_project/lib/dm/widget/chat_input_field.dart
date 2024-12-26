import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:lyc_flutter_project/dm/widget/chat_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

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
