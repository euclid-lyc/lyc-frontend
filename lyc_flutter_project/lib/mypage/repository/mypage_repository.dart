import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/data/temp_posting_data.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/category_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/widget/blocked_widget.dart';
import 'package:lyc_flutter_project/mypage/widget/grid_widget_with_button.dart';
import 'package:lyc_flutter_project/mypage/widget/icons_in_profile_box.dart';
import 'package:lyc_flutter_project/mypage/widget/my_closet_list.dart';
import 'package:lyc_flutter_project/mypage/widget/notified_widget.dart';
import 'package:lyc_flutter_project/mypage/widget/profile_box.dart';
import 'package:lyc_flutter_project/widget/bottom_buttons.dart';

class MypageRepositoryProvider extends ChangeNotifier {
  final int memberId;
  final BlockProvider blockProvider;
  final FollowProvider followProvider;
  final NotifyProvider notifyProvider;
  final CategoryProvider categoryProvider;

  bool _isMypage;

  bool get isMypage => _isMypage;

  MypageRepositoryProvider({
    required this.memberId,
    required this.blockProvider,
    required this.followProvider,
    required this.notifyProvider,
    required this.categoryProvider,
  }) : _isMypage = (cur_member == memberId) {
    // Ensure listeners are necessary
    blockProvider.addListener(_listener);
    followProvider.addListener(_listener);
    notifyProvider.addListener(_listener);
    categoryProvider.addListener(_listener);
  }

  void _listener() {
    notifyListeners(); // Notify listeners if any property changes
  }

  @override
  void dispose() {
    // Remove listeners
    blockProvider.removeListener(_listener);
    followProvider.removeListener(_listener);
    notifyProvider.removeListener(_listener);
    categoryProvider.removeListener(_listener);
    super.dispose(); // Call the super dispose method
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
                  child: ProfileBox(),
                ),
                Expanded(
                  flex: 5,
                  child: IconsInProfileBox(
                    memberId: memberId,
                    isMypage: isMypage,
                    // Pass providers only if IconsInProfileBox needs them
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
    return Container(
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
                  onPressed: () => categoryProvider.onSelected(0), // Ensure it's a function
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
          Expanded(child: getList()),
        ],
      ),
    );
  }

  Widget getList() {
    switch (categoryProvider.curCategory) {
      case 0:
      case 1:
        return GridWidgetWithButton(
          postings: TempPostingData().postings,
          category: categoryProvider.curCategory,
        );
      case 2:
        return MyClosetList();
      default:
        return Container();
    }
  }
}
