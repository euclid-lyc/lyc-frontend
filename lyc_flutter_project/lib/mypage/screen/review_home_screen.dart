import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/mypage/provider/review_provider.dart';
import 'package:lyc_flutter_project/mypage/widget/my_coordi_grid_view.dart';
import 'package:provider/provider.dart';

class ReviewHomeScreen extends StatefulWidget {
  final int memberId;

  const ReviewHomeScreen({
    super.key,
    required this.memberId,
  });

  @override
  State<ReviewHomeScreen> createState() => _ReviewHomeScreenState();
}

class _ReviewHomeScreenState extends State<ReviewHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReviewProvider>()
        ..getId(memberId: widget.memberId)
        ..getReviews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: '나의 리뷰'),
      body: DefaultPadding(
        child: Consumer<ReviewProvider>(
          builder: (context, provider, child) {
            return provider.loading
                ? const Center(child: CustomLoading())
                : MyCoordiGridView(
                    postings: provider.reviews,
                    category: 3,
                    reviewProvider: provider,
                  );
          },
        ),
      ),
    );
  }
}
