// MyPage, userCoordi, MyCloset, Review_home 등
// 그리드가 사용되는 모든 스크린에 가져가서 사용할 수 있습니다
// 사용방법 : 위젯 호출 시 그리드에 표시할 데이터 리스트 전달 (List<Coordi>)

import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/model/coordi.dart';
import 'package:lyc_flutter_project/screens/coordi_detail_screen.dart';

class GridWidget extends StatelessWidget {
  final List<Coordi> coordiLst;
  final bool isMyCoordi;

  const GridWidget({super.key, required this.coordiLst, required this.isMyCoordi});

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
        final coordi = coordiLst[index];
        return GestureDetector(
          onTap: () {
            // Navigate to Detail Screen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    CoordiDetailScreen(
                        coordi: coordi,
                      isMyCoordi: isMyCoordi
                    ),
                )
            );
          },
          child: Hero(
            tag: coordi,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/${coordi.image}.jpg',
                  fit: BoxFit.cover,
                )
            ),
          ),
        );
      },
    );
  }
}
