import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/widget/custom_loading.dart';
import 'package:lyc_flutter_project/common/widget/image_networking.dart';
import 'package:lyc_flutter_project/common/widget/round_image.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/model/member_model.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/widget/common_button.dart';
import 'package:lyc_flutter_project/setting/widget/info_text_form_field.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/image_picker_widget.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final ImagePicker picker = ImagePicker();
  bool picked = false;
  String? newProfile;

  late TextEditingController nicknameController;
  late TextEditingController loginIdController;
  late TextEditingController introductionController;

  @override
  void initState() {
    super.initState();
    context.read<SettingProvider>().getProfile();

    nicknameController = TextEditingController();
    loginIdController = TextEditingController();
    introductionController = TextEditingController();

    nicknameController.addListener(nicknameListener);
    loginIdController.addListener(loginIdListener);
    introductionController.addListener(introductionListener);
  }

  @override
  void dispose() {
    super.dispose();
    nicknameController.removeListener(nicknameListener);
    loginIdController.removeListener(loginIdListener);
    introductionController.removeListener(introductionListener);

    nicknameController.dispose();
    loginIdController.dispose();
    introductionController.dispose();
  }

  void nicknameListener() {
    context.read<SettingProvider>().updateNickname(nicknameController.text);
  }

  void loginIdListener() {
    context.read<SettingProvider>().updateLoginId(loginIdController.text);
  }

  void introductionListener() {
    context.read<SettingProvider>().updateIntroduction(introductionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, value, child) {
        MemberModel? member = value.member;
        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          appBar: const NormalAppbar(title: "회원정보 변경"),
          body: value.loadingMember
              ? const Center(
                  child: CustomLoading(),
                )
              : DefaultPadding(
                  bottom: 20,
                  child: Center(
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: picked
                                    ? RoundImage(
                                        image: Image.file(
                                          File(newProfile!),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : ProfileImageNetworking(
                                        member!.profileImage,
                                      ),
                              ),
                              ImagePickerWidget(
                                onImageSelected: (p0) {
                                  value.updateProfileImage(p0);
                                  newProfile = p0.path;
                                  picked = true;
                                },
                                picker: picker,
                                icon: SvgPicture.asset(
                                  "assets/icon_mod.svg",
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          InfoTextFormField(
                            initialValue: member!.nickname,
                          ),
                          InfoTextFormField(
                            initialValue: member!.loginId,
                          ),
                          const InfoTextFormField(
                            readOnly: true,
                            initialValue: "karina123@gmail.com",
                          ),
                          InfoTextFormField(
                            initialValue: member!.introduction,
                            maxLines: 5,
                          ),
                          const CommonButton(
                            label: "배송지 변경",
                            onPressed: tmp,
                          ),
                          const CommonButton(
                            label: "패스워드 변경",
                            onPressed: tmp,
                          ),
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
