import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/screen/basic_info_screen.dart';
import 'package:lyc_flutter_project/commissions/screen/desired_style_screen.dart';
import 'package:lyc_flutter_project/commissions/screen/other_matters_screen.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

import '../../common/widget/normal_appbar.dart';
import '../model/commission_response_model.dart';

class TapViewScreen extends StatefulWidget {
  const TapViewScreen(
      {super.key,
      required this.directorId,
      this.model,
      required this.memberId,
      required this.title,
      this.commissionId});

  final int directorId;
  final int memberId;
  final CommissionResponseModel? model;
  final String title;
  final int? commissionId;

  @override
  TapViewState createState() => TapViewState();
}

class TapViewState extends State<TapViewScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommissionResponseModel? model = widget.model;
    final int directorId = widget.directorId;
    final int? commissionId = widget.commissionId;
    final bool isDirector = widget.directorId == widget.memberId;
    final String title = widget.title;
    return Scaffold(
        appBar: NormalAppbar(title: title),
        body: Column(
          children: [
            Container(
              color: AppColor.beige,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColor.brown,
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: [
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text("기본 정보"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text("원하는 스타일"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text("기타 사항"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                BasicInfoScreen(directorId: directorId, model: model),
                const DesiredStyleScreen(),
                OtherMattersScreen(isDirector: isDirector,commissionId:commissionId)
              ]),
            ),
          ],
        ));
  }
}
