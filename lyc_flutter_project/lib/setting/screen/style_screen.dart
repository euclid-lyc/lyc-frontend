import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/custom_number_picker.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/style_list.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';
import 'package:lyc_flutter_project/common/widget/default_padding.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:provider/provider.dart';
import '../../auth/join/Provider/login_provider.dart';
import '../../commissions/screen/desired_style_screen.dart';
import '../../commissions/screen/other_matters_screen.dart';
import '../../common/widget/button_list.dart';
import '../../common/widget/spec_input_line.dart';

class StyleScreen extends StatefulWidget {
  const StyleScreen({super.key});

  @override
  State<StyleScreen> createState() => _StyleScreenState();
}

class _StyleScreenState extends State<StyleScreen> {
  int? memberId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "스타일 정보 변경",
      ),
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          memberId = loginProvider.memberId;

          return DefaultPadding(
            bottom: 20.0,
            child: Consumer<SettingProvider>(
              builder: (context, value, child) {
                if (memberId == null) {
                  return const Center(
                    child: CustomLoading(),
                  );
                } else {
                  return FutureBuilder(
                    future: value.getStyleInfo(memberId: memberId!),
                    builder: (context, snapshot) {
                      if (value.loadingStyleInfo) {
                        return const Center(child: CustomLoading());
                      }
                      return ListView(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          ContentBox(
                            title: "1. 본인의 체형을 알려주세요.",
                            child: Column(
                              children: [
                                SpecInputLine<SettingProvider>(
                                  label: "키",
                                  initialValue: value.style.spec.height.toString(),
                                  onChanged: (p0) => value.updateHeight(selected: p0),
                                ),
                                SpecInputLine<SettingProvider>(
                                  label: "몸무게",
                                  initialValue: value.style.spec.weight.toString(),
                                  onChanged: (p0) => value.updateWeight(selected: p0),
                                ),
                                SpecInputLine<SettingProvider>(
                                  label: "상의 사이즈",
                                  initialValue: "",
                                  getValue: (p0) => p0.topSize,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomNumberPicker<SettingProvider>(
                                        title: "상의 사이즈를 선택해주세요.",
                                        minValue: 80,
                                        maxValue: 130,
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
                                SpecInputLine<SettingProvider>(
                                  label: "하의 사이즈",
                                  initialValue: "",
                                  getValue: (p0) => p0.bottomSize,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomNumberPicker<SettingProvider>(
                                        title: "하의 사이즈를 선택해주세요.",
                                        minValue: 22,
                                        maxValue: 42,
                                        getValue: (p0) => p0.bottomSize,
                                        updateValue: (p0, p1) => p0.updateBottomSize(
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
                              name: StyleList.styleOptions,
                              selected: value.style.preferredStyle.styles,
                              onSelected: (v) => value.updatePreferredStyle(selected: v),
                            ),
                          ),
                          ContentBox(
                            title: "3. 평소 즐겨입지 않는 스타일은 무엇인가요?",
                            child: ButtonList(
                              name: StyleList.styleOptions,
                              selected: value.style.nonPreferredStyle.styles,
                              onSelected: (v) => value.updateNonPreferredStyle(selected: v),
                            ),
                          ),
                          ContentBox(
                            title: "4. 선호하는 소재를 선택해주세요.",
                            child: ButtonList(
                              name: StyleList.materialOptions,
                              selected: value.style.preferredMaterials.materials,
                              onSelected: (v) => value.updatePreferredMaterials(selected: v),
                            ),
                          ),
                          ContentBox(
                            title: "5. 선호하지 않는 소재를 선택해주세요.",
                            child: ButtonList(
                              name: StyleList.materialOptions,
                              selected: value.style.nonPreferredMaterials.materials,
                              onSelected: (v) => value.updateNonPreferredMaterials(selected: v),
                            ),
                          ),
                          ContentBox(
                            title: "6. 선호하는 핏을 선택해주세요.",
                            child: ButtonList(
                              name: StyleList.fitOptions,
                              selected: value.style.preferredFits.fits,
                              onSelected: (v) => value.updatePreferredFits(selected: v),
                            ),
                          ),
                          ContentBox(
                            title: "7. 선호하지 않는 핏을 선택해주세요.",
                            child: ButtonList(
                              name: StyleList.fitOptions,
                              selected: value.style.nonPreferredFits.fits,
                              onSelected: (v) => value.updateNonPreferredFits(selected: v),
                            ),
                          ),
                          ContentBox(
                            title: "8. 보완하고 싶은 신체 부위가 있나요?",
                            child: ButtonList(
                              name: StyleList.bodyParts,
                              selected: value.style.badBodyTypes.bodyTypes,
                              onSelected: (v) => value.updateBadBodyTypes(selected: v),
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
                              onChanged: (text) => value.updateDetails(text: text),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TwoButtons(
                            fstOnPressed: () async {
                              Navigator.pop(context);
                              await value.getStyleInfo(
                                memberId: memberId!,
                                refresh: true,
                              );
                            },
                            scdOnPressed: () async {
                              await value.updateStyleInfo();
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            },
                            fstLabel: "이전",
                            scdLabel: "완료",
                          ),
                        ],
                      );
                    },
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


