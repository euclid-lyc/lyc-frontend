import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/posting/provider/coordi_provider.dart';
import 'package:lyc_flutter_project/posting/screen/add_posting_setting_screen.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/widget/image_picker_widget.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/posting_content_text_field.dart';
import 'package:provider/provider.dart';

/// 다목적 스크린
/// 코디 업로드(0), 리뷰 업로드(1)

class AddPostingScreen extends StatefulWidget {
  final int purpose;
  final CoordiProvider coordiProvider;

  const AddPostingScreen({
    super.key,
    required this.purpose,
    required this.coordiProvider,
  });

  @override
  State<AddPostingScreen> createState() => _AddPostingScreenState();
}

class _AddPostingScreenState extends State<AddPostingScreen> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();

    contentController = TextEditingController();
    contentController.addListener(_listener);
  }

  @override
  void dispose() {
    super.dispose();

    contentController.removeListener(_listener);
    contentController.dispose();
  }

  void _listener() {
    widget.coordiProvider.updateContent(contentController.text);
  }

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
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  ImagePickerWidget(
                    onImageSelected: (p0) {
                      setState(() {
                        _image = p0;
                      });
                      widget.coordiProvider.updateImage(p0.path.toString());
                    },
                    picker: picker,
                  ),
                  const SizedBox(height: 30),
                  PostingContentTextField(
                    controller: contentController,
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
                if (_image != null && widget.coordiProvider.image != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: widget.coordiProvider,
                        child: AddPostingSettingScreen(
                          purpose: widget.purpose,
                          coordiProvider: widget.coordiProvider,
                        ),
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
              scdOnPressed: () {
                widget.coordiProvider.upload();
              },
            ),
          ],
        ),
      ),
    );
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
