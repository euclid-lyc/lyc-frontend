import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lyc_flutter_project/commissions/screen/submission_success_screen.dart';
import 'package:provider/provider.dart';
import '../../common/widget/normal_appbar.dart';
import '../../data/app_color.dart';
import '../../styles/app_text_style.dart';
import '../../widget/Controller.dart';
import '../provider/commissions_provider.dart';

class OtherMattersScreen extends StatefulWidget {
  const OtherMattersScreen({super.key});

  @override
  OtherMattersScreenState createState() => OtherMattersScreenState();
}

class OtherMattersScreenState extends State<OtherMattersScreen> {
  final Controller _minPriceController = Controller();
  final Controller _maxPriceController = Controller();
  final Controller _additionalInfoController = Controller();
  DateTime? _desiredDate;
  DateTime? _receiveDate;
  bool shareClothesList = false;

  Future<void> _selectDate(BuildContext context, String type) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.brown,
            hintColor: AppColor.brown,
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            scaffoldBackgroundColor: Colors.white,
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: AppColor.brown,
              secondary: AppColor.brown,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.brown
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _desiredDate) {
      setState(() {
        if (type == 'desired') {
          _desiredDate = picked;
        } else if (type == 'receive') {
          _receiveDate = picked;
        }
      });
    }
  }

  Future<void> createCommissions() async {
   // final commissionsProvider = Provider.of<CommissionsProvider>(context, listen: false);

    // commissionsProvider.otherMatters = commissionsProvider.otherMatters.copyWith(
    //   minPrice: int.parse(_minPriceController.controller.text),
    //   maxPrice: int.parse(_maxPriceController.controller.text),
    //   dateToUse: _desiredDate == null ? '' : DateFormat('yyyy-MM-dd').format(_desiredDate!),
    //   desiredDate: _receiveDate == null ? '' : DateFormat('yyyy-MM-dd').format(_receiveDate!),
    //   text: _additionalInfoController.controller.text,
    //   isShared: shareClothesList,
    // );
    // commissionsProvider.submitCommission(directerId: "string",context: context);
    // //임시
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "의뢰서 작성하기"),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(32, 20, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Step 1: 가격대 선택
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
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
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Step 1. 원하시는 코디의 가격대는 얼마인가요?",
                            style: AppTextStyle.littleTitle.copyWith(fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        RangeSlider(
                          values: RangeValues(
                            double.parse(_minPriceController.controller.text.isNotEmpty
                                ? _minPriceController.controller.text
                                : '0'),
                            double.parse(_maxPriceController.controller.text.isNotEmpty
                                ? _maxPriceController.controller.text
                                : '0'),
                          ),
                          min: 0,
                          max: 500000,
                          divisions: 50,
                          labels: RangeLabels(
                            '${_minPriceController.controller.text}원',
                            '${_maxPriceController.controller.text}원',
                          ),
                          activeColor: AppColor.brown,
                          inactiveColor:AppColor.grey,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _minPriceController.controller.text = values.start.round().toString();
                              _maxPriceController.controller.text = values.end.round().toString();
                            });
                          },
                        ),
                        Text(
                          '선택한 가격대: ${_minPriceController.controller.text}원 ~ ${_maxPriceController.controller.text}원',
                          style: AppTextStyle.littleTitle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                // Step 2: 입고 날짜 선택
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildDateSection(
                    "Step 2. 언제 입고 싶으신가요?",
                    _desiredDate,
                    'desired',
                  ),
                ),
                // Step 3: 수령 날짜 선택
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildDateSection(
                    "Step 3. 언제까지 수령하고 싶으신가요?",
                    _receiveDate,
                    'receive',
                  ),
                ),
                // Step 4: 자유 입력
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildTextSection("Step 4. 자유롭게 입력해 주세요", _additionalInfoController),
                ),
                // Step 5: 옷 리스트 공유 여부
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildSwitchSection("Step 5. 옷 리스트를 공유받을까요?", shareClothesList),
                ),
                // 저장 버튼
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        await createCommissions();
                        if (context.mounted) {
                              // context.goNamed(Routes.submissionSuccess.name);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SubmissionSuccessScreen()));
                        }
                      } catch (e) {
                        print("저장 실패3");
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
                      '저장',
                      style: AppTextStyle.button,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
            style: AppTextStyle.hint.copyWith(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                controller: controller.controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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

  Widget buildDateSection(String title, DateTime? date, String type) {
    TextEditingController controller = TextEditingController(
      text: date == null ? '' : DateFormat('yyyy-MM-dd').format(date),
    );

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
              style: AppTextStyle.littleTitle.copyWith(fontSize: 14.0),
              textAlign: TextAlign.left,
            ),
          ),
          GestureDetector(
            onTap: () => _selectDate(context, type),
            child: AbsorbPointer(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: date == null ? '날짜를 선택하세요.' : null,
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

  Widget buildSwitchSection(String title, bool switchValue) {
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
              style: AppTextStyle.littleTitle.copyWith(fontSize: 14.0),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        shareClothesList = true;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: switchValue ? AppColor.beige : AppColor.grey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          '네',
                          style: TextStyle(
                            color: switchValue ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        shareClothesList = false;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: !switchValue ? AppColor.beige : AppColor.grey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          '아니오',
                          style: TextStyle(
                            color: !switchValue ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
