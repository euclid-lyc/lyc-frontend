import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/posting/provider/clothes_provider.dart';
import 'package:lyc_flutter_project/styles/posting_text_style.dart';
import 'package:lyc_flutter_project/widget/image_picker_widget.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/posting_content_text_field.dart';
import 'package:lyc_flutter_project/widget/select_buttons_in_posting.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:provider/provider.dart';

class AddClothesPostingScreen extends StatefulWidget {
  final ClothesProvider clothesProvider;

  const AddClothesPostingScreen({
    super.key,
    required this.clothesProvider,
  });

  @override
  State<AddClothesPostingScreen> createState() =>
      _AddClothesPostingScreenState();
}

class _AddClothesPostingScreenState extends State<AddClothesPostingScreen> {
  int curSelected = 1;

  late XFile? _image;
  final ImagePicker picker = ImagePicker();

  late TextEditingController iTitleController;
  late TextEditingController iContentController;

  late TextEditingController tTitleController;
  late TextEditingController tTextController;

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
  void initState() {
    super.initState();
    iTitleController = TextEditingController();
    iContentController = TextEditingController();

    tTitleController = TextEditingController();
    tTextController = TextEditingController();

    iTitleController.addListener(_updateTitle);
    iContentController.addListener(_updateContent);

    tTitleController.addListener(_tUpdateTitle);
    tTextController.addListener(_tUpdateText);
  }

  @override
  void dispose() {
    super.dispose();

    iTitleController.removeListener(_updateTitle);
    iContentController.removeListener(_updateContent);

    tTitleController.removeListener(_tUpdateTitle);
    tTextController.removeListener(_tUpdateText);

    iTitleController.dispose();
    iContentController.dispose();

    tTitleController.dispose();
    tTitleController.dispose();
  }

  _updateTitle() {
    widget.clothesProvider.iUpdateTitle(iTitleController.text);
  }

  _updateContent() {
    widget.clothesProvider.iUpdateContent(iContentController.text);
  }

  _tUpdateTitle() {
    widget.clothesProvider.tUpdateTitle(tTitleController.text);
  }

  _tUpdateText() {
    widget.clothesProvider.tUpdateText(tTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.clothesProvider,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: const NormalAppbar(title: '옷 추가'),
        body: Consumer<ClothesProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SwitchCategoryButton(
                          text: '사진 업로드',
                          isSelected: curSelected == 1,
                          onPressed: () => setState(() {
                            curSelected = 1;
                          }),
                          color: AppColor.deepGrey,
                        ),
                        SwitchCategoryButton(
                          text: '텍스트 업로드',
                          isSelected: curSelected == 2,
                          onPressed: () => setState(() {
                            curSelected = 2;
                          }),
                          color: AppColor.deepGrey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(child: curSelected == 1 ? addPhoto() : addText()),
                  const SizedBox(height: 20.0),
                  TwoButtons(
                    fstOnPressed: () => Navigator.pop,
                    scdOnPressed: () {
                      curSelected == 1 ? value.uploadImage() : value.uploadText();
                    },
                    scdLabel: "추가",
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  ListView addPhoto() {
    return ListView(
      children: [
        ImagePickerWidget(
          onImageSelected: _onImageSelected,
          picker: picker,
        ),
        const SizedBox(height: 20.0),
        PostingContentTextField(
          controller: iTitleController,
          hint: "옷의 이름을 입력해주세요.",
          maxLines: 1,
        ),
        const SizedBox(height: 20.0),
        PostingContentTextField(
          controller: iContentController,
          hint: '텍스트를 입력해주세요.',
        ),
      ],
    );
  }

  ListView addText() {
    return ListView(
      children: [
        const Text(
          'Step 1. 옷의 이름은 무엇인가요?',
          style: PostingTextStyle.stepTitle,
        ),
        const SizedBox(height: 14.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: PostingContentTextField(
            maxLines: 1,
            controller: tTitleController,
            hint: 'ex. 파란색 크롭 반팔 티셔츠',
          ),
        ),
        const SizedBox(height: 24.0),
        const Text(
          'Step 2. 소재감은 어떤가요?',
          style: PostingTextStyle.stepTitle,
        ),
        const SizedBox(height: 14.0),
        Row(
          children: [
            for (var i = 0; i < 4; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  textures,
                  selectedTextures,
                  i,
                  () => _onTextureButtonPressed(textures[i]),
                  AppColor.deepGrey,
                  Colors.white,
                ),
              ),
          ],
        ),
        Row(
          children: [
            for (var i = 4; i < 8; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  textures,
                  selectedTextures,
                  i,
                  () => _onTextureButtonPressed(textures[i]),
                  AppColor.deepGrey,
                  Colors.white,
                ),
              ),
          ],
        ),
        const SizedBox(height: 24.0),
        const Text(
          'Step 3. 핏은 어떤가요? ',
          style: PostingTextStyle.stepTitle,
        ),
        const SizedBox(height: 14.0),
        Row(
          children: [
            for (var i = 0; i < 4; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  fits,
                  selectedFits,
                  i,
                  () => _onFitButtonPressed(fits[i]),
                  AppColor.deepGrey,
                  Colors.white,
                ),
              ),
          ],
        ),
        Row(
          children: [
            for (var i = 4; i < 8; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  fits,
                  selectedFits,
                  i,
                  () => _onFitButtonPressed(fits[i]),
                  AppColor.deepGrey,
                  Colors.white,
                ),
              ),
          ],
        ),
        const SizedBox(height: 24.0),
        const Text(
          'Step 4. 더 자세한 사항을 입력해주세요.',
          style: PostingTextStyle.stepTitle,
        ),
        const SizedBox(height: 14.0),
        PostingContentTextField(
          controller: tTextController,
          hint: "ex: 거의 무릎까지 오는 기장입니다.\n봄, 여름에 입기 좋은 두께감입니다.",
        ),
      ],
    );
  }

  void _onImageSelected(XFile image) {
    setState(() {
      _image = image;
    });
    widget.clothesProvider.iUpdateImage(image);
  }

  void _onTextureButtonPressed(String element) {
    setState(() {
      if (selectedTextures.contains(element)) {
        selectedTextures.remove(element);
      } else {
        if (selectedTextures.isNotEmpty) {
          selectedTextures.clear();
        }
        selectedTextures.add(element);
        widget.clothesProvider.tUpdateMaterial(element);
      }
    });
  }

  void _onFitButtonPressed(String element) {
    setState(() {
      if (selectedFits.contains(element)) {
        selectedFits.remove(element);
      } else {
        if (selectedFits.isNotEmpty) {
          selectedFits.clear();
        }
        selectedFits.add(element);
        widget.clothesProvider.tUpdateFit(element);
      }
    });
  }
}
