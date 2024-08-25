import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/coordi_by_category.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/data/temp_posting_data.dart';
import 'package:lyc_flutter_project/model/coordi.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/widget/grid_widget_with_button.dart';
import 'package:lyc_flutter_project/mypage/widget/my_closet_list.dart';
import 'package:lyc_flutter_project/mypage/widget/profile_box.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:provider/provider.dart';

// 관련 API가 없어 아직 야매?provider임..
// 그럼에도 수정한 이유는 너무 길고 복잡해서 어질어질하기 때문ㅜㅜ
// 생각해보니 id 하나만 리스트로 저장해도 될 거 같은??
// 수정이 어려울 거 같지는 않아서 일단 이대로 커밋할까합니다

// provider는 변수 하나를 저장하는 단순한 형태가 아니라
// 각각 차단/신고/팔로우된 유저를 리스트로 관리하게 되고
// 다른 사람의 마이페이지에 들어갔을 때 그 사람이 리스트에 있는지 확인하여
// 차단/신고/팔로우된 유저인지 판단하고 UI 구성

// 예: 차단버튼을 누르면 해당 유저의 id가 blockProvider가 관리하는 list에 추가됨
// 차단을 해제하면 리스트에서 삭제됨
// 어떤 유저의 페이지에 들어갈 때 그 유저의 아이디가 list에 있는지 검색함

// 각각의 provider는 싱글 인스턴스여야 하므로 mypage에서 생성 후
// 위젯에 파라미터로 전달함

// 이 로직이 맞겠죠..? 일단 지피티가 맞다고 했음

class MyPageScreen extends StatefulWidget {
  final int memberId;

  const MyPageScreen({super.key, required this.memberId});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

late bool isMyPage;

class _MyPageScreenState extends State<MyPageScreen> {
  int _selectedCategory = 0;

  late BlockProvider blockProvider;
  late FollowProvider followProvider;
  late NotifyProvider notifyProvider;

  @override
  void initState() {
    super.initState();
    isMyPage = (widget.memberId == cur_member);
  }

  @override
  Widget build(BuildContext context) {
    blockProvider = Provider.of<BlockProvider>(context);
    followProvider = Provider.of<FollowProvider>(context);
    notifyProvider = Provider.of<NotifyProvider>(context);

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
            child: ProfileBox(
              memberId: widget.memberId,
              blockProvider: blockProvider,
              followProvider: followProvider,
              notifyProvider: notifyProvider,
            ),
          ),
          // 하단부
          renderBody(),
        ],
      ),
    );
  }

  Widget renderBody() {
    if (blockProvider.isBlocked) {
      return Expanded(
        flex: 3,
        child: Container(
          margin: const EdgeInsets.fromLTRB(1, 0, 0, 228),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 수직으로 가운데 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 수평으로 가운데 정렬
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 1, 19.5),
                child: const Text(
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
                    backgroundColor: const Color(0xFFFEFFC3),
                    padding: const EdgeInsets.symmetric(vertical: 9.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
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
      );
    } else if (notifyProvider.isNotified) {
      return Expanded(
        flex: 3,
        child: Container(
          margin: const EdgeInsets.fromLTRB(1, 0, 0, 228),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // 수직으로 가운데 정렬
            crossAxisAlignment: CrossAxisAlignment.center,
            // 수평으로 가운데 정렬
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 1, 19.5),
                child: const Text(
                  "신고된 유저입니다",
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
                    backgroundColor: const Color(0xFFFEFFC3),
                    padding: const EdgeInsets.symmetric(vertical: 9.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
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
      );
    } else {
      return Expanded(
        flex: 3,
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 20),
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
                      isMyPage ? '나의 코디' : '윈터의 코디',
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
                      isMyPage ? '나의 옷장' : '윈터의 옷장',
                      _selectedCategory == 2,
                      () => _onCategorySelected(2),
                      AppColor.brown,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_selectedCategory == 0 || _selectedCategory == 1)
                Expanded(
                  child: GridWidgetWithButton(
                      postings: TempPostingData().postings,
                      category: _selectedCategory),
                )
              else
                Expanded(
                  child: MyClosetList(),
                )
            ],
          ),
        ),
      );
    }
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