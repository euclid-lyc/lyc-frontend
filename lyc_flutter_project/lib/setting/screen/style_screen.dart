import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/data/style_list.dart';
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/select_buttons_in_posting.dart';

class StyleScreen extends StatelessWidget {
  const StyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "스타일 정보 변경",
      ),
      body: DefaultPadding(
        bottom: 20.0,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const ContentBox(
              title: "본인의 체형을 알려주세요.",
              child: Column(
                children: [
                  SpecInputLine(label: "키"),
                  SpecInputLine(label: "몸무게"),
                  SpecInputLine(label: "상의 사이즈"),
                  SpecInputLine(label: "하의 사이즈"),
                ],
              ),
            ),
            const ContentBox(
              title: "평소 즐겨입는 스타일은 무엇인가요?",
              child: ButtonList(
                name: styleList.styleOptions,
                selected: [],
              ),
            ),
            const ContentBox(
              title: "평소 즐겨입지 않는 스타일은 무엇인가요?",
              child: ButtonList(
                name: styleList.styleOptions,
                selected: [],
              ),
            ),
            const ContentBox(
              title: "선호하는 소재를 선택해주세요.",
              child: ButtonList(
                name: styleList.materialOptions,
                selected: [],
              ),
            ),
            const ContentBox(
              title: "선호하지 않는 소재를 선택해주세요.",
              child: ButtonList(
                name: styleList.materialOptions,
                selected: [],
              ),
            ),
            const ContentBox(
              title: "선호하는 핏을 선택해주세요.",
              child: ButtonList(
                name: styleList.fitOptions,
                selected: [],
              ),
            ),
            const ContentBox(
              title: "선호하지 않는 핏을 선택해주세요.",
              child: ButtonList(
                name: styleList.fitOptions,
                selected: [],
              ),
            ),
            const ContentBox(
              title: "보완하고 싶은 신체 부위가 있나요?",
              child: ButtonList(
                name: styleList.BodyParts,
                selected: [],
              ),
            ),
            const ContentBox(
              title: "추가로 작성하고 싶은 내용이 있나요?",
              child: CustomTextFormField(
                hint: "ex. 종아리가 너무 두꺼운 게 고민이에요.",
                maxLines: 5,
                containerMargin: 0.0,
                focusedBorderColor: Colors.transparent,
                focusedBorderWidth: 0.0,
                contentPaddingHorizontal: 0.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TwoButtons(
              fstOnPressed: () => Navigator.pop(context),
              scdOnPressed: () {},
              fstLabel: "이전",
              scdLabel: "완료",
            ),
          ],
        ),
      ),
    );
  }
}

/////

class ButtonList extends StatelessWidget {
  final List<String> name;
  final List<String> selected;

  const ButtonList({
    super.key,
    required this.name,
    required this.selected,
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
                  styleList.styleOptions,
                  [],
                  i,
                  () {},
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
                  styleList.styleOptions,
                  [],
                  i,
                  () {},
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
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          child,
        ],
      ),
    );
  }
}

class SpecInputLine extends StatelessWidget {
  final String label;

  const SpecInputLine({
    super.key,
    required this.label,
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
          const Expanded(
            child: CustomTextFormField(
              fillColor: Color(0xffE9E9E9),
              focusedBorderColor: Colors.black,
              focusedBorderWidth: 1.5,
              contentPaddingVertical: 4.0,
              fontSize: 16.0,
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
