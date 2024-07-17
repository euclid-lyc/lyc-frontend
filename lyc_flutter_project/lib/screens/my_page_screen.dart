import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/coordiByCategory.dart';
import 'package:lyc_flutter_project/model/coordi.dart';
import 'package:lyc_flutter_project/widget/grid_widget.dart';
import 'package:lyc_flutter_project/widget/switch_category_button.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  int _selectedCategory = 0;

  void _onCategorySelected(int category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  List<Coordi> get currentOutfitList {
    switch (_selectedCategory) {
      case 1:
        return CoordiLists.userCoordi;
      case 2:
        return CoordiLists.myCloset;
      case 0:
      default:
        return CoordiLists.myCoordi;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.beige,
      ),
      body: Column(
        children: [
          // 상단부
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xffC4BAA2),
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  // 프로필 박스(사진, 이름 등)
                  Expanded(
                    flex: 12,
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // 사진
                          Expanded(
                            flex: 7,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/ex_profile.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // 이름, 아이디, 팔로워, 팔로잉
                          SizedBox(width: 20),
                          Expanded(
                            flex: 10,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // 이름
                                  Text(
                                    'Karina',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  // 아이디
                                  Text('@katarinabluu'),
                                  Text(
                                    '\n',
                                    style: TextStyle(fontSize: 4),
                                  ),
                                  // 팔로워
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                                    },
                                    child: Text(
                                      '팔로워: 1,350만',
                                      style:
                                          TextStyle(color: Color(0xff414141)),
                                    ),
                                  ),
                                  // 팔로잉
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                                    },
                                    child: Text('팔로잉: 245',
                                        style: TextStyle(
                                            color: Color(0xff414141))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // 공유, 포인트
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.local_parking,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 버튼 박스(스탬프, 리뷰, 출석체크)
                  /// 나중에 페이지 연결 & 위젯 분리
                  /// w값 줄이기
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        // 스탬프 버튼
                        Expanded(
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xffF1F1F1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              child: Text(
                                '스탬프',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff8D8371)),
                              )),
                        ),
                        SizedBox(width: 15),
                        // 리뷰 버튼
                        Expanded(
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xffF1F1F1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              child: Text(
                                '리뷰',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff8D8371)),
                              )),
                        ),
                        SizedBox(width: 15),
                        // 출석체크 버튼
                        Expanded(
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xffF1F1F1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              child: Text(
                                '출석체크',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff8D8371)),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
          // 하단부
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 5),
              child: Column(
                children: [
                  // 갤러리 카테고리 버튼(나의 코디, 저장한 코디, 나의 옷장)
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        // 나의 코디
                        SwitchCategoryButton(
                          '나의 코디',
                          _selectedCategory == 0,
                          () => _onCategorySelected(0),
                        ),
                        // 저장한 코디
                        SwitchCategoryButton(
                          '저장한 코디',
                          _selectedCategory == 1,
                          () => _onCategorySelected(1),
                        ),
                        // 나의 옷장
                        SwitchCategoryButton(
                          '나의 옷장',
                          _selectedCategory == 2,
                          () => _onCategorySelected(2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // 갤러리
                  Expanded(
                    child: GridWidget(
                        coordiLst: currentOutfitList, isMyCoordi: _selectedCategory == 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
