import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/model/coordi.dart';
import 'package:lyc_flutter_project/screens/coordi_detail_screen.dart';
import 'package:lyc_flutter_project/screens/write_post_screen.dart';

class GridWidget extends StatelessWidget {
  final List<Coordi?> coordiLst;
  final int category;

  const GridWidget({
    super.key,
    required this.coordiLst,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemCount: coordiLst.length,
        itemBuilder: (context, index) {
          if (index == coordiLst.length - 1) {
            // 마지막 칸
            return GestureDetector(
              onTap: () {
                if (category == 0) {
                  // 나의코디->코디 추가
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WritePostScreen(purpose: 0)));
                } else if (category == 1) {
                  // 저장한코디->코디 탐색
                } else if (category == 2) {
                  // 나의옷장->옷 추가
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WritePostScreen(purpose: 2)));
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
            final coordi = coordiLst[index];
            return GestureDetector(
              onTap: () {
                // Navigate to Detail Screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoordiDetailScreen(
                          coordi: coordi!, isMyCoordi: (category == 0)),
                    ));
              },
              child: Hero(
                tag: coordi!,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/${coordi.image}.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            );
          }
        });
  }

  Widget _iconByCategory() {
    if (category == 0 || category == 2) {
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
    } else {
      return Text("error");
    }
  }
}
