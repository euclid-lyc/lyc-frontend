import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_number_picker.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/style_list.dart' as styles;
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/mypage/widget/select_buttons_in_posting.dart';
import 'package:provider/provider.dart';
import '../../auth/join/Provider/login_provider.dart';
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
                            SpecInputLine(
                                label: "키",
                                initialValue:
                                    value.model.basicInfo.height.toString(),
                                onChanged: (p0) =>
                                    value.updateHeight(height: int.parse(p0)),
                                enabled: !isDirector),
                            SpecInputLine(
                                label: "몸무게",
                                initialValue:
                                    value.model.basicInfo.weight.toString(),
                                onChanged: (p0) =>
                                    value.updateWeight(weight: int.parse(p0)),
                                enabled: !isDirector),
                            SpecInputLine(
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
                            SpecInputLine(
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

class ButtonList extends StatelessWidget {
  final List<String> name;
  final List<String> selected;
  final Function(String) onSelected;
  final bool enabled;

  const ButtonList(
      {super.key,
      required this.name,
      required this.selected,
      required this.onSelected,
      required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < 4; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  name,
                  selected,
                  i,
                  () => onSelected(name[i]),
                  AppColor.brown,
                  AppColor.lightGrey,
                  enabled,
                ),
              ),
          ],
        ),
        Row(
          children: [
            for (var i = 4; i < 8; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  name,
                  selected,
                  i,
                  () => onSelected(name[i]),
                  AppColor.brown,
                  AppColor.lightGrey,
                   enabled,
                ),
              ),
          ],
        )
      ],
    );
  }
}

class ContentBox extends StatelessWidget {
  final String title;
  final Widget child;

  const ContentBox({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class SpecInputLine extends StatelessWidget {
  final String label;
  final String? initialValue;
  final VoidCallback? onTap;
  final int Function(CommissionsProvider)? getValue;
  final Function(String)? onChanged;
  final bool enabled;

  const SpecInputLine({
    super.key,
    required this.label,
    required this.initialValue,
    this.onTap,
    this.getValue,
    this.onChanged,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: (label == "키" || label == "몸무게")
                ? CustomTextFormField(
                    fillColor: const Color(0xffE9E9E9),
                    focusedBorderColor: Colors.black,
                    focusedBorderWidth: 1.5,
                    contentPaddingVertical: 4,
                    fontSize: 16,
                    isDense: true,
                    initialValue: initialValue ?? '',
                    keyboardType: TextInputType.number,
                    onChanged: onChanged!,
                    enabled: enabled,
                  )
                : SpecSizeBox(
                    onTap: onTap!,
              getValue: getValue!,
                  ),
          ),
        ],
      ),
    );
  }
}

class SpecSizeBox extends StatelessWidget {
  final VoidCallback onTap;
  final int Function(CommissionsProvider) getValue;

  const SpecSizeBox({
    super.key,
    required this.onTap,
    required this.getValue,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CommissionsProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xffE9E9E9),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 20,
            ),
            child: Text(
              getValue(value).toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
