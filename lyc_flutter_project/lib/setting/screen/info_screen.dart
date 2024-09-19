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
import 'package:lyc_flutter_project/setting/widget/address_dialog.dart';
import 'package:lyc_flutter_project/setting/widget/common_button.dart';
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';
import 'package:lyc_flutter_project/setting/widget/password_change_dialog.dart';
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
  final TextEditingController nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SettingProvider>().getProfile();
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
                  bottom: 40,
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
                          CustomTextFormField(
                            initialValue: member!.nickname,
                            onChanged: (text) => value.updateNickname(text),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 2) {
                                return ("닉네임을 2자 이상 입력해주세요");
                              }
                              if (value.length > 10) {
                                return ("10자 이내로 입력해주세요");
                              } else {
                                return null;
                              }
                            },
                          ),
                          CustomTextFormField(
                            initialValue: member!.loginId,
                            onChanged: (text) => value.updateLoginId(text),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 6) {
                                return ("아이디를 6자 이상 입력해주세요");
                              }
                              if (value.length > 30) {
                                return ("30자 이내로 입력해주세요");
                              } else {
                                return null;
                              }
                            },
                          ),
                          CustomTextFormField(
                            initialValue: member!.introduction,
                            maxLines: 5,
                            onChanged: (text) => value.updateIntroduction(text),
                          ),
                          CommonButton(
                            label: "배송지 변경",
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => const AddressDialog(),
                            ),
                          ),
                          CommonButton(
                            label: "패스워드 변경",
                            onPressed: () async {
                              final changePw = await showDialog<bool>(
                                context: context,
                                builder: (context) =>
                                    const PasswordChangeDialog(),
                              );
                              if (changePw == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("비밀번호가 변경되었습니다"),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          TwoButtons(
                            fstOnPressed: () {
                              refresh();
                              Navigator.pop(context);
                            },
                            scdOnPressed: () {
                              save();
                              refresh();
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

  Future<void> refresh() async {
    await context.read<SettingProvider>().getProfile(refresh: true);
  }

  Future<void> save() async {
    await context.read<SettingProvider>().saveMemberInfo();
  }
}
