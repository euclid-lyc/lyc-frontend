import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/round_image.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool todayChecked = false;

  void check() {
    setState(() {
      todayChecked = true;
    });
    showDialog(
      context: context,
      builder: (context) {
        return const CheckDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sky.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const NormalAppbar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 100),
            child: Column(
              children: [
                // profile
                const Expanded(flex: 8, child: Profile()),
                const Expanded(flex: 1, child: SizedBox()),
                // calender
                Expanded(
                    flex: 36,
                    child: Calendar(
                      todayChecked: todayChecked,
                    )),
                const Expanded(flex: 1, child: SizedBox()),
                // buttons
                Expanded(
                  flex: 4,
                  child: Button(
                    label: ">> 버튼 눌러 출석 체크하기 <<",
                    onPressed: check,
                    color: AppColor.deepGrey,
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                const Expanded(
                  flex: 4,
                  child: Button(
                    label: ">> 출석 보상 받기 <<",
                    onPressed: tmp,
                    color: Colors.grey,
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckDialog extends StatelessWidget {
  const CheckDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff303030),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        padding: const EdgeInsets.all(16.0),
        height: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "금일 출석 체크가\n완료되었습니다",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xffC4BAA2)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "닫기",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void tmp() {}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texts
          Column(
            children: [
              Text(
                'Karina',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
              Text(
                '@katarinabluu',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          SizedBox(width: 16.0),
          RoundImage(image: 'assets/ex_profile.png'),
        ],
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  final bool todayChecked;

  const Calendar({super.key, required this.todayChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2040, 1, 1),
        focusedDay: DateTime.now(),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayDecoration: BoxDecoration(
              color: todayChecked ? AppColor.beige : Colors.white,
              shape: BoxShape.circle,
              border: todayChecked
                  ? null
                  : Border.all(
                      color: AppColor.beige,
                      width: 1.0,
                    )),
          todayTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: todayChecked ? FontWeight.w500 : FontWeight.w300,
            color: todayChecked ? Colors.white : Colors.black,
          ),
          outsideTextStyle: const TextStyle(
            color: Colors.grey,
          ),
          rowDecoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        headerStyle: HeaderStyle(
          rightChevronVisible: false,
          leftChevronVisible: false,
          headerPadding: const EdgeInsets.all(16.0),
          titleTextStyle: const TextStyle(
            color: AppColor.beige,
            fontWeight: FontWeight.w700,
            fontSize: 26.0,
          ),
          formatButtonVisible: false,

          titleTextFormatter: (date, locale) {
            final month = date.month;
            final year = date.year;

            // 월 이름을 배열로 정의
            final monthNames = [
              'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
              'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
            ];

            // 월과 연도를 원하는 형식으로 변환
            return '${monthNames[month - 1]} $year';
          },
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // radius 20 설정
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
