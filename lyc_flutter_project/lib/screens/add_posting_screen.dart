import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/screens/add_posting_setting_screen.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

/// 다목적 스크린
/// 코디 업로드(0), 리뷰 업로드(1), (옷 추가(2))
/// 옷 추가는 다루는 데이터가 달라서 그냥 분리하는게 좋을 거 같아욤

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
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 25, 30, 20),
        child: Column(
          children: [
            // 옷 추가일때만 스위치 위젯 추가
            // 사진 첨부->image picker
            Expanded(
              flex: 16,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          '사진 불러오기',
                          style: TextStyle(
                              color: AppColor.brown,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        //content: Text('This is a Flutter alert dialog.'),
                        content: Row(
                          children: [
                            TextButton(
                              child: Text(
                                '카메라',
                                style: PickerDialogTextStyle(),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                getImage(ImageSource.camera);
                              },
                            ),
                            Spacer(),
                            TextButton(
                              child: Text(
                                '갤러리',
                                style: PickerDialogTextStyle(),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                getImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: (_image != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            File(_image!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.camera_alt_outlined,
                          color: AppColor.grey,
                          size: 100,
                        ),
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            // 텍스트 필드
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  maxLines: 5,
                  controller: writePostController,
                  decoration: InputDecoration(
                    hintText: '텍스트를 입력해주세요.',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
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
            )
          ],
        ),
      ),
    );
  }

  TextStyle PickerDialogTextStyle() {
    return TextStyle(
      color: AppColor.brown,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
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

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }
}
