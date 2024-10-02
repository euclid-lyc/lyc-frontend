import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/Join/Provider/login_provider.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_number_picker.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/style_list.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/select_buttons_in_posting.dart';
import 'package:provider/provider.dart';

class StyleScreen extends StatefulWidget {
  const StyleScreen({super.key});

  @override
  State<StyleScreen> createState() => _StyleScreenState();
}

class _StyleScreenState extends State<StyleScreen> {
  late int memberId;

  @override
  void initState() {
    super.initState();
    memberId = context.read<LoginProvider>().memberId!;
    context.read<SettingProvider>().getStyleInfo(memberId: memberId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "스타일 정보 변경",
      ),
      body: DefaultPadding(
        bottom: 20.0,
        child: Consumer<SettingProvider>(
          builder: (context, value, child) {
            return value.loadingStyleInfo
                ? const Center(child: CustomLoading())
                : ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      ContentBox(
                        title: "1. 본인의 체형을 알려주세요.",
                        child: Column(
                          children: [
                            SpecInputLine(
                              label: "키",
                              initialValue: value.style.spec.height.toString(),
                            ),
                            SpecInputLine(
                              label: "몸무게",
                              initialValue: value.style.spec.weight.toString(),
                            ),
                            SpecInputLine(
                              label: "상의 사이즈",
                              initialValue: "",
                              getValue: (p0) => p0.topSize,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      CustomNumberPicker<SettingProvider>(
                                    title: "상의 사이즈를 선택해주세요.",
                                    minValue: 80,
                                    maxValue: 120,
                                    step: 5,
                                    getValue: (p0) => p0.topSize,
                                    updateValue: (p0, p1) => p0.updateTopSize(
                                      selected: p1,
                                    ),
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
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      CustomNumberPicker<SettingProvider>(
                                    title: "하의 사이즈를 선택해주세요.",
                                    minValue: 24,
                                    maxValue: 42,
                                    getValue: (p0) => p0.bottomSize,
                                    updateValue: (p0, p1) =>
                                        p0.updateBottomSize(
                                      selected: p1,
                                    ),
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
                          name: styleList.styleOptions,
                          selected: value.style.preferredStyle.styles,
                          onSelected: (v) =>
                              value.updatePreferredStyle(selected: v),
                        ),
                      ),
                      ContentBox(
                        title: "3. 평소 즐겨입지 않는 스타일은 무엇인가요?",
                        child: ButtonList(
                          name: styleList.styleOptions,
                          selected: value.style.nonPreferredStyle.styles,
                          onSelected: (v) =>
                              value.updateNonPreferredStyle(selected: v),
                        ),
                      ),
                      ContentBox(
                        title: "4. 선호하는 소재를 선택해주세요.",
                        child: ButtonList(
                          name: styleList.materialOptions,
                          selected: value.style.preferredMaterials.materials,
                          onSelected: (v) =>
                              value.updatePreferredMaterials(selected: v),
                        ),
                      ),
                      ContentBox(
                        title: "5. 선호하지 않는 소재를 선택해주세요.",
                        child: ButtonList(
                          name: styleList.materialOptions,
                          selected: value.style.nonPreferredMaterials.materials,
                          onSelected: (v) =>
                              value.updateNonPreferredMaterials(selected: v),
                        ),
                      ),
                      ContentBox(
                        title: "6. 선호하는 핏을 선택해주세요.",
                        child: ButtonList(
                          name: styleList.fitOptions,
                          selected: value.style.preferredFits.fits,
                          onSelected: (v) =>
                              value.updatePreferredFits(selected: v),
                        ),
                      ),
                      ContentBox(
                        title: "7. 선호하지 않는 핏을 선택해주세요.",
                        child: ButtonList(
                          name: styleList.fitOptions,
                          selected: value.style.nonPreferredFits.fits,
                          onSelected: (v) =>
                              value.updateNonPreferredFits(selected: v),
                        ),
                      ),
                      ContentBox(
                        title: "8. 보완하고 싶은 신체 부위가 있나요?",
                        child: ButtonList(
                          name: styleList.BodyParts,
                          selected: value.style.badBodyTypes.bodyTypes,
                          onSelected: (v) =>
                              value.updateBadBodyTypes(selected: v),
                        ),
                      ),
                      ContentBox(
                        title: "9. 추가로 작성하고 싶은 내용이 있나요?",
                        child: CustomTextFormField(
                          hint: "ex. 종아리가 너무 두꺼운 게 고민이에요.",
                          maxLines: 5,
                          containerMargin: 0.0,
                          focusedBorderColor: Colors.transparent,
                          focusedBorderWidth: 0.0,
                          contentPaddingHorizontal: 8.0,
                          initialValue: value.style.details,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TwoButtons(
                        fstOnPressed: () {
                          Navigator.pop(context);
                          value.getStyleInfo(memberId: memberId);
                        },
                        scdOnPressed: () async {
                          await value.updateStyleInfo();
                          Navigator.pop(context);
                        },
                        fstLabel: "이전",
                        scdLabel: "완료",
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

/////

class ButtonList extends StatelessWidget {
  final List<String> name;
  final List<String> selected;
  final Function(String) onSelected;

  const ButtonList({
    super.key,
    required this.name,
    required this.selected,
    required this.onSelected,
  });

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
      //height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
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
  final String initialValue;
  final VoidCallback? onTap;
  final int Function(SettingProvider)? getValue;

  const SpecInputLine({
    super.key,
    required this.label,
    required this.initialValue,
    this.onTap,
    this.getValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: (label == "키" || label == "몸무게")
                ? CustomTextFormField(
                    fillColor: const Color(0xffE9E9E9),
                    focusedBorderColor: Colors.black,
                    focusedBorderWidth: 1.5,
                    contentPaddingVertical: 4.0,
                    fontSize: 16.0,
                    isDense: true,
                    initialValue: initialValue,
                    keyboardType: TextInputType.number,
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
  final int Function(SettingProvider) getValue;

  const SpecSizeBox({
    super.key,
    required this.onTap,
    required this.getValue,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: const Color(0xffE9E9E9),
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 20.0,
            ),
            child: Text(
              getValue(value).toString(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
