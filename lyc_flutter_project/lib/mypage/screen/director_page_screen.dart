import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/mypage/layout/mypage_layout.dart';
import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/category_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/follow_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/director_page_provider.dart';
import 'package:lyc_flutter_project/mypage/provider/notify_provider.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';
import 'package:provider/provider.dart';

class DirectorPageScreen extends StatelessWidget {
  final int memberId;

  const DirectorPageScreen({super.key, required this.memberId});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MypageRepositoryProvider(
            dio: context.read<DioProvider>().dio,
          ),
        ),
        ChangeNotifierProvider<DirectorPageProvider>(
          create: (context) => DirectorPageProvider(
            categoryProvider: context.read<CategoryProvider>(),
            notifyProvider: context.read<NotifyProvider>(),
            followProvider: context.read<FollowProvider>(),
            blockProvider: context.read<BlockProvider>(),
            mypageRepositoryProvider: context.read<MypageRepositoryProvider>(),
            memberId: memberId,
          ),
        ),
      ],
      child: Consumer<DirectorPageProvider>(
        builder: (context, value, child) {
          return MypageLayout(
            top: value.renderTop(),
            body: value.renderBody(),
          );
        },
      ),
    );
  }
}
