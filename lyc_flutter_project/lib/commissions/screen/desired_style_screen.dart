import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../auth/join/Provider/login_provider.dart';
import '../../common/widget/custom_loading.dart';
import '../../common/widget/default_padding.dart';
import '../../mypage/widget/select_buttons_in_posting.dart';

import '../provider/commissions_provider.dart';
import '../../data/style_list.dart' as styles;

class DesiredStyleScreen extends StatefulWidget {
  const DesiredStyleScreen({super.key, required this.isDirector});

  final bool isDirector;

  @override
  State<DesiredStyleScreen> createState() => DesiredStyleScreenState();
}

class DesiredStyleScreenState extends State<DesiredStyleScreen> {
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
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 20),
                      //   child: buildOccasionSection(),
                      // ),
                      ContentBox(
                        title: "2. 원하시는 스타일은 무엇인가요?",
                        child: ButtonList(
                            name: styles.StyleList.styleOptions,
                            selected: value.model.style.styleList.styleList,
                            onSelected: (v) =>
                                value.updateStyleList(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "3. 원하시는 핏은 무엇인가요?",
                        child: ButtonList(
                            name: styles.StyleList.fitOptions,
                            selected: value.model.style.fitList.fitList,
                            onSelected: (v) => value.updateFitList(selected: v),
                            enabled: !isDirector),
                      ),

                      ContentBox(
                        title: "4. 원하시는 소재는 무엇인가요?",
                        child: ButtonList(
                            name: styles.StyleList.materialOptions,
                            selected:
                                value.model.style.materialList.materialList,
                            onSelected: (v) =>
                                value.updateMaterialList(selected: v),
                            enabled: !isDirector),
                      ),
                      ContentBox(
                        title: "4. 원하시는 색상은 무엇인가요?",
                        child: ButtonList(
                            name: styles.StyleList.colorsOptions,
                            selected: value.model.style.colorList.colorList,
                            onSelected: (v) =>
                                value.updateColorList(selected: v),
                            enabled: !isDirector),
                      ),
                    ],
                  );
                }
              }),
            );
          },
        ));
  }

// Widget buildOccasionSection() {
//   return Container(
//       width: 332,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: Text(
//               'Step 1. 언제 입을 옷인가요?',
//               style: AppTextStyle.littleTitle.copyWith(fontSize: 14),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           buildInputField(_controller1),
//         ],
//       ));
// }

// Widget buildInputField(Controller controller) {
//   return Container(
//     margin: const EdgeInsets.only(bottom: 8),
//     child: Row(
//       children: [
//         Text(
//           '입력',
//           style:
//               AppTextStyle.hint.copyWith(color: Colors.black, fontSize: 14),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: SizedBox(
//             height: 32,
//             child: TextField(
//               controller: controller.controller,
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//                 fillColor: AppColor.grey,
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//               style: AppTextStyle.hint.copyWith(color: Colors.black),
//               keyboardType: TextInputType.text,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
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
        bottom: 20,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      //height: 200,
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
                  enabled: enabled,
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
                  enabled: enabled,
                ),
              ),
          ],
        )
      ],
    );
  }
}
