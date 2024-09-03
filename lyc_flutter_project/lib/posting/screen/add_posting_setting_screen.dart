import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/two_buttons.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/posting/provider/coordi_provider.dart';
import 'package:lyc_flutter_project/posting/widget/link_box.dart';
import 'package:lyc_flutter_project/posting/widget/mini_link_box.dart';
import 'package:lyc_flutter_project/posting/widget/temp_box.dart';
import 'package:lyc_flutter_project/posting/widget/weather_icon.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';
import 'package:lyc_flutter_project/styles/posting_text_style.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/select_buttons_in_posting.dart';
import 'package:provider/provider.dart';

class AddPostingSettingScreen extends StatefulWidget {
  final int purpose;
  final CoordiProvider coordiProvider;

  const AddPostingSettingScreen({
    super.key,
    required this.purpose,
    required this.coordiProvider,
  });

  @override
  State<AddPostingSettingScreen> createState() =>
      _AddPostingSettingScreenState();
}

class _AddPostingSettingScreenState extends State<AddPostingSettingScreen> {
  final GlobalKey _imageKey = GlobalKey();

  final List<String> styles = [
    '클래식',
    '캐주얼',
    '힙',
    '그런지',
    '프레피',
    '빈티지',
    '모던시크',
    '스트릿'
  ];
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    final coordiProvider = Provider.of<CoordiProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: NormalAppbar(
        backButton: false,
        title: widget.purpose == 0 ? '코디 업로드' : '리뷰 업로드',
      ),
      body: DefaultPadding(
        bottom: 20.0,
        child: ListView(
          children: [
            // Step1
            const Text('Step 1. 이 옷을 입은 날의 날씨를 알려주세요.',
                style: PostingTextStyle.stepTitle),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const WeatherIcon(),
                const SizedBox(width: 10),
                TempBox(
                  label: "최저기온",
                  onChanged: coordiProvider.updateMinTemp,
                ),
                const SizedBox(width: 10),
                TempBox(
                  label: "최고기온",
                  onChanged: coordiProvider.updateMaxTemp,
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Step2
            const Text(
              'Step 2. 코디가 지향하는 스타일을 선택해주세요.',
              style: PostingTextStyle.stepTitle,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                for (var i = 0; i < 4; i++)
                  Expanded(
                    child: SelectButtonsInPosting(
                      styles,
                      selected,
                      i,
                          () => _onStyleButtonPressed(styles[i]),
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
                      styles,
                      selected,
                      i,
                          () => _onStyleButtonPressed(styles[i]),
                      AppColor.deepGrey,
                      Colors.white,
                    ),
                  ),
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
                final RenderBox renderBox =
                _imageKey.currentContext?.findRenderObject() as RenderBox;
                final localOffset =
                renderBox.globalToLocal(details.globalPosition);
                _addPoint(localOffset); // Pass Offset directly
              },
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: (3 / 4),
                    child: ClipRRect(
                      key: _imageKey,
                      borderRadius: BorderRadius.circular(20),
                      child: coordiProvider.image != null
                          ? Image.file(
                        File(widget.coordiProvider.image),
                        fit: BoxFit.cover,
                      )
                          : const SizedBox(),
                    ),
                  ),
                  ...widget.coordiProvider.points.map(
                        (e) {
                      Offset offset = e["offset"];
                      final RenderBox renderBox = _imageKey.currentContext
                          ?.findRenderObject() as RenderBox;
                      final size = renderBox.size;

                      double left = offset.dx * size.width;
                      double top = offset.dy * size.height;

                      const double containerWidth = 60;
                      const double containerHeight = 30;

                      if (left + containerWidth > size.width) {
                        left = size.width - containerWidth;
                      }
                      if (top + containerHeight > size.height) {
                        top = size.height - containerHeight - 20;
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
                        child: MiniLinkBox(
                          index: (widget.coordiProvider.points.indexOf(e) + 1)
                              .toString(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ...widget.coordiProvider.points.map(
                  (e) {
                return LinkBox(
                  index:
                  (widget.coordiProvider.points.indexOf(e) + 1).toString(),
                  link: e["link"],
                );
              },
            ),
            const SizedBox(height: 20),
            TwoButtons(
              fstOnPressed: () {
                widget.coordiProvider.resetSetting();
                Navigator.pop(context);
              },
              scdOnPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addPoint(Offset localOffset) {
    final RenderBox renderBox =
    _imageKey.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;

    double relativeDx = localOffset.dx / size.width;
    double relativeDy = localOffset.dy / size.height;

    TextEditingController _linkController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('링크를 입력해주세요'),
            content: TextField(controller: _linkController),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.coordiProvider.points.add({
                      "offset": Offset(relativeDx, relativeDy),
                      "link": _linkController.text
                    });
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('추가하기'),
              ),
            ],
          ),
    );
  }

  void _onStyleButtonPressed(String element) {
    setState(() {
      if (selected.contains(element)) {
        selected.remove(element);
      } else {
        if (selected.isNotEmpty) {
          selected.clear();
        }
        selected.add(element);
        widget.coordiProvider.updateStyle(element);
      }
    });
  }
}