import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_number_picker.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/style_list.dart' as styles;
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:provider/provider.dart';
import '../../auth/join/Provider/login_provider.dart';
import '../../common/widget/button_list.dart';
import '../../common/widget/content_box.dart';
import '../../common/widget/spec_input_line.dart';
import '../model/commission_response_model.dart';
import '../provider/commissions_provider.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen(
      {super.key, required this.model, required this.isDirector});

  final CommissionResponseModel? model;
  final bool isDirector;

  @override
  State<BasicInfoScreen> createState() => BasicInfoScreenState();
}

class BasicInfoScreenState extends State<BasicInfoScreen> {
  int? memberId;

  @override
  Widget build(BuildContext context) {
    final bool isDirector = widget.isDirector;
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          memberId = loginProvider.memberId;
          return DefaultPadding(
            bottom: 20,
            child: Consumer<CommissionsProvider>(
              builder: (context, value, child) {
                if (memberId == null) {
                  return const Center(
                    child: CustomLoading(),
                  );
                } else {
                  return ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      ContentBox(
                        title: "1. 본인의 체형을 알려주세요.",
                        child: Column(
                          children: [
                            SpecInputLine<CommissionsProvider>(
                                label: "키",
                                initialValue:
                                    value.model.basicInfo.height.toString(),
                                onChanged: (p0) =>
                                    value.updateHeight(height: int.parse(p0)),
                                enabled: !isDirector),
                            SpecInputLine<CommissionsProvider>(
                                label: "몸무게",
                                initialValue:
                                    value.model.basicInfo.weight.toString(),
                                onChanged: (p0) =>
                                    value.updateWeight(weight: int.parse(p0)),
                                enabled: !isDirector),
                            SpecInputLine<CommissionsProvider>(
                              label: "상의 사이즈",
                              initialValue: "",
                              getValue: (p0) => p0.topSize,
                              enabled: !isDirector,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      CustomNumberPicker<CommissionsProvider>(
                                    title: "상의 사이즈를 선택해주세요.",
                                    minValue: 80,
                                    maxValue: 130,
                                    getValue: (p0) => p0.topSize,
                                    step: 5,
                                    updateValue: (p0, p1) =>
                                        p0.updateTopSize(topSize: p1),
                                    fstOnPressed: () {
                                      value.rollbackTopSize();
                                      Navigator.pop(context);
                                    },
                                    scdOnPressed: () => Navigator.pop(context),
                                  ),
                                );
                              },
                            ),
                            SpecInputLine<CommissionsProvider>(
                              label: "하의 사이즈",
                              initialValue: "",
                              getValue: (p0) => p0.bottomSize,
                              enabled: !isDirector,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      CustomNumberPicker<CommissionsProvider>(
                                    title: "하의 사이즈를 선택해주세요.",
                                    minValue: 22,
                                    maxValue: 42,
                                    getValue: (p0) => p0.bottomSize,
                                    updateValue: (p0, p1) =>
                                        p0.updateBottomSize(bottomSize: p1),
                                    fstOnPressed: () {
                                      value.rollbackBottomSize();
                                      Navigator.pop(context);
                                    },
                                    scdOnPressed: () => Navigator.pop(context),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      ContentBox(
                        title: "2. 평소 즐겨입는 스타일은 무엇인가요?",
                        child: ButtonList(
                            name: styles.StyleList.styleOptions,
                            selected: value
                                .model.basicInfo.infoStyle.preferredStyleList,
                            onSelected: (v) =>
                                value.updatePreferredStyle(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "3. 평소 즐겨입지 않는 스타일은 무엇인가요?",
                        child: ButtonList(
                            name: styles.StyleList.styleOptions,
                            selected: value.model.basicInfo.infoStyle
                                .nonPreferredStyleList,
                            onSelected: (v) =>
                                value.updateNonPreferredStyle(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "4. 선호하는 소재를 선택해주세요.",
                        child: ButtonList(
                            name: styles.StyleList.materialOptions,
                            selected: value.model.basicInfo.infoMaterial
                                .preferredMaterialList,
                            onSelected: (v) =>
                                value.updatePreferredMaterials(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "5. 선호하지 않는 소재를 선택해주세요.",
                        child: ButtonList(
                            name: styles.StyleList.materialOptions,
                            selected: value.model.basicInfo.infoMaterial
                                .nonPreferredMaterialList,
                            onSelected: (v) =>
                                value.updateNonPreferredMaterials(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "6. 선호하는 핏을 선택해주세요.",
                        child: ButtonList(
                            name: styles.StyleList.fitOptions,
                            selected:
                                value.model.basicInfo.infoFit.preferredFitList,
                            onSelected: (v) =>
                                value.updatePreferredFits(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "7. 선호하지 않는 핏을 선택해주세요.",
                        child: ButtonList(
                            name: styles.StyleList.fitOptions,
                            selected: value
                                .model.basicInfo.infoFit.nonPreferredFitList,
                            onSelected: (v) =>
                                value.updateNonPreferredFits(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "8. 강조하고 싶은 신체 부위가 있나요?",
                        child: ButtonList(
                            name: styles.StyleList.bodyParts,
                            selected: value
                                .model.basicInfo.infoBodyType.goodBodyTypeList,
                            onSelected: (v) =>
                                value.updateGoodBodyTypes(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "9. 보완하고 싶은 신체 부위가 있나요?",
                        child: ButtonList(
                            name: styles.StyleList.bodyParts,
                            selected: value
                                .model.basicInfo.infoBodyType.badBodyTypeList,
                            onSelected: (v) =>
                                value.updateBadBodyTypes(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "10. 추가로 작성하고 싶은 내용이 있나요?",
                        child: CustomTextFormField(
                            hint: "ex. 종아리가 너무 두꺼운 게 고민이에요.",
                            maxLines: 5,
                            focusedBorderColor: Colors.transparent,
                            initialValue: value.model.basicInfo.text,
                            onChanged: (text) => value.updateText(text: text),
                            enabled: !isDirector),
                      ),
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
