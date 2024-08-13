import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:flutter_svg/svg.dart';

class PostingDetailScreen extends StatefulWidget {
  final int id;
  final bool isMyposting;
  final bool isCloset;

  const PostingDetailScreen({
    super.key,
    required this.id,
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
      appBar: widget.isMyposting ? NormalAppbar(
        icon: SvgPicture.asset("assets/icon_delete.svg"),
        onTap: () {},
      ) : const NormalAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 100.0,
          ),
          child: Column(
            children: [
              // 프로필, 날씨
              if (widget.isCloset == false)
                PostingTop(
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: [
                          const RoundImage(
                            image: "assets/ex_profile.png",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: SvgPicture.asset(
                              'assets/icon_arrow.svg',
                            ),
                          ),
                          const RoundImage(
                            image: "assets/ex_profile2.png",
                          )
                        ],
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "karina",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '@katarinabluu',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      const Text(
                        '-4°C ~ 2°C',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              else
                const PostingTop(
                  child: Row(
                    children: [
                      RoundImage(image: "assets/ex_profile2.png"),
                      SizedBox(width: 12.0),
                      Text(
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
                    child: Image.asset(
                      "assets/ex_userCoordi1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // 하트, 공유, 저장 버튼
              !widget.isCloset
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: const Text(
                  "사진 설명이요",
                  style: TextStyle(
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
  }
}

class PostingTop extends StatelessWidget {
  final Widget child;

  const PostingTop({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
