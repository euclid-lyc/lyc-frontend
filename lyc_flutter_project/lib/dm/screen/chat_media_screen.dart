import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatMediaScreen extends StatefulWidget {
  final ChatProvider provider;

  const ChatMediaScreen({super.key, required this.provider});

  @override
  State<ChatMediaScreen> createState() => _ChatMediaScreenState();
}

class _ChatMediaScreenState extends State<ChatMediaScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(listener);
  }

  void listener() {
    if (scrollController.offset > scrollController.position.maxScrollExtent - 200) {
      widget.provider.getImages();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(listener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: '사진 및 동영상'),
      body: DefaultPadding(
        child: ChangeNotifierProvider.value(
          value: widget.provider,
          child: Consumer<ChatProvider>(
            builder: (context, value, child) => GridView.builder(
              itemCount: value.images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
              ),
              itemBuilder: (context, index) {
                final String url = value.images[index].imageUrl;
                return GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              width: constraints.maxWidth,
                              height: constraints.maxWidth,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
