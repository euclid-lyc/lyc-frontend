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
      this.directorId,
      this.model,

      required this.title,
      this.commissionId,
      required this.isDirector,
      required this.isUpdate});

  final int? directorId;
  final CommissionResponseModel? model;
  final String title;
  final int? commissionId;
  final bool isDirector;
  final bool isUpdate;

  @override
  TapViewState createState() => TapViewState();
}

class TapViewState extends State<TapViewScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late final CommissionResponseModel? model;

  late final int? directorId;
  late final int? commissionId;

  late final bool isDirector;
  late final bool isUpdate;

  @override
  void initState() {
    // TODO: implement initState
    model = widget.model;
    directorId = widget.directorId;
    commissionId = widget.commissionId;
    isDirector = widget.isDirector;
    // ?? (directorId == memberId);
    _tabController = TabController(length: 3, vsync: this);
    isUpdate = widget.isUpdate;
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.title;
    return Scaffold(
        appBar: NormalAppbar(title: title),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Container(
                width: 360,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.beige,
                  borderRadius: BorderRadius.circular(20),
                ),
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
                      width: 120,
                      child: const Text("기본 정보"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 128,
                      child: const Text("원하는 스타일"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      child: const Text("기타 사항"),
                    ),
                  ],
                ),

            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                BasicInfoScreen(model: model, isDirector: isDirector),
                DesiredStyleScreen(isDirector: isDirector),
                OtherMattersScreen(
                    isDirector: isDirector,
                    commissionId: commissionId,
                    isUpdate: isUpdate)
              ]),
            ),
          ],
        ));
  }
}
