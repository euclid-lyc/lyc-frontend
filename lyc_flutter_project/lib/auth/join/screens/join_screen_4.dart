import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyc_flutter_project/common/widget/custom_input_field.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/auth/join/Provider/join_provider.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../widget/Controller.dart';
import 'join_screen_3.dart';
import 'join_screen_5.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class JoinScreen4 extends StatefulWidget {
  const JoinScreen4({super.key});

  @override
  State<JoinScreen4> createState() => _JoinScreen4State();
}

class _JoinScreen4State extends State<JoinScreen4> {
  XFile? _image;
  String _imagePath = '';
  final ImagePicker picker = ImagePicker();

  Future<void> getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "회원가입"),
      body: Consumer<JoinProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CustomLoading());
        }
        return Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(32, 28, 32, 28),
                margin: const EdgeInsets.fromLTRB(32, 32, 32, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 56),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Step 4. 회원정보 입력',
                        style: AppTextStyle.littleTitle,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 56),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(64),
                      ),
                      width: 124,
                      height: 124,
                      child: ElevatedButton(
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                        ),
                        child: _image == null
                            ? SvgPicture.asset(
                                'assets/icon_camera.svg',
                                width: 32,
                                height: 32,
                              )
                            : ClipOval(
                                child: Image.file(
                                  File(_image!.path),
                                  width: 124,
                                  height: 124,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    CustomInputField(
                        hint: "닉네임",
                        onChanged: (p0) => value.updateNickname(p0)),
                    CustomInputField(
                        minLines: 3,
                        hint: '자유롭게 자신을 소개해 주세요',
                        onChanged: (p0) => value.updateIntroduction(p0)),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomNextButton(
                        onPressed: () async {
                          value.imagePath = _imagePath;
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JoinScreen5()),
                            );
                          }
                        },
                        text: '다음',
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ),
        );
      }),
    );
  }
}
