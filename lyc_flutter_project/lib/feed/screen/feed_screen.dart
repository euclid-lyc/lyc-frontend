import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/home_appbar.dart';
import 'package:lyc_flutter_project/common/widget/preview_posting_card.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/director/widget/custom_search_bar.dart';
import 'package:lyc_flutter_project/feed/model/weather_preview.dart';
import 'package:lyc_flutter_project/feed/provider/feed_provider.dart';
import 'package:lyc_flutter_project/feed/widget/height_box.dart';
import 'package:lyc_flutter_project/feed/widget/title_box.dart';
import 'package:lyc_flutter_project/feed/widget/today_temp.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FeedProvider>().initFeedScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      backgroundColor: AppColor.lightGrey,
      body: Consumer<FeedProvider>(
        builder: (BuildContext context, FeedProvider value, Widget? child) {
          return DefaultPadding(
            bottom: 20.0,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomSearchBar(
                    onChanged: (value) => {},
                  ),
                ),
                const HeightBox(height: 24.0),
                TitleBox(
                  title: "날씨 기반 추천",
                  detail: "오늘의 날씨에 맞는 코디를 추천드려요.",
                  right: !value.initializeTemp
                      ? const SizedBox.shrink()
                      : TodayTemp(
                          minTemp: value.minTemp!,
                          maxTemp: value.maxTemp!,
                        ),
                ),
                const HeightBox(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150.0,
                    child: !value.initializeWeatherPreview
                        ? const Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomLoading(),
                              Text("날씨 기반 추천 게시글을 불러오고 있어요"),
                            ],
                          ))
                        : value.weatherPreviewList.isEmpty
                            ? const Center(child: Text("불러올 게시글이 없습니다"))
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.weatherPreviewList.length,
                                itemBuilder: (context, index) {
                                  WeatherPreview preview =
                                      value.weatherPreviewList[index];
                                  return PreviewPostingCard(
                                    postingId: preview.postingId,
                                    image: preview.image,
                                  );
                                },
                              ),
                  ),
                ),
                const HeightBox(height: 24.0),
                const TitleBox(
                  title: "피드 맞춤 추천",
                  detail: "사용자 취향에 맞는 코디를 추천해드려요.",
                ),
                const HeightBox(),
                // SliverGrid.builder(
                //   gridDelegate: customGridDelegate(),
                //   itemCount: value.forMemberPreviewList.length,
                //   itemBuilder: (context, index) {
                //     ForMemberPreview preview =
                //         value.forMemberPreviewList[index];
                //     return PreviewPostingCard(
                //       postingId: preview.postingId,
                //       image: preview.image,
                //     );
                //   },
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
