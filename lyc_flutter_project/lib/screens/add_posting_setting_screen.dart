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
  List<Map<String, dynamic>> _points = [];
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
        deleteButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            // Step1
            const Text('Step 1. 이 옷을 입은 날의 날씨를 알려주세요.',
                style: PostingTextStyle.stepTitle),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                WeatherIcon(),
                const SizedBox(width: 10),
                TempInputField('최저기온'),
                const SizedBox(width: 10),
                TempInputField('최고기온'),
              ],
            ),
            const SizedBox(height: 40),
            // Step2
            const Text(
              'Step 2. 코디가 지향하는 스타일을 선택해주세요.',
              style: PostingTextStyle.stepTitle,
            ),
            const SizedBox(height: 15),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                for (var i = 0; i < 8; i++)
                  SelectButtonsInPosting(styleButtons, selectedStyle, i,
                      () => onStyleButtonPressed(styleButtons[i]))
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Step 3. 착용 정보를 자유롭게 입력해주세요.',
              style: PostingTextStyle.stepTitle,
            ),
            const Text(
              '사진의 특정 위치를 클릭하여 링크를 추가할 수 있습니다.',
              style: TextStyle(
                color: Color(0xff575757),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTapDown: (details) {
                _addPoint(details.localPosition);
              },
              child: Stack(children: [
                AspectRatio(
                  aspectRatio: (3/4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(widget.image.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ..._points.map(
                      (e) {
                    Offset offset = e["offset"];
                    double left = offset.dx;
                    double top = offset.dy;

                    // Define the size of the container
                    const double containerWidth = 60; // Adjust the size as needed
                    const double containerHeight = 30; // Adjust the size as needed

                    // Adjust position to ensure the container stays within bounds
                    if (left + containerWidth >= MediaQuery.of(context).size.width - 30) {
                      left = left - containerWidth;
                    }
                    if (top + containerHeight >= MediaQuery.of(context).size.height - 30) {
                      top = top - containerHeight;
                    }
                    if (left < 0) {
                      left = 0;
                    }
                    if (top < 0) {
                      top = 0;
                    }

                    return Positioned(
                      left: left,
                      top: top,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff252525),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '링크${_points.indexOf(e) + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ]),
            ),
            const SizedBox(height: 20),
            ..._points.map(
              (e) {
                return Container(
                  padding: EdgeInsets.only(right: 10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.deepGrey,
                              ),
                              child: Text(
                                '링크${_points.indexOf(e) + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(child: Text(e['link'], overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: SvgPicture.asset(
                            'assets/icon_eraser.svg',
                            color: AppColor.deepGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
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
                      child: const Text(
                        '취소',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
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
                      child: const Text(
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
        child: const Icon(
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
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            label == '최저기온' ? Text('$minTempValue°C') : Text('$maxTempValue°C')
          ],
        ),
      ),
    );
  }

  void _addPoint(Offset offset) {
    TextEditingController _linkController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter Link"),
        content: TextField(controller: _linkController),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _points.add({"offset": offset, "link": _linkController.text});
              });
              Navigator.of(context).pop();
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
