import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/mypage/model/base_preview.dart';
import 'package:lyc_flutter_project/mypage/model/mypage_preview.dart';
import 'package:lyc_flutter_project/mypage/model/result.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/category_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/mypage/widget/blocked_widget.dart';
import 'package:lyc_flutter_project/mypage/widget/grid_widget_with_button.dart';
import 'package:lyc_flutter_project/mypage/widget/icons_in_profile_box.dart';
import 'package:lyc_flutter_project/mypage/widget/my_closet_list.dart';
import 'package:lyc_flutter_project/mypage/widget/notified_widget.dart';
import 'package:lyc_flutter_project/mypage/widget/profile_box.dart';
import 'package:lyc_flutter_project/widget/bottom_buttons.dart';

class MypageProvider extends ChangeNotifier {
  final int memberId;
  final BlockProvider blockProvider;
  final FollowProvider followProvider;
  final NotifyProvider notifyProvider;
  final CategoryProvider categoryProvider;
  final MypageRepositoryProvider mypageRepositoryProvider;

  final bool _isMypage;

  bool get isMypage => _isMypage;

  MypageProvider({
    required this.memberId,
    required this.blockProvider,
    required this.followProvider,
    required this.notifyProvider,
    required this.categoryProvider,
    required this.mypageRepositoryProvider,
  }) : _isMypage = (cur_member == memberId) {
    blockProvider.addListener(_listener);
    followProvider.addListener(_listener);
    notifyProvider.addListener(_listener);
    categoryProvider.addListener(_listener);
  }

  void _listener() {
    notifyListeners();
  }

  @override
  void dispose() {
    blockProvider.removeListener(_listener);
    followProvider.removeListener(_listener);
    notifyProvider.removeListener(_listener);
    categoryProvider.removeListener(_listener);
    super.dispose();
  }

  Widget renderTop() {
    return Container(
      color: AppColor.beige,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Expanded(
            flex: 12,
            child: Row(
              children: [
                Expanded(
                  flex: 13,
                  child: ProfileBox(
                    memberId: memberId,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: IconsInProfileBox(
                    memberId: memberId,
                    isMypage: isMypage,
                    blockProvider: isMypage ? null : blockProvider,
                    followProvider: isMypage ? null : followProvider,
                    notifyProvider: isMypage ? null : notifyProvider,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 4,
            child: BottomButtons(memberId: memberId),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget renderBody() {
    if (!_isMypage) {
      if (blockProvider.isBlocked(memberId)) {
        return const BlockedWidget();
      } else if (notifyProvider.isNotified(memberId)) {
        return const NotifiedWidget();
      }
    }
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                SwitchCategoryButton(
                  text: _isMypage ? '나의 코디' : '윈터의 코디',
                  isSelected: categoryProvider.curCategory == 0,
                  onPressed: () => categoryProvider.onSelected(0),
                  color: AppColor.brown,
                ),
                SwitchCategoryButton(
                  text: "저장한 코디",
                  isSelected: categoryProvider.curCategory == 1,
                  onPressed: () => categoryProvider.onSelected(1),
                  color: AppColor.brown,
                ),
                SwitchCategoryButton(
                  text: _isMypage ? '나의 옷장' : '윈터의 옷장',
                  isSelected: categoryProvider.curCategory == 2,
                  onPressed: () => categoryProvider.onSelected(2),
                  color: AppColor.brown,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: FutureBuilder<BasePreview>(
              future: getList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  // print("[Success] ${snapshot.data}");
                  final result = snapshot.data!.result;
                  if (result is CoordieResult) {
                    final lst = result.imageList;
                    if (lst.isEmpty) {
                      return const Text("비어있습니다");
                    } else {
                      return GridWidgetWithButton(
                        postings: lst,
                        category: categoryProvider.curCategory,
                      );
                    }
                  } else if (result is ClosetResult) {
                    final lst = result.clothesList;
                    if (lst.isEmpty) {
                      return const Text("비어있습니다");
                    } else {
                      return MyClosetList(postings: lst);
                    }
                  } else {
                    return const Text("[Error] 잘못된 데이터 타입");
                  }
                } else {
                  return const Center(child: Text("[Error] 응답 없음"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<BasePreview> getList() async {
    print("start getList");
    try {
      switch (categoryProvider.curCategory) {
        case 0:
          return await mypageRepositoryProvider.mypageRepository
              .getMyCoorides(memberId: memberId);
        case 1:
          return await mypageRepositoryProvider.mypageRepository
              .getSavedCoordies(memberId: memberId);
        case 2:
          return await mypageRepositoryProvider.mypageRepository
              .getMyCloset(memberId: memberId);
        default:
          throw Exception("Invalid category");
      }
    } catch (e) {
      print("Error in getList: $e");
      rethrow;
    }
  }
}
