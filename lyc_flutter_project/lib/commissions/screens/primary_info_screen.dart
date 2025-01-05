import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../widget/Controller.dart';
import '../../data/style_list.dart';
import '../../styles/app_text_style.dart';
import '../provider/commissions_provider.dart';

class PrimaryInfoScreen extends StatefulWidget {
  const PrimaryInfoScreen({super.key});

  @override
  State<PrimaryInfoScreen> createState() => PrimaryInfoScreenState();
}

class PrimaryInfoScreenState extends State<PrimaryInfoScreen> {
  final Controller _controller1_1 = Controller();
  final Controller _controller1_2 = Controller();
  final Controller _controller1_3 = Controller();
  final Controller _controller1_4 = Controller();
  final Controller _controller2 = Controller();
  final Controller _controller3 = Controller();
  final Controller _controller4 = Controller();
  final Controller _controller5 = Controller();
  final Controller _controller6 = Controller();
  final Controller _controller7 = Controller();
  final Controller _controller8 = Controller();
  final Controller _controller9 = Controller();
  final Controller _controller10 = Controller();


  @override
  Widget build(BuildContext context) {

    Future<void> createCommissions() async {
      final commissionsProvider = Provider.of<CommissionsProvider>(context, listen: false);
      commissionsProvider.basicInfo = commissionsProvider.basicInfo.copyWith(
          height: int.tryParse(_controller1_1.controller.text) ?? 0,
          weight: int.tryParse(_controller1_2.controller.text) ?? 0,
          topSize: _controller1_3.controller.text,
          bottomSize: _controller1_4.controller.text,
          infoStyle: commissionsProvider.basicInfo.infoStyle.copyWith(
              preferredStyleList: _controller2.controller.text.split(','),
              nonPreferredStyleList: _controller3.controller.text.split(',')
          ),
          infoFit: commissionsProvider.basicInfo.infoFit.copyWith(
              preferredFitList: _controller6.controller.text.split(','),
              nonPreferredFitList: _controller7.controller.text.split(',')
          ),
          infoMaterial: commissionsProvider.basicInfo.infoMaterial.copyWith(
              preferredMaterialList: _controller4.controller.text.split(','),
              nonPreferredMaterialList: _controller5.controller.text.split(',')
          ),
          infoBodyType: commissionsProvider.basicInfo.infoBodyType.copyWith(
              goodBodyTypeList: _controller8.controller.text.split(','),
              badBodyTypeList: _controller9.controller.text.split(',')
          ),
          text: _controller10.controller.text
      );

    }

    return ChangeNotifierProvider(
      create: (_) => MembershipState(),
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(
          title: "의뢰서 작성하기",
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 31.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleInfoSection(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildBodyTypeSection(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-2. 평소 즐겨입는 스타일은 무엇인가요?',
                    notifier: context.read<MembershipState>()._selected2,
                    styles: StyleList.styleOptions,
                    text: '기타 스타일 입력',
                    controller: _controller2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-3. 평소 즐겨입지 않는 스타일은 무엇인가요?',
                    notifier: context.read<MembershipState>()._selected3,
                    styles: StyleList.styleOptions,
                    text: '기타 스타일 입력',
                    controller: _controller3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-4. 선호하는 소재를 선택해 주세요.',
                    notifier: context.read<MembershipState>()._selected4,
                    styles: StyleList.materialOptions,
                    text: '기타 소재 입력',
                    controller: _controller4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-5. 선호하지 않는 소재를 선택해 주세요.',
                    notifier: context.read<MembershipState>()._selected5,
                    styles: StyleList.materialOptions,
                    text: '기타 소재 입력',
                    controller: _controller5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-6. 선호하는 핏을 선택해 주세요.',
                    notifier: context.read<MembershipState>()._selected6,
                    styles: StyleList.fitOptions,
                    text: '기타 핏 입력',
                    controller: _controller6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-7. 선호하지 않는 핏을 선택해 주세요.',
                    notifier: context.read<MembershipState>()._selected7,
                    styles: StyleList.fitOptions,
                    text: '기타 핏 입력',
                    controller: _controller7,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-8. 강조하고 싶은 신체 부위가 있나요?',
                    notifier: context.read<MembershipState>()._selected8,
                    styles: StyleList.bodyParts,
                    text: '기타 핏 입력',
                    controller: _controller8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-9. 보완하고 싶은 신체 부위가 있나요?',
                    notifier: context.read<MembershipState>()._selected9,
                    styles: StyleList.bodyParts,
                    text: '기타 핏 입력',
                    controller: _controller9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildAdditionalInfo('3-10.추가로 작성하고 싶은 내용이 있나요?'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdditionalInfo(String text) {
    return Container(
        width: 333,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.fromLTRB(19, 17.5, 19, 12.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyle.littleTitle,
            ),
            const SizedBox(height: 10),
            Expanded(
                child: TextField(
                  controller: _controller10.controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    filled: false,
                    hintText: 'ex.종아리가 너무 두꺼운 게 고민이에요.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: AppTextStyle.hint.copyWith(color: Colors.black),
                ))
          ],
        ));
  }

  Widget buildStyleInfoSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Step 4. 사용자 스타일 정보 입력',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            '선호하는 스타일을 선택해주세요. 이 정보는 디렉팅에 활용됩니다. 추후 “설정” > “스타일 정보 변경”에서 수정 가능합니다.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '스타일 정보 나중에 입력하기 >>',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.underline),
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

  Widget buildBodyTypeSection() {
    return Container(
      width: 333,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(19, 17.5, 19, 12.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.5),
              child: Text(
                '3-1. 본인의 체형을 알려주세요.',
                style: AppTextStyle.littleTitle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildInputField('키', _controller1_1),
                buildInputField('몸무게', _controller1_2),
                buildInputField('상의 사이즈', _controller1_3),
                buildInputField('하의 사이즈', _controller1_4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label, Controller controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                label,
                style: AppTextStyle.hint,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 20,
              child: TextField(
                controller: controller.controller,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  fillColor: AppColor.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: AppTextStyle.hint.copyWith(color: Colors.black),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStyleSection({
    required String title,
    required ValueNotifier<List<String>> notifier,
    required List<String> styles,
    required String text,
    required Controller controller,
  }) {
    notifier.addListener(() {
      controller.controller.text = notifier.value.join(',');
    });
    return Container(
      width: 333,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(15, 20, 14, 12.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 13.5),
              child: Text(
                title,
                style: AppTextStyle.littleTitle,
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: buildStyleOptions(styles: styles, notifier: notifier)),
          SizedBox(
            width: 298,
            height: 30,
            child: TextField(
              controller: controller.controller,
              decoration: InputDecoration(
                hintText: text,
                filled: true,
                fillColor: AppColor.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              style: AppTextStyle.hint.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStyleOptions({
    required List<String> styles,
    required ValueNotifier<List<String>> notifier,
  }) {
    final List<String> styles1 = styles.sublist(0, 4);
    final List<String> styles2 = styles.sublist(4);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: styles1
              .map((style) => buildStyleButton(style, notifier))
              .toList(),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: styles2
              .map((style) => buildStyleButton(style, notifier))
              .toList(),
        ),
      ],
    );
  }

  Widget buildStyleButton(String style, ValueNotifier<List<String>> notifier) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: notifier,
      builder: (context, selectedStyles, child) {
        final isSelected = selectedStyles.contains(style);
        return Expanded(
          child: GestureDetector(
            onTap: () {
              final updatedStyles = List<String>.from(selectedStyles);
              if (isSelected) {
                updatedStyles.remove(style);
              } else {
                updatedStyles.add(style);
              }
              notifier.value = updatedStyles;
            },
            child: Container(
              margin: const EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.brown : AppColor.lightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Center(
                child: Text(
                  style,
                  style: isSelected
                      ? const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColor.lightGrey)
                      : const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MembershipState extends ChangeNotifier {
  final ValueNotifier<List<String>> _selected2 =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<String>> _selected3 =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<String>> _selected4 =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<String>> _selected5 =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<String>> _selected6 =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<String>> _selected7 =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<String>> _selected8 =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<String>> _selected9 =
  ValueNotifier<List<String>>([]);
}
