import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/mypage/widget/closet_element.dart';
import 'package:lyc_flutter_project/posting/provider/clothes_provider.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';
import 'package:lyc_flutter_project/posting/screen/add_clothes_posting_screen.dart';
import 'package:lyc_flutter_project/posting/screen/posting_detail_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class MyClosetList extends StatefulWidget {
  final List<ClosetPostingPreview> postings;
  final MypageProvider provider;

  const MyClosetList({
    super.key,
    required this.postings,
    required this.provider,
  });

  @override
  State<MyClosetList> createState() => _MyClosetListState();
}

class _MyClosetListState extends State<MyClosetList> {
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
        // print("데이터 추가 요청");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemCount: widget.postings.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return GestureDetector(
            onTap: () {
              final clothesProvider = ClothesProvider(
                repositoryProvider: context.read<ClothesRepositoryProvider>(),
              );
              pushWithoutNavBar(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddClothesPostingScreen(
                      clothesProvider: clothesProvider,
                    );
                  },
                ),
              );
            },
            child: const ClosetElement(
              title: "옷 추가",
              image: "",
              isFst: true,
            ),
          );
        } else if (index == widget.postings.length + 1) {
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
                    isMyposting: true,
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
