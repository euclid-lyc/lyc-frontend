import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../auth/join/Provider/login_provider.dart';
import '../../common/widget/custom_loading.dart';
import '../../common/widget/default_padding.dart';
import '../../setting/widget/custom_text_form_field.dart';
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
                          ContentBox(
                            title: "1. 어떤 날에 입고 싶으신가요?",
                            child: CustomTextFormField(
                              hint: "ex. 졸업식이요.",
                              containerMargin: 0.0,
                              focusedBorderColor: Colors.transparent,
                              focusedBorderWidth: 0.0,
                              contentPaddingHorizontal: 8.0,
                              onChanged: (text) => value.updateOccasion(text),
                              enabled: !isDirector,
                            ),
                          ),
                          ContentBox(
                              title: "2. 원하시는 스타일은 무엇인가요?",
                              child: ButtonList(
                                name: styles.StyleList.styleOptions,
                                selected: value.model.style.styleList.styleList,
                                onSelected: (v) =>
                                    value.updateStyleList(selected: v),
                               enabled: !isDirector),),
                          ContentBox(
                            title: "3. 원하시는 핏은 무엇인가요?",
                            child: ButtonList(
                                name: styles.StyleList.fitOptions,
                                selected: value.model.style.fitList.fitList,
                                onSelected: (v) =>
                                    value.updateFitList(selected: v),
                                enabled: !isDirector), //
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
}
