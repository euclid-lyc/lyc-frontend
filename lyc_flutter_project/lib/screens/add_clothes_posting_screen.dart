import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/posting_text_style.dart';
import 'package:lyc_flutter_project/widget/image_picker_widget.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/posting_content_text_field.dart';
import 'package:lyc_flutter_project/widget/select_buttons_in_posting.dart';
import 'package:lyc_flutter_project/widget/switch_category_button.dart';

class AddClothesPostingScreen extends StatefulWidget {
  const AddClothesPostingScreen({super.key});

  @override
  State<AddClothesPostingScreen> createState() =>
      _AddClothesPostingScreenState();
}

class _AddClothesPostingScreenState extends State<AddClothesPostingScreen> {
  bool photoSelected = true;
  late XFile? _image;
  final ImagePicker picker = ImagePicker();

  TextEditingController writePostController = TextEditingController();
  TextEditingController clothesNameController = TextEditingController();
  TextEditingController textureController = TextEditingController();
  TextEditingController fitController = TextEditingController();

  List<String> textures = [
    '면',
    '니트',
    '린넨',
    '시폰',
    '코듀로이',
    '가죽',
    '데님',
    '나일론',
  ];
  List<String> selectedTextures = [];

  List<String> fits = [
    '오버핏',
    '노멀핏',
    '슬림핏',
    '루즈핏',
    '와이드',
    '부츠컷',
    '스트레이트',
    '스키니',
  ];
  List<String> selectedFits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar:
          NormalAppbar(title: '옷 추가',),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 25, 30, 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SwitchCategoryButton(
                      '사진 업로드',
                      photoSelected,
                      _onPressed,
                      AppColor.deepGrey,
                    ),
                    SwitchCategoryButton(
                      '텍스트 업로드',
                      !photoSelected,
                      _onPressed,
                      AppColor.deepGrey,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              flex: 25,
              child: photoSelected ? addPhoto() : addText(),
            ),
            Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '취소',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.beige,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // save my clothes
                      },
                      child: Text(
                        '추가',
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
            )
          ],
        ),
      ),
    );
  }

  ListView addPhoto() {
    return ListView(
      children: [
        ImagePickerWidget(onImageSelected: _onImageSelected, picker: picker),
        SizedBox(height: 40),
        PostingContentTextField(
          controller: writePostController,
          hint: '텍스트를 입력해주세요.',
        ),
      ],
    );
  }

  ListView addText() {
    return ListView(
      children: [
        Text('Step 1. 옷의 이름은 무엇인가요?', style: PostingTextStyle.stepTitle),
        SizedBox(height: 15),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: PostingContentTextField(
                controller: clothesNameController, hint: 'ex. 파란색 크롭 반팔 티셔츠')),
        SizedBox(height: 40),
        Text('Step 2. 소재감은 어떤가요?', style: PostingTextStyle.stepTitle),
        SizedBox(height: 15),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: [
            for (var i = 0; i < 8; i++)
              SelectButtonsInPosting(
                textures,
                selectedTextures,
                i,
                () => _onTextureButtonPressed(textures[i]),
                AppColor.deepGrey,
                Colors.white,
              )
          ],
        ),
        SizedBox(height: 20),
        Text(
          '기타 재질 입력',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        TextField(
          controller: textureController,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.grey,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
        ),
        SizedBox(height: 40),
        Text('Step 3. 핏은 어떤가요? ', style: PostingTextStyle.stepTitle),
        SizedBox(height: 15),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: [
            for (var i = 0; i < 8; i++)
              SelectButtonsInPosting(
                fits,
                selectedFits,
                i,
                () => _onFitButtonPressed(fits[i]),
                AppColor.deepGrey,
                Colors.white,
              )
          ],
        ),
        SizedBox(height: 20),
        Text(
          '기타 핏 입력',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        TextField(
          controller: fitController,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.grey,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
        ),
      ],
    );
  }

  void _onPressed() {
    setState(() {
      photoSelected = !photoSelected;
    });
  }

  void _onImageSelected(XFile image) {
    setState(() {
      _image = image;
    });
  }

  void _onTextureButtonPressed(String element) {
    setState(() {
      selectedTextures.contains(element)
          ? selectedTextures.remove(element)
          : selectedTextures.add(element);
    });
  }

  void _onFitButtonPressed(String element) {
    setState(() {
      selectedFits.contains(element)
          ? selectedFits.remove(element)
          : selectedFits.add(element);
    });
  }
}
