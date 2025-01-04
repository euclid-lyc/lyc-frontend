import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lyc_flutter_project/common/const/typographies.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class ChatAddScheduleBottomSheet extends StatelessWidget {
  final ChatProvider provider;

  const ChatAddScheduleBottomSheet({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final toast = FToast();
    toast.init(context);

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28.0).copyWith(
          top: 24.0,
          bottom: 28.0,
        ),
        child: SingleChildScrollView(
          child: ChangeNotifierProvider.value(
            value: provider,
            child: Consumer<ChatProvider>(
              builder: (context, value, child) => Column(
                children: [
                  const Text(
                    "일정 추가하기",
                    style: Typos.regular18,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: AppColor.grey),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text("일시", style: Typos.regular16),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ChatDateTimePicker(
                                  label: '년',
                                  minValue: 2024,
                                  maxValue: 3000,
                                  curValue: value.queryDateTime.year,
                                  onChanged: (p0) => value.yearSelected(p0),
                                  allDay: value.allDay,
                                ),
                                ChatDateTimePicker(
                                  label: '월',
                                  minValue: 1,
                                  maxValue: 12,
                                  curValue: value.queryDateTime.month,
                                  onChanged: (p0) => value.monthSelected(p0),
                                  allDay: value.allDay,
                                ),
                                ChatDateTimePicker(
                                  label: '월',
                                  minValue: 1,
                                  maxValue: [2, 4, 6, 9, 11].contains(value.queryDateTime.month) ? 30 : 31,
                                  curValue: value.queryDateTime.day,
                                  onChanged: (p0) => value.daySelected(p0),
                                  allDay: value.allDay,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ChatDateTimePicker(
                                  label: '시',
                                  minValue: 0,
                                  maxValue: 23,
                                  curValue: value.queryDateTime.hour,
                                  onChanged: (p0) => value.hourSelected(p0),
                                  allDay: value.allDay,
                                ),
                                ChatDateTimePicker(
                                  label: '분',
                                  minValue: 0,
                                  maxValue: 59,
                                  curValue: value.queryDateTime.minute,
                                  onChanged: (p0) => value.minuteSelected(p0),
                                  allDay: value.allDay,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: value.allDay,
                                      onChanged: (p0) => value.toggleAllDay(p0),
                                      activeColor: AppColor.brown,
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    const Text(
                                      '하루종일',
                                      style: Typos.regular14,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text(
                          "메모",
                          style: Typos.regular16,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          cursorColor: AppColor.brown,
                          style: Typos.regular14,
                          onTapOutside: (event) => FocusScope.of(context).unfocus,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.lightGrey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (text) => value.memoChanged(text),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    margin: const EdgeInsets.all(20.0),
                    child: CustomTextButton(
                      label: "추가",
                      onPressed: () async {
                        await value.makeSchedule();
                        toast.showToast(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                )
                              ]
                            ),
                            child: const Text("일정이 생성되었습니다"),
                          ),
                        );
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatDateTimePicker extends StatelessWidget {
  final String label;
  final int minValue;
  final int maxValue;
  final int curValue;
  final Function(int) onChanged;
  final bool allDay;

  const ChatDateTimePicker({
    super.key,
    required this.label,
    required this.minValue,
    required this.maxValue,
    required this.curValue,
    required this.onChanged,
    required this.allDay,
  });

  @override
  Widget build(BuildContext context) {
    bool smallFont = allDay && (label == '시' || label == '분');
    return Row(
      children: [
        AbsorbPointer(
          absorbing: allDay,
          child: NumberPicker(
            itemWidth: 60,
            itemHeight: 28,
            selectedTextStyle: smallFont ? Typos.regular12 : Typos.semibold16,
            textStyle: Typos.regular12.copyWith(
              color: Colors.black.withOpacity(0.7),
            ),
            minValue: minValue,
            maxValue: maxValue,
            value: curValue,
            onChanged: onChanged,
          ),
        ),
        Text(label, style: Typos.regular14)
      ],
    );
  }
}
