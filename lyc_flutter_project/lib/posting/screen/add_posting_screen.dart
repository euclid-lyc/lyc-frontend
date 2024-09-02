import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/posting/screen/add_posting_setting_screen.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/image_picker_widget.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/posting_content_text_field.dart';

/// 다목적 스크린
/// 코디 업로드(0), 리뷰 업로드(1)

class AddPostingScreen extends StatefulWidget {
  final int purpose;

  const AddPostingScreen({
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
        title: getTitle(),
      ),
      body: DefaultPadding(
        bottom: 20.0,
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  ImagePickerWidget(
                    onImageSelected: _onImageSelected,
                    picker: picker,
                  ),
                  const SizedBox(height: 30),
                  PostingContentTextField(
                    controller: writePostController,
                    hint: '텍스트를 입력해주세요.',
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            // 세부설정, 등록 버튼
            TwoButtons(
              fstLabel: "세부설정",
                fstOnPressed: () {
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
                      const SnackBar(
                        content: Text('사진을 첨부해주세요.'),
                      ),
                    );
                  }
                },
                scdLabel: "등록",
                scdOnPressed: () {}),
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
    } else {
      return "error";
    }
  }
}
