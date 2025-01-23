import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lyc_flutter_project/commissions/screen/submission_success_screen.dart';
import 'package:provider/provider.dart';
import '../../auth/join/Provider/login_provider.dart';
import '../../common/widget/custom_loading.dart';
import '../../common/widget/default_padding.dart';
import '../../common/widget/two_buttons.dart';
import '../../data/app_color.dart';
import '../../setting/widget/custom_text_form_field.dart';
import '../../styles/app_text_style.dart';
import '../../widget/Controller.dart';
import '../provider/commissions_provider.dart';

class OtherMattersScreen extends StatefulWidget {
  const OtherMattersScreen(
      {super.key,
      required this.isDirector,
      required this.commissionId,
      required this.isUpdate});

  final bool isDirector;
  final int? commissionId;
  final bool isUpdate;

  @override
  OtherMattersScreenState createState() => OtherMattersScreenState();
}

class OtherMattersScreenState extends State<OtherMattersScreen> {
  int? memberId;

  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();

    return showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(today.year + 5),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.beige,
              onPrimary: Colors.white, // 텍스트 색상
              onSurface: Colors.black, // 버튼 및 텍스트 색상
            ),
          ),
          child: child!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int? commissionId = widget.commissionId;
    final bool isDirector = widget.isDirector;
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          memberId = loginProvider.memberId;
          return DefaultPadding(
            bottom: 20.0,
            child: Consumer<CommissionsProvider>(
              builder: (context, value, child) {
                if (memberId == null) {
                  return const Center(
                    child: CustomLoading(),
                  );
                } else {
                  return ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "1. 원하시는 코디의 가격대는 얼마인가요?",
                                style: AppTextStyle.littleTitle
                                    .copyWith(fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            RangeSlider(
                              values: RangeValues(
                                value.model.otherMatters.minPrice.toDouble(),
                                value.model.otherMatters.maxPrice.toDouble(),
                              ),
                              min: 0,
                              max: 500000,
                              divisions: 50,
                              labels: RangeLabels(
                                '${value.model.otherMatters.minPrice}원',
                                '${value.model.otherMatters.maxPrice}원',
                              ),
                              activeColor: AppColor.brown,
                              inactiveColor: AppColor.grey,
                              onChanged: !isDirector
                                  ? (RangeValues values) {
                                      setState(() {
                                        value.updateMinPrice(
                                            minPrice: values.start.round());
                                        value.updateMaxPrice(
                                            maxPrice: values.end.round());
                                      });
                                    }
                                  : null,
                            ),
                            Text(
                              '선택한 가격대: ${value.model.otherMatters.minPrice}원 ~ ${value.model.otherMatters.maxPrice}원',
                              style: AppTextStyle.littleTitle
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildDateSection(
                            "2. 언제 입고 싶으신가요?",
                            value.model.otherMatters.dateToUse,
                            (formattedDate) async =>
                                value.updateDateToUse(dateToUse: formattedDate),
                            enabled: !isDirector,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: buildDateSection(
                          "3. 언제까지 수령하고 싶으신가요?",
                          value.model.otherMatters.desiredDate,
                          (formattedDate) async => value.updateDesiredDate(
                              desiredDate: formattedDate),
                          enabled: !isDirector,
                        ),
                      ),
                      ContentBox(
                        title: "4.자유롭게 입력해 주세요",
                        child: CustomTextFormField(
                          hint: "ex. 졸업식 때 입고 싶어요. 바지로 부탁드려요.",
                          maxLines: 5,
                          containerMargin: 0.0,
                          focusedBorderColor: Colors.transparent,
                          focusedBorderWidth: 0.0,
                          contentPaddingHorizontal: 8.0,
                          initialValue: value.model.otherMatters.text,
                          onChanged: (text) => value.updateText(text: text),
                          enabled: !isDirector,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SwitchSection(
                          initialValue: value.model.otherMatters.isShared,
                          onTap: (v) async => value.updateIsShared(isShared: v),
                          title: "5. 옷 리스트를 공유받을까요?",
                          enabled: !isDirector,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: widget.isDirector
                            ? TwoButtons(
                                fstOnPressed: () async {
                                  Navigator.pop(context);
                                  await value.acceptCommission(commissionId!);
                                },
                                scdOnPressed: () async {
                                  await value.declineCommission(commissionId!);
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                                fstLabel: "수락",
                                scdLabel: "거절",
                              )
                            : widget.isUpdate
                                ? TextButton(
                                    onPressed: () async {
                                      try {
                                        value.updateCommission(commissionId!);
                                      } catch (e) {
                                        debugPrint("저장 실패-3");
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColor.brown,
                                      minimumSize: const Size(80, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      '수정하기',
                                      style: AppTextStyle.button,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : TextButton(
                                    onPressed: () async {
                                      try {
                                        value.createCommission();
                                        if (context.mounted) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SubmissionSuccessScreen(),
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        debugPrint("저장 실패-3");
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColor.brown,
                                      minimumSize: const Size(120, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      '의뢰하기',
                                      style: AppTextStyle.button,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                      ),
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildTextSection(String title, Controller controller) {
    return Container(
      width: 333,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title,
              style: AppTextStyle.littleTitle.copyWith(fontSize: 14.0),
              textAlign: TextAlign.left,
            ),
          ),
          buildInputField(controller),
        ],
      ),
    );
  }

  Widget buildInputField(Controller controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '입력',
            style:
                AppTextStyle.hint.copyWith(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                controller: controller.controller,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  fillColor: AppColor.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: AppTextStyle.hint.copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateSection(
      String title, String date, Future<void> Function(String) onUpdateDate,
      {bool enabled = true}) {
    return Container(
      width: 332,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title,
              style: AppTextStyle.littleTitle.copyWith(fontSize: 16.0),
              textAlign: TextAlign.left,
            ),
          ),
          GestureDetector(
            onTap: enabled
                ? () async {
                    DateTime? selectedDate = await _selectDate(context);
                    if (selectedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                      await onUpdateDate(formattedDate);
                    }
                  }
                : null,
            child: AbsorbPointer(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: date.isEmpty ? '날짜를 선택하세요.' : date,
                  hintStyle: AppTextStyle.labelTextStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchSection extends StatelessWidget {
  final bool? initialValue;
  final Future<void> Function(bool)? onTap;
  final String title;
  final bool enabled;

  const SwitchSection({
    super.key,
    required this.initialValue,
    required this.onTap,
    required this.title,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.littleTitle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 12),
          SwitchButton(
            initialValue: initialValue,
            onTap: onTap,
            enabled: enabled,
          ),
        ],
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({
    super.key,
    required this.initialValue,
    required this.onTap,
    this.enabled = true,
  });

  final bool? initialValue;
  final Future<void> Function(bool)? onTap;
  final bool enabled;

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled
          ? () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onTap?.call(_isSelected);
      }
          : null,
      child: Container(
        width: 80, // 고정된 가로 길이
        height: 30,
        decoration: BoxDecoration(
          color: _isSelected ? AppColor.beige : AppColor.lightGrey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: _isSelected ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Visibility(
              visible: !_isSelected,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0), // 왼쪽 여백 추가
                child: Text(
                  '네',
                  style: TextStyle(
                    color: _isSelected ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: _isSelected,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0), // 왼쪽 여백 추가
                child: Text(
                  '아니오',
                  style: TextStyle(
                    color: !_isSelected ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ContentBox extends StatelessWidget {
  final String title;
  final Widget child;

  const ContentBox({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      //height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
