import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/auth/join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/common/style/custom_grid_delegate.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_posting_preview.dart';
import 'package:lyc_flutter_project/mypage/provider/mypage_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/review_provider.dart';
import 'package:lyc_flutter_project/mypage/screen/review_list_screen.dart';
import 'package:lyc_flutter_project/posting/provider/coordi_provider.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';
import 'package:lyc_flutter_project/posting/screen/add_posting_screen.dart';
import 'package:lyc_flutter_project/posting/screen/posting_detail_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

/// [category]
/// 0 나의 코디
/// 1 저장한 코디
/// 3 리뷰

class MyCoordiGridView extends StatefulWidget {
  final List<CoordiPostingPreview> postings;
  final int category;
  final MypageProvider? provider;
  final ReviewProvider? reviewProvider;

  const MyCoordiGridView({
    super.key,
    required this.postings,
    required this.category,
    this.provider,
    this.reviewProvider,
  });

  @override
  State<MyCoordiGridView> createState() => _MyCoordiGridViewState();
}

class _MyCoordiGridViewState extends State<MyCoordiGridView> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  bool getLoading() {
    if (widget.category == 0 || widget.category == 1) {
      return widget.provider!.getLoading();
    } else if (widget.category == 3) {
      return widget.reviewProvider!.loading;
    } else {
      Exception("잘못된 카테고리");
      return false;
    }
  }

  void refresh() {
    if (widget.category == 0 || widget.category == 1) {
      widget.provider!.refresh();
    } else if (widget.category == 3) {
      widget.reviewProvider!.refreshReviews();
    } else {
      Exception("잘못된 카테고리");
      return;
    }
  }

  void listener() {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      if (widget.category == 0 || widget.category == 1) {
        if (!widget.provider!.getLoading() && widget.provider!.getHasMore()) {
          widget.provider!.getList();
        }
      } else if (widget.category == 3) {
        widget.reviewProvider!.getReviews();
      } else {
        Exception("잘못된 카테고리");
        return;
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
      itemCount: widget.postings.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return GestureDetector(
            onTap: () {
              if (widget.category == 0) {
                final coordiProvider = CoordiProvider(
                  repositoryProvider: context.read<CoordiRepositoryProvider>(),
                  loginProvider: context.read<LoginProvider>(),
                );
                // 나의코디->코디 추가
                pushWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPostingScreen(
                      purpose: 0,
                      coordiProvider: coordiProvider,
                    ),
                  ),
                );
              } else if (widget.category == 1) {
                // 저장한코디->코디 탐색
              } else if (widget.category == 3) {
                pushWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewListScreen(),
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _iconByCategory(),
                  const SizedBox(height: 5),
                  _textByCategory(),
                ],
              ),
            ),
          );
        } else if (index == widget.postings.length + 1) {
          return getLoading()
              ? const Center(
                  child: CustomLoading(),
                )
              : const SizedBox.shrink();
        } else {
          final posting = widget.postings[index - 1];
          return GestureDetector(
            onTap: () async {
              final delete = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (context) => PostingDetailScreen(
                    postingId: posting.postingId,
                    isMyPosting: widget.category == 0,
                  ),
                ),
              );
              if (delete == true) {
                refresh();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      '삭제되었습니다',
                    ),
                  ),
                );
              }
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

  Widget _iconByCategory() {
    if (widget.category == 0 || widget.category == 2 || widget.category == 3) {
      return const Icon(Icons.add_rounded);
    } else if (widget.category == 1) {
      return const Icon(Icons.search_rounded);
    } else {
      return const Icon(Icons.not_interested_rounded);
    }
  }

  Widget _textByCategory() {
    if (widget.category == 0) {
      return const Text("코디 추가");
    } else if (widget.category == 1) {
      return const Text("코디 탐색");
    } else if (widget.category == 3) {
      return const Text("리뷰 작성");
    } else {
      return const Text("error");
    }
  }
}
