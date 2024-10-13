import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/home_appbar.dart';
import 'package:lyc_flutter_project/common/widget/preview_posting_card.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:lyc_flutter_project/home/provider/home_provider.dart';
import 'package:lyc_flutter_project/home/widget/director_card.dart';
import 'package:lyc_flutter_project/home/widget/home_deco.dart';
import 'package:lyc_flutter_project/home/widget/home_info.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          appBar: const HomeAppbar(),
          body: ListView(
            children: [
              const MarginBox(),
              // 배너
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 170,
                color: Colors.white,
                child: const Text('배너'),
              ),
              const MarginBox(),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // 둘러보기
                    const TitleRow(label: '둘러보기', onTap: _onTap),
                    const Line(),
                    SizedBox(
                      height: 150.0,
                      child: FutureBuilder(
                          future: value.getPostingPreview(),
                          builder: (context, snapshot) {
                            if (value.loadingFeedPreview)
                              return const Center(child: CustomLoading());
                            if (value.feedPreviewList.isEmpty)
                              return const Text("불러올 게시글이 없습니다");
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.feedPreviewList.length,
                              itemBuilder: (context, index) {
                                final posting = value.feedPreviewList[index];
                                return PreviewPostingCard(
                                  postingId: posting.postingId,
                                  image: posting.image,
                                );
                              },
                            );
                          }),
                    ),
                    // 오늘의 디렉터
                    const MarginBox(),
                    const TitleRow(label: '오늘의 디렉터', onTap: _onTap),
                    const Line(),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var i = 0; i < 10; i++)
                            Container(
                              decoration: buildWhiteRoundBox(),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              height: 90,
                              width: 90,
                              alignment: Alignment.center,
                              child: const DirectorCard(
                                image: "assets/ex_profile2.png",
                                name: "winter",
                              ),
                            ),
                        ],
                      ),
                    ),

                    // 금주의 사연
                    const MarginBox(),
                    const TitleRow(label: '금주의 사연', onTap: _onTap),
                    const Line(),
                    Column(
                      children: [
                        for (var i = 0; i < 10; i++)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: buildWhiteRoundBox(),
                            width: double.infinity,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${i + 1}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                RoundImage(
                                  image: Image.asset(
                                    'assets/ex_profile.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text('전남친이 청접장을 보내왔습니다.'),
                              ],
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),

              // 유클리드
              const MarginBox(),
              const HomeInfo(),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration buildWhiteRoundBox() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    );
  }
}

void _onTap() {}
