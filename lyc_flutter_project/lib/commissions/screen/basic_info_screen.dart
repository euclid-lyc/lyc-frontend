import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/commissions/model/commission_model.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../widget/Controller.dart';
import '../../data/style_list.dart' as styles;
import '../../styles/app_text_style.dart';
import '../provider/commissions_provider.dart';
import 'desired_style_screen.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key, required this.directorId});

  final int directorId;

  @override
  State<BasicInfoScreen> createState() => BasicInfoScreenState();
}

class BasicInfoScreenState extends State<BasicInfoScreen> {
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
  final Controller _psCodeController = Controller();
  final Controller _adController = Controller();
  final Controller _detailController = Controller();

  final membershipState = MembershipState();

  @override
  Widget build(BuildContext context) {
    Future<void> createCommissions() async {
      final commissionsProvider =
      Provider.of<CommissionsProvider>(context, listen: false);
      commissionsProvider.model = commissionsProvider.model.copyWith(
          directorId: widget.directorId,
          basicInfo: BasicInfo(
              height: int.tryParse(_controller1_1.controller.text) ?? 0,
              weight: int.tryParse(_controller1_2.controller.text) ?? 0,
              topSize: _controller1_3.controller.text,
              bottomSize: _controller1_4.controller.text,
              postalCode: int.tryParse(_psCodeController.controller.text) ?? 0,
              address: _adController.controller.text,
              detailAddress: _adController.controller.text,
              text: _controller10.controller.text,
              infoStyle: InfoStyle(
                  preferredStyleList: _controller2.controller.text.split(','),
                  nonPreferredStyleList: _controller3.controller.text.split(
                      ',')),
              infoFit: InfoFit(
                  preferredFitList: _controller6.controller.text.split(','),
                  nonPreferredFitList: _controller7.controller.text.split(','))
              ,
              infoMaterial: InfoMaterial(
                  preferredMaterialList: _controller4.controller.text.split(
                      ','),
                  nonPreferredMaterialList:
                  _controller5.controller.text.split(','))
              ,
              infoBodyType: InfoBodyType(
                  goodBodyTypeList: _controller8.controller.text.split(','),
                  badBodyTypeList: _controller9.controller.text.split(','))
          ));
    }

    return ChangeNotifierProvider(
      create: (_) => membershipState,
      child: Builder(
        builder: (context) =>
            Scaffold(
              backgroundColor: AppColor.lightGrey,
              appBar: const NormalAppbar(
                title: "의뢰서 작성하기",
              ),
              body: SingleChildScrollView(
                child: Center(
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
                            styles: styles.StyleList.styleOptions,
                            text: '기타 스타일 입력',
                            controller: _controller2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildStyleSection(
                            title: 'Step 3. 평소 즐겨입지 않는 스타일은 무엇인가요?',
                            notifier: membershipState._selected3,
                            styles: styles.StyleList.styleOptions,
                            text: '기타 스타일 입력',
                            controller: _controller3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildStyleSection(
                            title: 'Step 4. 선호하는 소재를 선택해 주세요.',
                            notifier: membershipState._selected4,
                            styles: styles.StyleList.materialOptions,
                            text: '기타 소재 입력',
                            controller: _controller4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildStyleSection(
                            title: 'Step 5. 선호하지 않는 소재를 선택해 주세요.',
                            notifier: membershipState._selected5,
                            styles: styles.StyleList.materialOptions,
                            text: '기타 소재 입력',
                            controller: _controller5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildStyleSection(
                            title: 'Step 6. 선호하는 핏을 선택해 주세요.',
                            notifier: membershipState._selected6,
                            styles: styles.StyleList.fitOptions,
                            text: '기타 핏 입력',
                            controller: _controller6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildStyleSection(
                            title: 'Step 7. 선호하지 않는 핏을 선택해 주세요.',
                            notifier: membershipState._selected7,
                            styles: styles.StyleList.fitOptions,
                            text: '기타 핏 입력',
                            controller: _controller7,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildStyleSection(
                            title: 'Step 8. 강조하고 싶은 신체 부위가 있나요?',
                            notifier: membershipState._selected8,
                            styles: styles.StyleList.bodyParts,
                            text: '기타 핏 입력',
                            controller: _controller8,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildStyleSection(
                            title: 'Step 9. 보완하고 싶은 신체 부위가 있나요?',
                            notifier: membershipState._selected9,
                            styles: styles.StyleList.bodyParts,
                            text: '기타 핏 입력',
                            controller: _controller9,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildAdditionalInfo(
                              'Step 10.추가로 작성하고 싶은 내용이 있나요?'),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 20),
                          child: shippingAddressForm(adController: _adController,psCodeController: _psCodeController,detailAdController: _detailController),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () async {
                                try {
                                  await createCommissions();
                                  if (context.mounted) {
                                    // context.goNamed(Routes.desiredStyle.name);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (
                                            context) => const DesiredStyleScreen()));
                                  }
                                } catch (e) {
                                  debugPrint("저장 실패-1");
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


  Widget shippingAddressForm({
      required Controller psCodeController,
      required Controller adController,
      required Controller detailAdController}) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Text(
            'Step 11. 배송지 입력',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 24),
          child: Text(
            '배송지 정보는 다른 사용자에게 노출되지 않습니다.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        shippingTextField(
          controller: psCodeController,
          hintText: '우편번호',
          onChanged: (value) {
            // 우편번호 입력 시 처리할 로직
          },
        ),
        const SizedBox(height: 8),
        shippingButton(),
        const SizedBox(height: 8),
        shippingTextField(controller: adController, hintText: '주소'),
        const SizedBox(height: 8),
        shippingTextField(controller: detailAdController, hintText: '상세주소'),
      ],
    );
  }

  Widget shippingTextField({
    required Controller controller,
    required String hintText,
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: controller.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyle.hint,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 12),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget shippingButton() {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: () {
          // 우편번호 찾기 버튼 클릭 시 동작
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColor.brown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        ),
        child: const Center(
          child: Text(
            '우편번호 찾기',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
