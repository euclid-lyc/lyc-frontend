import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../data/style_list.dart';
import '../../../styles/app_text_style.dart';
import '../../../widget/Controller.dart';
import '../../../widget/normal_appbar.dart';
import 'join_membership_screen_5.dart';


class JoinMembershipScreen4 extends StatefulWidget {
  const JoinMembershipScreen4({super.key});

  @override
  State<JoinMembershipScreen4> createState() {
    return JoinMembershipScreenState4();
  }
}

class JoinMembershipScreenState4 extends State<JoinMembershipScreen4> {
  final Controller _Controller1_1 = Controller();
  final Controller _Controller1_2 = Controller();
  final Controller _Controller1_3 = Controller();
  final Controller _Controller1_4 = Controller();
  final Controller _Controller2 = Controller();
  final Controller _Controller3 = Controller();
  final Controller _Controller4 = Controller();
  final Controller _Controller5 = Controller();
  final Controller _Controller6 = Controller();
  final Controller _Controller7 = Controller();
  final Controller _Controller8 = Controller();
  final Controller _Controller9 = Controller();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MembershipState(),
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(
          title: "회원가입",
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 0, 31.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleInfoSection(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildBodyTypeSection(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-2. 평소 즐겨입는 스타일은 무엇인가요?',
                    notifier: context
                        .read<MembershipState>()
                        ._selected2,
                    styles: styleList.styleOptions,
                    text: '기타 스타일 입력',
                    controller: _Controller2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-3. 평소 즐겨입지 않는 스타일은 무엇인가요?',
                    notifier: context
                        .read<MembershipState>()
                        ._selected3,
                    styles:  styleList.styleOptions,
                    text: '기타 스타일 입력',
                    controller: _Controller3,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-4. 선호하는 소재를 선택해 주세요.',
                    notifier: context
                        .read<MembershipState>()
                        ._selected4,
                    styles:  styleList.materialOptions,
                    text: '기타 소재 입력',
                    controller: _Controller4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-5. 선호하지 않는 소재를 선택해 주세요.',
                    notifier: context
                        .read<MembershipState>()
                        ._selected5,
                    styles:  styleList.materialOptions,
                    text: '기타 소재 입력',
                    controller: _Controller5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-6. 선호하는 핏을 선택해 주세요.',
                    notifier: context
                        .read<MembershipState>()
                        ._selected6,
                    styles:  styleList.fitOptions,
                    text: '기타 핏 입력',
                    controller: _Controller6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-7. 선호하지 않는 핏을 선택해 주세요.',
                    notifier: context
                        .read<MembershipState>()
                        ._selected7,
                    styles:  styleList.fitOptions,
                    text: '기타 핏 입력',
                    controller: _Controller7,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildStyleSection(
                    title: '3-8. 보완하고 싶은 신체 부위가 있나요?',
                    notifier: context
                        .read<MembershipState>()
                        ._selected8,
                    styles:  styleList.BodyParts,
                    text: '기타 핏 입력',
                    controller: _Controller8,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildAdditionalInfo('3-9.추가로 작성하고 싶은 내용이 있나요?'),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (
                                  context) => const JoinMembershipScreen5()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.brown, // 색상 변경
                        minimumSize: Size(120, 40), // 버튼 크기 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        '저장',
                        style: app_text_style.button,
                        textAlign: TextAlign.center,
                      ),
                    ))
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
        padding: EdgeInsets.fromLTRB(19, 17.5, 19, 12.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: app_text_style.littleTitle,
            ),
            SizedBox(height: 10),
            Expanded(
                child: TextField(
                  controller: _Controller9.controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    filled: false,
                    hintText: 'ex.종아리가 너무 두꺼운 게 고민이에요.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: app_text_style.hint.copyWith(color: Colors.black),
                ))
          ],
        ));
  }

  Widget buildStyleInfoSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 4. 사용자 스타일 정보 입력',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '선호하는 스타일을 선택해주세요. 이 정보는 디렉팅에 활용됩니다. 추후 “설정” > “스타일 정보 변경”에서 수정 가능합니다.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '스타일 정보 나중에 입력하기 >>',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.underline),
            ),
          ),
          Text(
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
      padding: EdgeInsets.fromLTRB(19, 17.5, 19, 12.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.5),
              child: Text(
                '3-1. 본인의 체형을 알려주세요.',
                style: app_text_style.littleTitle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildInputField('키', _Controller1_1),
                buildInputField('몸무게', _Controller1_2),
                buildInputField('상의 사이즈', _Controller1_3),
                buildInputField('하의 사이즈', _Controller1_4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label, Controller controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                label,
                style: app_text_style.hint,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Container(
              height: 20,
              child: TextField(
                controller: controller.controller,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  fillColor: AppColor.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: app_text_style.hint.copyWith(color: Colors.black),
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
    return Container(
      width: 333,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.fromLTRB(15, 20, 14, 12.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 13.5),
              child: Text(
                title,
                style: app_text_style.littleTitle,
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: buildStyleOptions(styles: styles, notifier: notifier)),
          Container(
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
                EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              style: app_text_style.hint.copyWith(color: Colors.black),
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
        SizedBox(height: 6),
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
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.brown : AppColor.lightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Center(
                child: Text(
                  style,
                  style: isSelected
                      ? TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColor.lightGrey)
                      : TextStyle(
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


//   Widget buildBodyParts({
//     required String title,
//     required ValueNotifier<List<String>> notifier,
//   }) {
//     return Container(
//       width: 333,
//       height: 207,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: EdgeInsets.fromLTRB(15, 20, 14, 17.5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//               padding: EdgeInsets.only(bottom: 16),
//               child: Text(
//                 title,
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//               )),
//           Padding(padding: EdgeInsets.only(bottom: 20), child: MyButtonStack()),
//         ],
//       ),
//     );
//   }
// }

// class MyButtonStack extends StatelessWidget {
//   final List<ButtonPosition> buttonPositions = [
//     ButtonPosition(text: '어깨', x: -115, y: 0),
//     ButtonPosition(text: '가슴', x: 0, y: 42),
//     ButtonPosition(text: '전완', x: 0, y: 0),
//     ButtonPosition(text: '엉덩이', x: 37, y: 36.6),
//     ButtonPosition(text: '종아리', x: -137, y: 19.6),
//     ButtonPosition(text: '허벅지', x: -152, y: 69.6),
//     ButtonPosition(text: '복부', x: -152, y: 81),
//     ButtonPosition(text: '상완', x: -137, y: 13),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final membershipState = Provider.of<MembershipState>(context);
//
//     return Stack(
//       children: buttonPositions.map((position) {
//         return Positioned(
//           left: position.x +
//               MediaQuery.of(context).size.width / 2,
//           top: position.y +
//               MediaQuery.of(context).size.height / 2,
//           child: buildStyleButton(position.text, membershipState),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget buildStyleButton(String text, MembershipState membershipState) {
//     return ValueListenableBuilder<List<String>>(
//       valueListenable: membershipState.selectedStyles,
//       builder: (context, selectedStyles, child) {
//         final isSelected = selectedStyles.contains(text);
//         return GestureDetector(
//           onTap: () => membershipState.toggleInfo(text),
//           child: Container(
//             margin: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               color: isSelected ? AppColor.brown : AppColor.lightGrey,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//             child: Center(
//               child: Text(
//                 text,
//                 style: isSelected
//                     ? TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                         color: AppColor.lightGrey)
//                     : TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                         color: Colors.black),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ButtonPosition {
//   final String text;
//   final double x;
//   final double y;
//
//   ButtonPosition({required this.text, required this.x, required this.y});
// }
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

//void toggleInfo(String style, ValueNotifier<List<String>> notifier) {
// if (notifier.value.contains(style)) {
//   notifier.value = List.from(notifier.value)..remove(style);
// } else {
//   notifier.value = List.from(notifier.value)..add(style);
//  }
//  notifyListeners();
//}
}
