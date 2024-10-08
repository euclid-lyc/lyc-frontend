import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/right_button_in_list.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/mypage/model/possible_reviews.dart';
import 'package:lyc_flutter_project/mypage/provider/review_provider.dart';
import 'package:provider/provider.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  void initState() {
    super.initState();
    getPossibleReviews();
  }

  Future<void> getPossibleReviews() async {
    await context.read<ReviewProvider>().getPossibleReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: '나의 리뷰',
      ),
      body: DefaultPadding(
        bottom: 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '작성 가능한 리뷰',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '7일 이내에 디렉팅 받은 코디에 대한 리뷰를 작성할 수 있습니다.',
              style: TextStyle(
                color: AppColor.deepGrey,
              ),
            ),
            const SizedBox(height: 15),
            Consumer<ReviewProvider>(
              builder: (context, provider, child) {
                return provider.possibleLoading
                    ? const Center(child: CustomLoading())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: provider.possibleReviews.length,
                          itemBuilder: (context, index) {
                            final PossibleReview review = provider.possibleReviews[index];
                            return MemberList(
                              profile: review.profileImage,
                              nickname: review.nickname,
                              content: review.finishedAt,
                              button: RightButtonInList(
                                backgroundColor: const Color(0xffFFDD85),
                                foregroundColor: Colors.black,
                                label: "작성하기",
                                fontSize: 12.0,
                                // onPressed: () => Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return AddPostingScreen(purpose: 1);
                                //     },
                                //   ),
                                // ),
                                onPressed: () {},
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
