import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/button_list.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../common/widget/custom_number_picker.dart';
import '../../../common/widget/default_padding.dart';
import '../../../common/widget/spec_input_line.dart';
import '../../../common/widget/content_box.dart';
import '../../../data/style_list.dart';
import '../../../setting/widget/custom_text_form_field.dart';
import '../Provider/join_provider.dart';
import 'join_screen_6.dart';

class JoinScreen5 extends StatefulWidget {
  const JoinScreen5({super.key});

  @override
  State<JoinScreen5> createState() {
    return JoinScreenState5();
  }
}

class JoinScreenState5 extends State<JoinScreen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(title: "회원가입"),
        body: Consumer<JoinProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CustomLoading());
          }
          return DefaultPadding(
            bottom: 20.0,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleInfoSection(),
                ),
                ContentBox(
                  title: "1. 본인의 체형을 알려주세요.",
                  child: Column(
                    children: [
                      SpecInputLine<JoinProvider>(
                        label: "키",
                        onChanged: (p0) =>
                            value.updateHeight(height: int.parse(p0)),
                      ),
                      SpecInputLine<JoinProvider>(
                        label: "몸무게",
                        onChanged: (p0) =>
                            value.updateWeight(weight: int.parse(p0)),
                      ),
                      SpecInputLine<JoinProvider>(
                        label: "상의 사이즈",
                        initialValue: "",
                        getValue: (p0) => p0.topSize,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                CustomNumberPicker<JoinProvider>(
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
                      SpecInputLine<JoinProvider>(
                        label: "하의 사이즈",
                        initialValue: "",
                        getValue: (p0) => p0.bottomSize,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                CustomNumberPicker<JoinProvider>(
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
                    name: StyleList.styleOptions,
                    selected: value.joinInfo.infoStyle.preferredStyleList,
                    onSelected: (v) => value.updatePreferredStyle(selected: v),
                  ),
                ),
                ContentBox(
                  title: "3. 평소 즐겨입지 않는 스타일은 무엇인가요?",
                  child: ButtonList(
                    name: StyleList.styleOptions,
                    selected: value.joinInfo.infoStyle.nonPreferredStyleList,
                    onSelected: (v) =>
                        value.updateNonPreferredStyle(selected: v),
                  ),
                ),
                ContentBox(
                  title: "4. 선호하는 소재를 선택해주세요.",
                  child: ButtonList(
                    name: StyleList.materialOptions,
                    selected: value.joinInfo.infoMaterial.preferredMaterialList,
                    onSelected: (v) =>
                        value.updatePreferredMaterials(selected: v),
                  ),
                ),
                ContentBox(
                  title: "5. 선호하지 않는 소재를 선택해주세요.",
                  child: ButtonList(
                    name: StyleList.materialOptions,
                    selected:
                        value.joinInfo.infoMaterial.nonPreferredMaterialList,
                    onSelected: (v) =>
                        value.updateNonPreferredMaterials(selected: v),
                  ),
                ),
                ContentBox(
                  title: "6. 선호하는 핏을 선택해주세요.",
                  child: ButtonList(
                    name: StyleList.fitOptions,
                    selected: value.joinInfo.infoFit.preferredFitList,
                    onSelected: (v) => value.updatePreferredFits(selected: v),
                  ),
                ),
                ContentBox(
                  title: "7. 선호하지 않는 핏을 선택해주세요.",
                  child: ButtonList(
                    name: StyleList.fitOptions,
                    selected: value.joinInfo.infoFit.nonPreferredFitList,
                    onSelected: (v) =>
                        value.updateNonPreferredFits(selected: v),
                  ),
                ),
                ContentBox(
                  title: "8. 강조하고 싶은 신체 부위가 있나요?",
                  child: ButtonList(
                    name: StyleList.bodyParts,
                    selected: value.joinInfo.infoBodyType.goodBodyTypeList,
                    onSelected: (v) => value.updateGoodBodyTypes(selected: v),
                  ),
                ),
                ContentBox(
                  title: "9. 보완하고 싶은 신체 부위가 있나요?",
                  child: ButtonList(
                    name: StyleList.bodyParts,
                    selected: value.joinInfo.infoBodyType.badBodyTypeList,
                    onSelected: (v) => value.updateBadBodyTypes(selected: v),
                  ),
                ),
                ContentBox(
                  title: "10. 추가로 작성하고 싶은 내용이 있나요?",
                  child: CustomTextFormField(
                    hint: "ex. 종아리가 너무 두꺼운 게 고민이에요.",
                    maxLines: 5,
                    focusedBorderColor: Colors.transparent,
                    initialValue: value.joinInfo.text,
                    onChanged: (text) => value.updateText(text: text),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CustomNextButton(
                    onPressed: () async {
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JoinScreen6()),
                        );
                      }
                    },
                    text: '다음',
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Widget buildStyleInfoSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Step 5. 사용자 스타일 정보 입력',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            '선호하는 스타일을 선택해주세요. 이 정보는 디렉팅에 활용됩니다.\n추후 “설정” > “스타일 정보 변경”에서 수정 가능합니다.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JoinScreen6()),
                );
              },
              child: const Text(
                '스타일 정보 나중에 입력하기 >>',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          const Text(
            '(스타일 정보를 입력하지 않는 경우 일부 기능이 제한될 수 있습니다)',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
