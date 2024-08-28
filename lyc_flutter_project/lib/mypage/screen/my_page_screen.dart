import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/category_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:provider/provider.dart';

class MyPageScreen extends StatelessWidget {
  final int memberId;

  const MyPageScreen({super.key, required this.memberId});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CategoryProvider(),
          ),
          ChangeNotifierProvider<MypageRepositoryProvider>(
            create: (context) => MypageRepositoryProvider(
              categoryProvider: context.read<CategoryProvider>(),
              notifyProvider: context.read<NotifyProvider>(),
              followProvider: context.read<FollowProvider>(),
              blockProvider: context.read<BlockProvider>(),
              memberId: memberId,
            ),
          ),
        ],
        child: Scaffold(
            backgroundColor: AppColor.lightGrey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColor.beige,
            ),
            body: Consumer<MypageRepositoryProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Expanded(
                      child: value.renderTop(),
                    ),
                    Expanded(
                      flex: 3,
                      child: DefaultPadding(
                        bottom: 20.0,
                        child: value.renderBody(),
                      ),
                      //child: Container(),
                    ),
                  ],
                );
              },
            )));
  }
}
