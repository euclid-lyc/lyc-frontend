import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  // SVG 이미지 사용을 위한 패키지
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/coordi_by_category.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/data/temp_posting_data.dart';
import 'package:lyc_flutter_project/model/coordi.dart';
import 'package:lyc_flutter_project/model/member.dart';
import 'package:lyc_flutter_project/screens/follow_list_screen.dart';
import 'package:lyc_flutter_project/services/temp_services.dart';
import 'package:lyc_flutter_project/widget/bottom_buttons.dart';
import 'package:lyc_flutter_project/widget/grid_widget_with_button.dart';
import 'package:lyc_flutter_project/widget/switch_category_button.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MyPageScreen extends StatefulWidget {
  final int? memberId;

  const MyPageScreen({super.key, required this.memberId});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  int _selectedCategory = 0;
  Member? _member;
  bool isMyPage = false;

  @override
  void initState() {
    super.initState();
    _member = TempServices.getMemberById(widget.memberId!);
    if (_member?.id == cur_member) {
      isMyPage = true;
    }
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
              color: AppColor.beige,
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  // 프로필 박스
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
                                  _member!.profile_image,
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
                                    _member!.nickname,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  // 아이디
                                  Text('@${_member!.login_id}'),
                                  Text(
                                    '\n',
                                    style: TextStyle(fontSize: 4),
                                  ),
                                  // 팔로워
                                  GestureDetector(
                                    onTap: () {
                                      pushWithoutNavBar(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FollowListScreen(
                                                    follower: true),
                                          ));
                                    },
                                    child: Text(
                                      '팔로워: ${_member!.follower}',
                                      style:
                                      TextStyle(color: Color(0xff414141)),
                                    ),
                                  ),
                                  // 팔로잉
                                  GestureDetector(
                                    onTap: () {
                                      pushWithoutNavBar(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FollowListScreen(
                                                    follower: false),
                                          ));
                                    },
                                    child: Text('팔로잉: ${_member!.following}',
                                        style: TextStyle(
                                            color: Color(0xff414141))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // 우측 버튼(공유 포인트/팔로우 차단 신고)
                          Expanded(
                            flex: 4,
                            child: IconsInProfileBox(
                              memberId: _member!.id,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 하단 버튼(스탬프 리뷰 출석체크/의뢰하기 리뷰 소개카드)
                  Expanded(
                    flex: 4,
                    child: BottomBottons(
                      memberId: _member!.id,
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
                  // 갤러리 카테고리 버튼(00의 코디, 저장한 코디, 00의 옷장)
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
                          isMyPage ? '나의 코디' : '${_member!.nickname}의 코디',
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
                          isMyPage ? '나의 옷장' : '${_member!.nickname}의 옷장',
                          _selectedCategory == 2,
                              () => _onCategorySelected(2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      child: GridWidgetWithButton(
                          postings: TempPostingData().postings,
                          category: _selectedCategory)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCategorySelected(int category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  List<Coordi?> get currentOutfitList {
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
}

class IconsInProfileBox extends StatefulWidget {
  final int memberId;

  const IconsInProfileBox({
    super.key,
    required this.memberId,
  });

  @override
  _IconsInProfileBoxState createState() => _IconsInProfileBoxState();
}

class _IconsInProfileBoxState extends State<IconsInProfileBox> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.memberId == cur_member) {
      return Row(
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
      );
    } else {
      // 다른 사람의 마이페이지일 때 뜨는 화면입니다
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,  // 우측 정렬
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icon_block.svg',  // SVG 파일 로드
              width: 24,  // 크기 조정
              height: 24, // 크기 조정
            ),
            onPressed: () {},
          ),
          SizedBox(width: 10),  // 아이콘 간의 간격 조정
          IconButton(
            icon: SvgPicture.asset(
              'assets/icon_notify.svg',  // SVG 파일 로드
              width: 24,  // 크기 조정
              height: 24, // 크기 조정
            ),
            onPressed: () {},
          ),
          SizedBox(width: 10),  // 아이콘 간의 간격 조정
          IconButton(
            icon: Container(
              margin: EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: isFollowing ? Colors.white : Color(0xFFFEFFC3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.2, vertical: 5),
              child: Text(
                isFollowing ? '팔로우' : '팔로잉',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  height: 1.6,
                  color: Colors.black,
                ),
              ),
            ),
            onPressed: toggleFollow,
          ),
        ],
      );
    }
  }
}