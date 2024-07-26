import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/screens/add_posting_setting_screen.dart';
import 'package:lyc_flutter_project/widget/image_picker_widget.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/posting_content_text_field.dart';

/// 다목적 스크린
/// 코디 업로드(0), 리뷰 업로드(1)
/// 옷 추가는 분리하겠습니다

class AddPostingScreen extends StatefulWidget {
  final int purpose;

  AddPostingScreen({
    super.key,
    required this.purpose,
  });

  @override
  State<AddPostingScreen> createState() => _AddPostingScreenState();
}

class _AddPostingScreenState extends State<AddPostingScreen> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();
  TextEditingController writePostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(
        backButton: true,
        title: getTitle(),
        deleteButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 25, 30, 20),
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: ListView(
                children: [
                  ImagePickerWidget(onImageSelected: _onImageSelected, picker: picker),
                  SizedBox(height: 30),
                  PostingContentTextField(controller: writePostController, hint: '텍스트를 입력해주세요.',),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            // 세부설정, 등록 버튼
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        onPressed: () {
                          if (_image != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddPostingSettingScreen(
                                  image: _image!,
                                  purpose: widget.purpose,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('사진을 첨부해주세요.'),
                              ),
                            );
                          }
                        },
                        child: Text(
                          '세부설정',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.beige,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // save my posting
                        },
                        child: Text(
                          '등록',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onImageSelected(XFile image) {
    setState(() {
      _image = image;
    });
  }

  String getTitle() {
    if (widget.purpose == 0) {
      return "코디 업로드";
    } else if (widget.purpose == 1) {
      return "리뷰 업로드";
    } else if (widget.purpose == 2) {
      return "옷 추가";
    } else {
      return "error";
    }
  }
}
