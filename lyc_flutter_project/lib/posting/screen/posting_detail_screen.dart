import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/common/widget/posting_top.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/posting/model/coordi_posting.dart';
import 'package:lyc_flutter_project/posting/repository/coordi_repository.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PostingDetailScreen extends StatefulWidget {
  final int postingId;
  final bool isMyposting;
  final bool isCloset;

  const PostingDetailScreen({
    super.key,
    required this.postingId,
    this.isMyposting = false,
    this.isCloset = false,
  });

  @override
  _PostingDetailScreenState createState() => _PostingDetailScreenState();
}

class _PostingDetailScreenState extends State<PostingDetailScreen> {
  bool isSaved = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: widget.isMyposting
          ? NormalAppbar(
              icon: SvgPicture.asset("assets/icon_delete.svg"),
              onTap: () {},
            )
          : const NormalAppbar(),
      body: Consumer<CoordiRepositoryProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: DefaultPadding(
              child: FutureBuilder<ApiResponse<CoordiPostingResult>>(
                future: value.repository.getCoordi(postingId: widget.postingId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final resp = snapshot.data!.result;
                    return Column(
                      children: [
                        // 프로필, 날씨
                        if (widget.isCloset == false)
                          PostingTop(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    RoundImage(
                                      image: Image.network(
                                        resp.fromMember.profileImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: SvgPicture.network(
                                        'assets/icon_arrow.svg',
                                      ),
                                    ),
                                    RoundImage(
                                      image: Image.asset(
                                        resp.toMember.profileImage,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      resp.nickname,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '@${resp.loginId}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  '${resp.minTemp}°C ~ ${resp.maxTemp}°C',
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
                                    image:
                                        Image.asset("assets/ex_profile2.png")),
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
                              child: resp.imageInfo.isNotEmpty
                                  ? Image.network(
                                      resp.imageInfo[0].image,
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
                                    onPressed: () {
                                      setState(() {
                                        isFavorite = !isFavorite; // 토글
                                      });
                                    },
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.share),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isSaved = !isSaved;
                                          });
                                        },
                                        icon: SvgPicture.asset(
                                          isSaved
                                              ? 'assets/icon_saved.svg'
                                              : 'assets/icon_save.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
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
                            resp.content,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
