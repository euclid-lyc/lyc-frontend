import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/style/custom_grid_delegate.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/posting/screen/posting_detail_screen.dart';

class DirectorCoordiGridView extends StatefulWidget {
  final List<CoordiPostingPreview> postings;
  final int category;
  final MypageProvider provider;

  const DirectorCoordiGridView({
    super.key,
    required this.postings,
    required this.category,
    required this.provider,
  });

  @override
  State<DirectorCoordiGridView> createState() => _DirectorCoordiGridViewState();
}

class _DirectorCoordiGridViewState extends State<DirectorCoordiGridView> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
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
    return GridView.builder(
      controller: controller,
      gridDelegate: customGridDelegate(),
      itemCount: widget.postings.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.postings.length) {
          return widget.provider.getLoading()
              ? const Center(
                  child: CustomLoading(),
                )
              : const SizedBox.shrink();
        } else {
          final posting = widget.postings[index];
          return GestureDetector(
            onTap: () {
              Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (context) => PostingDetailScreen(
                    postingId: posting.postingId,
                    isMyPosting: widget.category == 0,
                  ),
                ),
              );
            },
            child: Hero(
              tag: posting.postingId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ImageNetworking(posting.image),
              ),
            ),
          );
        }
      },
    );
  }
}
