import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/style/custom_grid_delegate.dart';
import 'package:lyc_flutter_project/common/widget/home_appbar.dart';
import 'package:lyc_flutter_project/common/widget/horizontal_posting_list.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/director/widget/custom_search_bar.dart';
import 'package:lyc_flutter_project/feed/widget/height_box.dart';
import 'package:lyc_flutter_project/feed/widget/title_box.dart';
import 'package:lyc_flutter_project/feed/widget/today_temp.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      backgroundColor: AppColor.lightGrey,
      body: DefaultPadding(
        bottom: 20.0,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomSearchBar(
                onChanged: (value) => setState(() {}),
              ),
            ),
            const HeightBox(height: 24.0),
            const TitleBox(
              title: "날씨 기반 추천",
              detail: "오늘의 날씨에 맞는 코디를 추천드려요.",
              right: TodayTemp(minTemp: 3, maxTemp: 14),
            ),
            const HeightBox(),
            const SliverToBoxAdapter(child: HorizontalPostingList()),
            const HeightBox(height: 24.0),
            const TitleBox(
              title: "피드 맞춤 추천",
              detail: "사용자 취향에 맞는 코디를 추천해드려요.",
            ),
            const HeightBox(),
            renderPostings(),
          ],
        ),
      ),
    );
  }

  SliverGrid renderPostings() {
    return SliverGrid(
      gridDelegate: customGridDelegate(),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
          );
        },
        childCount: 10, // Adjust as needed
      ),
    );
  }
}
