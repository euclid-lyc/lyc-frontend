import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/posting/provider/clothes_provider.dart';
import 'package:lyc_flutter_project/posting/repository/clothes_repository.dart';
import 'package:lyc_flutter_project/styles/posting_text_style.dart';
import 'package:lyc_flutter_project/widget/image_picker_widget.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/posting_content_text_field.dart';
import 'package:lyc_flutter_project/widget/select_buttons_in_posting.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:provider/provider.dart';

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

  late TextEditingController titleController;
  late TextEditingController contentController;
  late TextEditingController clothesNameController;
  late TextEditingController textureController;
  late TextEditingController fitController;

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
    titleController = TextEditingController();
    contentController = TextEditingController();
    clothesNameController = TextEditingController();
    textureController = TextEditingController();
    fitController = TextEditingController();

    titleController.addListener(_updateTitle);
    contentController.addListener(_updateContent);
  }

  @override
  void dispose() {
    super.dispose();

    titleController.removeListener(_updateTitle);
    contentController.removeListener(_updateContent);

    titleController.dispose();
    contentController.dispose();
  }

  _updateTitle() {
    Provider.of<ClothesProvider>(context, listen: false).updateTitle(titleController.text);
  }
  _updateContent() {
    Provider.of<ClothesProvider>(context, listen: false).updateContent(contentController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: '옷 추가'),
      body: MultiProvider(
        providers: [
          Provider<ClothesRepositoryProvider>(
            create: (context) => ClothesRepositoryProvider(
              dio: Provider.of<DioProvider>(context, listen: false).dio,
            ),
          ),
          ChangeNotifierProxyProvider<ClothesRepositoryProvider, ClothesProvider>(
            create: (context) => ClothesProvider(
              repositoryProvider: Provider.of<ClothesRepositoryProvider>(context, listen: false),
            ),
            update: (context, repositoryProvider, previousClothesProvider) =>
                ClothesProvider(repositoryProvider: repositoryProvider),
          ),
        ],
        builder: (context, child) {
          return Consumer<ClothesProvider>(
            builder: (BuildContext context, ClothesProvider value, Widget? child) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SwitchCategoryButton(
                            text: '사진 업로드',
                            isSelected: photoSelected,
                            onPressed: _onPressed,
                            color: AppColor.deepGrey,
                          ),
                          SwitchCategoryButton(
                            text: '텍스트 업로드',
                            isSelected: !photoSelected,
                            onPressed: _onPressed,
                            color: AppColor.deepGrey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(child: photoSelected ? addPhoto() : addText()),
                    const SizedBox(height: 16.0),
                    TwoButtons(
                      fstOnPressed: () => Navigator.pop,
                      scdOnPressed: () {
                        value.uploadImage();
                      },
                      scdLabel: "추가",
                    )
                  ],
                ),
              );
            },
          );
        },
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
        const SizedBox(height: 16.0),
        PostingContentTextField(
          controller: titleController,
          hint: "옷의 이름을 입력해주세요.",
          maxLines: 1,
        ),
        const SizedBox(height: 16.0),
        PostingContentTextField(
          controller: contentController,
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
        const SizedBox(height: 12.0),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: PostingContentTextField(
                controller: clothesNameController, hint: 'ex. 파란색 크롭 반팔 티셔츠')),
        const SizedBox(height: 40),
        const Text(
          'Step 2. 소재감은 어떤가요?',
          style: PostingTextStyle.stepTitle,
        ),
        const SizedBox(height: 12.0),
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
              ),
          ],
        ),
        const SizedBox(height: 12.0),
        const Text(
          '기타 재질 입력',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12.0),
        TextField(
          controller: textureController,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.grey,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 40),
        const Text(
          'Step 3. 핏은 어떤가요? ',
          style: PostingTextStyle.stepTitle,
        ),
        const SizedBox(height: 12.0),
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
              ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          '기타 핏 입력',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12.0),
        TextField(
          controller: fitController,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.grey,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
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
    Provider.of<ClothesProvider>(context, listen: false).updateImage(image);
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
