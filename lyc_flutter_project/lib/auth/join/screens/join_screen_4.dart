import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyc_flutter_project/auth/join/Provider/join_provider.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
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
  final Controller _nickController = Controller();
  final Controller _introController = Controller();

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
    final joinProvider = Provider.of<JoinProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(
        title: "회원가입",
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              // 최대 너비 설정
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.fromLTRB(22, 28.5, 22, 0),
              height: 440,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 7, 43.5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Step 4. 회원정보 입력',
                      style: app_text_style.littleTitle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 49),
                    decoration: BoxDecoration(
                      color: Color(0xFFBBBBBB),
                      borderRadius: BorderRadius.circular(62),
                    ),
                    width: 124,
                    height: 124,
                    child: ElevatedButton(
                      onPressed: () {
                        getImage(ImageSource.gallery);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        backgroundColor: Color(0xFFBBBBBB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62),
                        ),
                      ),
                      child: _image == null
                          ? SvgPicture.asset(
                              'assets/icon_camera.svg',
                              width: 33.3,
                              height: 31.7,
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
                  SizedBox(height: 1),
                  // '닉네임' TextField
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 252,
                    height: 37, // 너비를 252로 설정
                    child: TextField(
                      controller: _nickController.controller,
                      decoration: InputDecoration(
                        hintText: '닉네임',
                        hintStyle: app_text_style.hint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 252,
                    child: TextField(
                      controller: _introController.controller,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: '자유롭게 자신을 소개해 주세요',
                        hintStyle: app_text_style.hint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // '이전' 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JoinScreen3()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.grey,
                          minimumSize: Size(120, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '이전',
                          style: app_text_style.hint.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: () async {
                          //이미지 업로드 안 할 경우 api를 null로 보낼 순 없어서 우선 쓰레기값
                          if ( _imagePath == '') {
                            // final directory = await getApplicationDocumentsDirectory();
                            // _imagePath = '${directory.path}/images/abc.png';
                            _imagePath = '/sdcard/0621.png';
                          }
                          joinProvider.imagePath = _imagePath;
                          joinProvider.member = joinProvider.member.copyWith(
                            nickname: _nickController.controller.text,
                            introduction: _introController.controller.text,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JoinScreen5()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.beige,
                          minimumSize: Size(120, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          '다음',
                          style: app_text_style.button,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
