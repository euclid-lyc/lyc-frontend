import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/confirm_alter_dialog.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/common/widget/posting_top.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/posting/provider/posting_detail_provider.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PostingDetailScreen extends StatefulWidget {
  final int postingId;
  final bool isMyPosting;
  final bool isCloset;

  const PostingDetailScreen({
    super.key,
    required this.postingId,
    this.isMyPosting = false,
    this.isCloset = false,
  });

  @override
  State<PostingDetailScreen> createState() => _PostingDetailScreenState();
}

class _PostingDetailScreenState extends State<PostingDetailScreen> {
  late PostingDetailProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<PostingDetailProviderFactory>(context, listen: false)
        .getProvider(widget.postingId);
    provider.initialize(widget.isMyPosting);
  }

  @override
  void dispose() {
    Provider.of<PostingDetailProviderFactory>(context, listen: false)
        .disposeProvider(widget.postingId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<PostingDetailProvider>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: AppColor.lightGrey,
            appBar: widget.isMyPosting
                ? NormalAppbar(
                    icon: SvgPicture.asset("assets/icon_delete.svg"),
                    onTap: () async {
                      final delete = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return CustomAlterDialog(
                            title: "정말 삭제하시겠습니까?",
                            leftButtonLabel: "취소",
                            rightButtonLabel: "삭제",
                            leftButtonPressed: () =>
                                Navigator.pop(context, false),
                            rightButtonPressed: () =>
                                Navigator.pop(context, true),
                            rightBackgroundColor: AppColor.brown,
                          );
                        },
                      );
                      if (delete == true) {
                        try {
                          await value.delete();
                          Navigator.pop(context, true);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "오류가 발생했습니다: ${e.toString()}",
                              ),
                            ),
                          );
                        }
                      }
                    },
                  )
                : const NormalAppbar(),
            body: value.loadingState
                ? const Center(child: CustomLoading())
                : SingleChildScrollView(
                    child: DefaultPadding(
                      child: Column(
                        children: [
                          // 프로필, 날씨
                          if (widget.isCloset == false)
                            PostingTop(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      ProfileImageNetworking(
                                        value.posting.fromMember.profileImage,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: SvgPicture.asset(
                                          'assets/icon_arrow.svg',
                                        ),
                                      ),
                                      ProfileImageNetworking(
                                        value.posting.toMember.profileImage,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        value.posting.nickname,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '@${value.posting.loginId}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${value.posting.minTemp}°C ~ ${value.posting.maxTemp}°C',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            // 옷장 게시글
                            PostingTop(
                              child: Row(
                                children: [
                                  RoundImage(
                                    image: Image.asset(
                                      "assets/ex_profile2.png",
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  const Text(
                                    "정열의 레드 붉은 상어파의 티샤쓰",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          // 사진
                          Hero(
                            tag: 0,
                            child: AspectRatio(
                              aspectRatio: (3 / 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: value.posting.imageInfo.isNotEmpty
                                    ? Image.network(
                                        value.posting.imageInfo[0].image,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/image_not_found.png",
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          // 하트, 공유, 저장 버튼
                          !widget.isCloset
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () => value.pressLike(),
                                      icon: Icon(
                                        value.isLiked
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        size: 30,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.share,
                                            size: 30,
                                          ),
                                        ),
                                        !widget.isMyPosting
                                            ? IconButton(
                                                onPressed: () =>
                                                    value.pressSave(),
                                                icon: SvgPicture.asset(
                                                  value.isSaved
                                                      ? "assets/icon_saved.svg"
                                                      : "assets/icon_save.svg",
                                                  width: 30,
                                                  height: 30,
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                      ],
                                    )
                                  ],
                                )
                              : const SizedBox(height: 16.0),
                          // 설명박스
                          Container(
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              value.posting.content,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
