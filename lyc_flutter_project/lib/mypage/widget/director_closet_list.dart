import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/mypage/widget/closet_element.dart';
import 'package:lyc_flutter_project/posting/screen/posting_detail_screen.dart';

class DirectorClosetList extends StatefulWidget {
  final List<ClosetPostingPreview> postings;
  final MypageProvider provider;
  final int memberId;

  const DirectorClosetList({
    super.key,
    required this.postings,
    required this.provider,
    required this.memberId,
  });

  @override
  State<DirectorClosetList> createState() => _DirectorClosetListState();
}

class _DirectorClosetListState extends State<DirectorClosetList> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    if (controller.offset > controller.position.maxScrollExtent - 200) {
      if (!widget.provider.getLoading() && widget.provider.getHasMore()) {
        widget.provider.getList();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(listener);
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemCount: widget.postings.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.postings.length) {
          return widget.provider.getLoading()
              ? const Center(
                  child: CustomLoading(),
                )
              : const SizedBox.shrink();
        } else {
          final posting = widget.postings[index - 1];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PostingDetailScreen(
                    postingId: posting.clothesId,
                    isCloset: true,
                    isMyPosting: true,
                  );
                },
              ),
            ),
            child: ClosetElement(
              title: posting.title,
              image: posting.image,
            ),
          );
        }
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16.0);
      },
    );
  }
}
