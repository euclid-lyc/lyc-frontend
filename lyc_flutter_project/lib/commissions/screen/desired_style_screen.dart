import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/screen/other_matters_screen.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../widget/Controller.dart';
import '../../styles/app_text_style.dart';
import '../provider/commissions_provider.dart';
import '../../data/style_list.dart' as styles;

class DesiredStyleScreen extends StatefulWidget {
  const DesiredStyleScreen({super.key});

  @override
  State<DesiredStyleScreen> createState() => DesiredStyleScreenState();
}

class DesiredStyleScreenState extends State<DesiredStyleScreen> {
  final Controller _controller1 = Controller();
  final Controller _controller2 = Controller();
  final Controller _controller3 = Controller();
  final Controller _controller4 = Controller();
  final Controller _controller5 = Controller();

  final membershipState = MembershipState();

  @override
  Widget build(BuildContext context) {
    Future<void> createCommissions() async {
    //  final commissionsProvider =
          Provider.of<CommissionsProvider>(context, listen: false);
      // commissionsProvider.desiredStyle =
      //     commissionsProvider.desiredStyle.copyWith(
      //   occasion: _controller1.controller.text,
      //   styleList: commissionsProvider.desiredStyle.styleList
      //       .copyWith(styleList: _controller2.controller.text.split(',')),
      //   fitList: commissionsProvider.desiredStyle.fitList.copyWith(
      //     fitList: _controller3.controller.text.split(','),
      //   ),
      //   materialList: commissionsProvider.desiredStyle.materialList.copyWith(
      //     materialList: _controller4.controller.text.split(','),
      //   ),
      //   colorList: commissionsProvider.desiredStyle.colorList
      //       .copyWith(colorList: _controller5.controller.text.split(',')),
      // );
    }

    return ChangeNotifierProvider(
      create: (_) => membershipState,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(
          title: "의뢰서 작성하기",
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(32, 20, 32, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildOccasionSection(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 2. 원하시는 스타일은 무엇인가요?',
                      notifier: membershipState._selected2,
                      styles: styles.StyleList.styleOptions,
                      text: '기타 스타일 입력',
                      controller: _controller2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 3. 원하시는 핏은 무엇인가요?',
                      notifier: membershipState._selected3,
                      styles: styles.StyleList.fitOptions,
                      text: '기타 핏 입력',
                      controller: _controller3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 4. 원하시는 소재가 있나요?',
                      notifier: membershipState._selected4,
                      styles: styles.StyleList.materialOptions,
                      text: '기타 소재 입력',
                      controller: _controller4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildStyleSection(
                      title: 'Step 5. 원하시는 색상이 있나요?',
                      notifier: membershipState._selected5,
                      styles: styles.StyleList.colorsOptions,
                      text: '기타 핏 입력',
                      controller: _controller5,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextButton(
                        onPressed: () async {
                          try {
                            await createCommissions();
                            // if (mounted) {
                            //   context.goNamed(Routes.otherMatters.name);
                            // }
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OtherMattersScreen()));
                          } catch (e) {
                            print("저장 실패2");
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
    );
  }

  Widget buildOccasionSection() {
    return Container(
        width: 332,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Step 1. 언제 입을 옷인가요?',
                style: AppTextStyle.littleTitle.copyWith(fontSize: 14.0),
                textAlign: TextAlign.left,
              ),
            ),
            buildInputField(_controller1),
          ],
        ));
  }

  Widget buildInputField(Controller controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '입력',
            style:
                AppTextStyle.hint.copyWith(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 32,
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
                keyboardType: TextInputType.text,
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
            width: 300,
            height: 32,
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
}
