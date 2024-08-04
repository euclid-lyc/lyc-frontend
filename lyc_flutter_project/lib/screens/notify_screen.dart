import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/app_text_style.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';

class NotifyScreen extends StatefulWidget {
  final VoidCallback onNotify;

  NotifyScreen({Key? key, required this.onNotify}) : super(key: key);

  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  // 체크박스 상태를 저장할 리스트
  final List<bool> _checkboxValues = List.generate(6, (index) => false);

  // 체크박스 상태를 업데이트하는 메소드
  void _updateCheckbox(int index, bool? value) {
    setState(() {
      _checkboxValues[index] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(
        backButton: false,
        title: "신고하기",
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 74.5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 60),
                            child: Text(
                              '해당 사용자를 신고하시겠습니까?',
                              style: app_text_style.littleTitle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 0, 334.5),
                            child: Text(
                              '이용에 불편을 드려 죄송합니다. 안전하고 쾌적한 서비스 제공을 위해 다음 양식에 신고 사유를 표시해주세요.',
                              style: app_text_style.labelTextStyle.copyWith(
                                color: AppColor.deepGrey, // 색상 변경
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              '불편사항을 신고해 주셔서 대단히 감사합니다.\n유클리드는 사용자 여러분의 안전과 편의를 위해 늘 최선을 다하겠습니다.\n** 허위 신고 시 불이익이 발생할 수 있습니다 **',
                              style: app_text_style.labelTextStyle.copyWith(
                                color: AppColor.deepGrey, // 색상 변경
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColor.grey, // 버튼 배경색
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                '취소',
                                style: app_text_style.button.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: TextButton(
                              onPressed: () {
                                widget.onNotify(); // notify 콜백 호출
                                Navigator.pop(context); // 화면 닫기
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF383838), // 배경색 설정
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                '신고하기',
                                style: app_text_style.button.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: 120 + 35, // 상단 여백 추가
              child: SizedBox(
                width: 324,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < _checkboxValues.length - 1; i++)
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: _checkboxValues[i],
                              onChanged: (bool? value) {
                                _updateCheckbox(i, value);
                              },
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _checkboxLabels[i],
                                style: app_text_style.labelTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: _checkboxValues.last,
                            onChanged: (bool? value) {
                              _updateCheckbox(_checkboxValues.length - 1, value);
                            },
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: 31, // 높이 고정
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.lightGrey),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 0, bottom: 9.3),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '기타 신고 사유를 입력해주세요',
                                    border: InputBorder.none, // 기본 테두리 제거
                                  ),
                                  style: app_text_style.hint,
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
            ),
          ],
        ),
      ),
    );
  }

  // 체크박스 레이블
  final List<String> _checkboxLabels = [
    '욕설 / 비방',
    '선정적인 콘텐츠',
    '사생활 침해 및 개인정보 유출',
    '스팸 또는 부적절한 광고',
    '저작권 및 지적재산권 침해',
    '기타',
  ];
}
