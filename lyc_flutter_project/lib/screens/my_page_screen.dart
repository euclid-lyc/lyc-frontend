import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // SVG 이미지 사용을 위한 패키지
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/data/temp_posting_data.dart';
import 'package:lyc_flutter_project/model/coordi.dart';
import 'package:lyc_flutter_project/model/member.dart';
import 'package:lyc_flutter_project/screens/follow_list_screen.dart';
import 'package:lyc_flutter_project/services/temp_services.dart';
import 'package:lyc_flutter_project/widget/bottom_buttons.dart';
import 'package:lyc_flutter_project/widget/grid_widget_with_button.dart';
import 'package:lyc_flutter_project/widget/switch_category_button.dart';

import '../data/coordi_by_category.dart';
import '../styles/app_text_style.dart';
import 'notify_screen.dart';

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
  bool isBlocked = false; // 차단 여부를 나타내는 변수
  bool isNotified = false; // 신고 여부를 나타내는 변수

  @override
  void initState() {
    super.initState();
    _member = TempServices.getMemberById(widget.memberId!);
    if (_member?.id == cur_member) {
      isMyPage = true;
    } else {
      // 다른 유저의 페이지일 때 차단 여부를 초기화
      isBlocked = false; // 실제로는 서버나 데이터베이스에서 차단 상태를 가져와야 함
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
                                      Navigator.push(
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
                                      Navigator.push(
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
                              isBlocked: isBlocked,
                              onBlock: () {
                                setState(() {
                                  isBlocked = !isBlocked; // 차단 상태 토글
                                });
                              },
                              onNotify: () {
                                setState(() {
                                  isNotified = true;
                                });
                              },
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
                    child: BottomButtons(
                      memberId: _member!.id,
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
          // 하단부
          if (isBlocked)
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.fromLTRB(1, 0, 0, 228),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 수직으로 가운데 정렬
                  crossAxisAlignment: CrossAxisAlignment.center, // 수평으로 가운데 정렬
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 1, 19.5),
                      child: Text(
                        '차단된 유저입니다',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.3,
                          color: Color(0xFF898989),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 263, // 버튼의 너비
                      height: 40, // 버튼의 높이
                      child: TextButton(
                        onPressed: () {
                          // 클릭 이벤트 처리 로직 추가
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFEFFC3),
                          padding: EdgeInsets.symmetric(vertical: 9.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '차단 계정 관리 >',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (isNotified)
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.fromLTRB(1, 0, 0, 228),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 수직으로 가운데 정렬
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // 수평으로 가운데 정렬
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 1, 19.5),
                      child: Text(
                        '신고된 유저입니다',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.3,
                          color: Color(0xFF898989),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 263, // 버튼의 너비
                      height: 40, // 버튼의 높이
                      child: TextButton(
                        onPressed: () {
                          // 클릭 이벤트 처리 로직 추가
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFEFFC3),
                          padding: EdgeInsets.symmetric(vertical: 9.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '신고 계정 관리 >',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              flex: 2,
              child: Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 5),
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
                            AppColor.brown,
                          ),
                          // 저장한 코디
                          SwitchCategoryButton(
                            '저장한 코디',
                            _selectedCategory == 1,
                            () => _onCategorySelected(1),
                            AppColor.brown,
                          ),
                          // 나의 옷장
                          SwitchCategoryButton(
                            isMyPage ? '나의 옷장' : '${_member!.nickname}의 옷장',
                            _selectedCategory == 2,
                            () => _onCategorySelected(2),
                            AppColor.brown,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        child: GridWidgetWithButton(
                            postings: TempPostingData().postings,
                            category: _selectedCategory)),
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
  final bool isBlocked;
  final VoidCallback onBlock;
  final VoidCallback onNotify; // 추가: 신고 콜백

  const IconsInProfileBox({
    super.key,
    required this.memberId,
    required this.isBlocked,
    required this.onBlock,
    required this.onNotify,
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

  void blockUser() {
    setState(() {
      widget.onBlock();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.memberId == cur_member) {
      return Column(
        children: [
          Icon(
            Icons.local_parking,
            color: Colors.white,
          ),
        ],
      );
    } else {
      // 다른 사람의 마이페이지일 때 뜨는 화면입니다
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.center, // 가운데 정렬
            child: IconButton(
              icon: Container(
                width: 60,
                height: 25,
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
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  widget.isBlocked
                      ? 'assets/icon_blocked.svg'
                      : 'assets/icon_block.svg', // SVG 파일 로드
                  width: 20.5, // 크기 조정
                  height: 18, // 크기 조정
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x806D7176),
                              ),
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 252,
                                height: 179,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 31),
                                      child: Text(
                                        widget.isBlocked
                                            ? '차단을 해제하시겠습니까?'
                                            : '차단하시겠습니까?',
                                        style: app_text_style.littleTitle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 176,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 26, 0),
                                            decoration: BoxDecoration(
                                              color: AppColor.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColor.grey,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 5.5, 0, 4.5),
                                                minimumSize: Size(75, 36),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                '취소',
                                                style: app_text_style
                                                    .labelTextStyle,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 5.5, 0, 4.5),
                                                minimumSize: Size(75, 36),
                                              ),
                                              onPressed: () {
                                                blockUser();
                                                Navigator.of(context)
                                                    .pop(); // 다이얼로그 닫기
                                              },
                                              child: Text(
                                                widget.isBlocked
                                                    ? '차단 해제'
                                                    : '차단',
                                                style: app_text_style.button,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 10),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icon_notify.svg',
                  width: 20, // 크기 조정
                  height: 20, // 크기 조정
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotifyScreen(
                        onNotify: widget.onNotify,
                      ), // NotifyScreen으로 이동
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );
    }
  }
}
