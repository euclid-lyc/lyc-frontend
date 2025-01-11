import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../widget/Controller.dart';
import '../../data/style_list.dart';
import '../../styles/app_text_style.dart';
import '../provider/commissions_provider.dart';
import 'desired_style_screen.dart';

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

  final membershipState = MembershipState();

  @override
  Widget build(BuildContext context) {
    Future<void> createCommissions() async {
     // final commissionsProvider =
          Provider.of<CommissionsProvider>(context, listen: false);
      // commissionsProvider.basicInfo = commissionsProvider.basicInfo.copyWith(
      //     height: int.tryParse(_controller1_1.controller.text) ?? 0,
      //     weight: int.tryParse(_controller1_2.controller.text) ?? 0,
      //     topSize: _controller1_3.controller.text,
      //     bottomSize: _controller1_4.controller.text,
      //     infoStyle: commissionsProvider.basicInfo.infoStyle.copyWith(
      //         preferredStyleList: _controller2.controller.text.split(','),
      //         nonPreferredStyleList: _controller3.controller.text.split(',')),
      //     infoFit: commissionsProvider.basicInfo.infoFit.copyWith(
      //         preferredFitList: _controller6.controller.text.split(','),
      //         nonPreferredFitList: _controller7.controller.text.split(',')),
      //     infoMaterial: commissionsProvider.basicInfo.infoMaterial.copyWith(
      //         preferredMaterialList: _controller4.controller.text.split(','),
      //         nonPreferredMaterialList:
      //             _controller5.controller.text.split(',')),
      //     infoBodyType: commissionsProvider.basicInfo.infoBodyType.copyWith(
      //         goodBodyTypeList: _controller8.controller.text.split(','),
      //         badBodyTypeList: _controller9.controller.text.split(',')),
      //     text: _controller10.controller.text);
    }

    return ChangeNotifierProvider(
      create: (_) => membershipState,
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: AppColor.lightGrey,
          appBar: const NormalAppbar(
            title: "의뢰서 작성하기",
          ),
          body: SingleChildScrollView(
            child:Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildBodyTypeSection(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 2. 평소 즐겨입는 스타일은 무엇인가요?',
                      notifier: membershipState._selected2,
                      styles: StyleList.styleOptions,
                      text: '기타 스타일 입력',
                      controller: _controller2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 3. 평소 즐겨입지 않는 스타일은 무엇인가요?',
                      notifier: membershipState._selected3,
                      styles: StyleList.styleOptions,
                      text: '기타 스타일 입력',
                      controller: _controller3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 4. 선호하는 소재를 선택해 주세요.',
                      notifier: membershipState._selected4,
                      styles: StyleList.materialOptions,
                      text: '기타 소재 입력',
                      controller: _controller4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 5. 선호하지 않는 소재를 선택해 주세요.',
                      notifier: membershipState._selected5,
                      styles: StyleList.materialOptions,
                      text: '기타 소재 입력',
                      controller: _controller5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 6. 선호하는 핏을 선택해 주세요.',
                      notifier: membershipState._selected6,
                      styles: StyleList.fitOptions,
                      text: '기타 핏 입력',
                      controller: _controller6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 7. 선호하지 않는 핏을 선택해 주세요.',
                      notifier: membershipState._selected7,
                      styles: StyleList.fitOptions,
                      text: '기타 핏 입력',
                      controller: _controller7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 8. 강조하고 싶은 신체 부위가 있나요?',
                      notifier: membershipState._selected8,
                      styles: StyleList.bodyParts,
                      text: '기타 핏 입력',
                      controller: _controller8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 9. 보완하고 싶은 신체 부위가 있나요?',
                      notifier: membershipState._selected9,
                      styles: StyleList.bodyParts,
                      text: '기타 핏 입력',
                      controller: _controller9,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildAdditionalInfo('Step 10.추가로 작성하고 싶은 내용이 있나요?'),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextButton(
                        onPressed: () async {
                          try {
                            await createCommissions();
                            if (context.mounted) {
                              // context.goNamed(Routes.desiredStyle.name);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const DesiredStyleScreen()));
                            }
                          } catch (e) {
                            debugPrint("저장 실패1");
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.brown, // 색상 변경
                          minimumSize: const Size(120, 40), // 버튼 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          '저장',
                          style: AppTextStyle.button,
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }

  Widget buildAdditionalInfo(String text) {
    return Container(
      width: 332,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyle.littleTitle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: TextField(
            controller: _controller10.controller,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              filled: false,
              hintText: 'ex.종아리가 너무 두꺼운 게 고민이에요.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            style: AppTextStyle.hint.copyWith(color: Colors.black),
          )),
        ],
      ),
    );
  }

  Widget buildBodyTypeSection() {
    return Container(
      width: 332,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Step 1. 본인의 체형을 알려주세요.',
                style: AppTextStyle.littleTitle.copyWith(fontSize: 14.0),
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
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                label,
                style: AppTextStyle.hint.copyWith(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 12),
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
      width: 332,
      height: 212,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                title,
                style: AppTextStyle.littleTitle.copyWith(fontSize: 14.0),
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: buildStyleOptions(styles: styles, notifier: notifier)),
          SizedBox(
            width: 296,
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
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.brown : AppColor.lightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
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
