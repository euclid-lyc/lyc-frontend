import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/widget/common_button.dart';
import 'package:lyc_flutter_project/setting/widget/info_text_form_field.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          appBar: const NormalAppbar(title: "회원정보 변경"),
          body: DefaultPadding(
            bottom: 20,
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: RoundImage(
                            image: Image.asset(
                              "assets/ex_profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icon_mod.svg",
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const InfoTextFormField(
                      readOnly: true,
                      initialValue: "Karina",
                    ),
                    const InfoTextFormField(
                      initialValue: "katarinabluu",
                    ),
                    const InfoTextFormField(
                      initialValue: "karina123@gmail.com",
                    ),
                    const InfoTextFormField(
                      hint: "상태메시지",
                      maxLines: 5,
                    ),
                    const CommonButton(label: "배송지 변경", onPressed: tmp),
                    const CommonButton(label: "패스워드 변경", onPressed: tmp),
                    const SizedBox(height: 20.0),
                    TwoButtons(
                      fstOnPressed: () {
                        Navigator.pop(context);
                      },
                      scdOnPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void tmp() {}
