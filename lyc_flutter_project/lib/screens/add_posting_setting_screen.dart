import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/posting_text_style.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/select_buttons_in_posting.dart';

class AddPostingSettingScreen extends StatefulWidget {
  final XFile image;
  final int purpose;

  const AddPostingSettingScreen({
    super.key,
    required this.image,
    required this.purpose,
  });

  @override
  State<AddPostingSettingScreen> createState() =>
      _AddPostingSettingScreenState();
}

class _AddPostingSettingScreenState extends State<AddPostingSettingScreen> {
  List<String> selectedStyle = [];
  int minTempValue = 3;
  int maxTempValue = 10;

  final List<String> styleButtons = [
    '클래식',
    '캐주얼',
    '힙',
    '그런지',
    '프레피',
    '빈티지',
    '모던시크',
    '스트릿'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(
        backButton: false,
        title: widget.purpose == 0 ? '코디 업로드' : '리뷰 업로드',
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            // Step1
            Text('Step 1. 이 옷을 입은 날의 날씨를 알려주세요.',
                style: PostingTextStyle.stepTitle),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherIcon(),
                SizedBox(width: 10),
                TempInputField('최저기온'),
                SizedBox(width: 10),
                TempInputField('최고기온'),
              ],
            ),
            SizedBox(height: 40),
            // Step2
            Text(
              'Step 2. 코디가 지향하는 스타일을 선택해주세요.',
              style: PostingTextStyle.stepTitle,
            ),
            SizedBox(height: 15),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                for (var i = 0; i < 8; i++)
                  SelectButtonsInPosting(
                    styleButtons,
                    selectedStyle,
                    i,
                    () => onStyleButtonPressed(styleButtons[i]),
                    AppColor.deepGrey,
                    Colors.white,
                  )
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Step 3. 착용 정보를 자유롭게 입력해주세요.',
              style: PostingTextStyle.stepTitle,
            ),
            Text(
              '사진의 특정 위치를 클릭하여 링크를 추가할 수 있습니다.',
              style: TextStyle(
                color: Color(0xff575757),
              ),
            ),
            SizedBox(height: 15),
            AspectRatio(
              aspectRatio: 0.8,
              child: ClipRRect(
                child: Image.file(
                  File(widget.image.path),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Text('어케 하는 거임..?ㅠㅠ....'),
            Container(
              // 아래가 문제가 되는 패딩, 마진 효과가 동시에 생김
              padding: EdgeInsets.only(right: 10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.deepGrey,
                        ),
                        child: Text(
                          '링크1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('http://sample1.com'),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                    child: SvgPicture.asset(
                      'assets/eraser.svg',
                      color: AppColor.deepGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        '취소',
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        '저장',
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

  void onStyleButtonPressed(String element) {
    setState(() {
      selectedStyle.contains(element)
          ? selectedStyle.remove(element)
          : selectedStyle.add(element);
    });
  }

  Widget WeatherIcon() {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Icon(
          Icons.wb_sunny_sharp,
          color: Colors.yellow,
          size: 50,
        ),
      ),
    );
  }

  Widget TempInputField(String label) {
    return Expanded(
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            label == '최저기온' ? Text('$minTempValue°C') : Text('$maxTempValue°C')
          ],
        ),
      ),
    );
  }
}
