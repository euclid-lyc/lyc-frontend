import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/director/widget/custom_search_bar.dart';
import 'package:lyc_flutter_project/dm/model/chat_model.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class DmScreen extends StatefulWidget {
  const DmScreen({super.key});

  @override
  State<DmScreen> createState() => _DmScreenState();
}

class _DmScreenState extends State<DmScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatProvider>().getChatList();
    });
  }

  void _listener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (mounted) context.read<ChatProvider>().getChatList();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "DM",
      ),
      body: Consumer<ChatProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CustomLoading());
          }

          return DefaultPadding(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 16),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomSearchBar(
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: SvgPicture.asset(
                            "assets/icon/commission.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final ChatModel chat = value.chatList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          // onTap: () => Naviga,
                          child: MemberList(
                            navigateMypage: false,
                            profile: chat.profileImage,
                            nickname: chat.nickname,
                            content: chat.content,
                          ),
                        ),
                      );
                    },
                    childCount: value.chatList.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
