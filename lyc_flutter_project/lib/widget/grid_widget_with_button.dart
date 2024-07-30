import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/model/posting.dart';
import 'package:lyc_flutter_project/screens/add_clothes_posting_screen.dart';
import 'package:lyc_flutter_project/screens/posting_detail_screen.dart';
import 'package:lyc_flutter_project/screens/review_list_screen.dart';
import 'package:lyc_flutter_project/screens/add_posting_screen.dart';
import 'package:lyc_flutter_project/services/temp_services.dart';

/// [category]
/// 0 나의 코디
/// 1 저장한 코디
/// 2 나의 옷장
/// 3 리뷰

class GridWidgetWithButton extends StatelessWidget {
  final List<Posting> postings;
  final int category;

  const GridWidgetWithButton({
    super.key,
    required this.postings,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (3/4),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemCount: postings.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                if (category == 0) {
                  // 나의코디->코디 추가
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPostingScreen(purpose: 0)));
                } else if (category == 1) {
                  // 저장한코디->코디 탐색
                } else if (category == 2) {
                  // 나의옷장->옷 추가
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddClothesPostingScreen()));
                } else if (category == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewListScreen(),
                      ));
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
                    SizedBox(height: 5),
                    _textByCategory(),
                  ],
                ),
              ),
            );
          } else {
            final posting = postings[index - 1];
            final image = TempServices.getImageByPostingId(posting.id);
            return GestureDetector(
              onTap: () {
                // Navigate to Detail Screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostingDetailScreen(
                            id: posting.id, isMyCoordi: category == 0)));
              },
              child: Hero(
                tag: posting.id,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      image.image,
                      fit: BoxFit.cover,
                    )),
              ),
            );
          }
        });
  }

  Widget _iconByCategory() {
    if (category == 0 || category == 2 || category == 3) {
      return Icon(Icons.add_rounded);
    } else if (category == 1) {
      return Icon(Icons.search_rounded);
    } else {
      return Icon(Icons.not_interested_rounded);
    }
  }

  Widget _textByCategory() {
    if (category == 0) {
      return Text("코디 추가");
    } else if (category == 1) {
      return Text("코디 탐색");
    } else if (category == 2) {
      return Text("옷 추가");
    } else if (category == 3) {
      return Text("리뷰 작성");
    } else {
      return Text("error");
    }
  }
}
