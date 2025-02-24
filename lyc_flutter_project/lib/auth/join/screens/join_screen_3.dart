import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/auth/join/Provider/join_provider.dart';
import 'package:lyc_flutter_project/common/widget/search_postcode_page.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_input_field.dart';
import '../../../common/widget/custom_loading.dart';
import '../../../common/widget/custom_next_button.dart';
import '../../../styles/app_text_style.dart';
import 'join_screen_4.dart';

class JoinScreen3 extends StatefulWidget {
  const JoinScreen3({super.key});

  @override
  JoinScreenState3 createState() {
    return JoinScreenState3();
  }
}

class JoinScreenState3 extends State<JoinScreen3> {
  late TextEditingController _postalCodeController;
  late TextEditingController _addressController;
  late TextEditingController _detailAddressController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _postalCodeController = TextEditingController();
    _addressController = TextEditingController();
    _detailAddressController = TextEditingController();
  }

  @override
  void dispose() {
    _postalCodeController.dispose();
    _addressController.dispose();
    _detailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(title: "회원가입"),
      body: Consumer<JoinProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CustomLoading());
          }
          return Center(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(32, 28, 32, 28),
                  margin: const EdgeInsets.fromLTRB(32, 32, 32, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Step 3. 배송지 입력',
                          style: AppTextStyle.littleTitle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 28),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          '배송지 정보는 다른 사용자에게 노출되지 않습니다.',
                          style: AppTextStyle.hint,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              hint: '우편번호',
                              inputType: TextInputType.number,
                              controller: _postalCodeController,
                              onChanged: (p0) =>
                                  value.updatePostalCode(p0 as int),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: SizedBox(
                              height: 40, // 버튼의 높이 설정
                              child: TextButton(
                                onPressed: () async {
                                  setState(() {
                                    value.isLoading = true;
                                  });
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchPostcodePage()),
                                  );
                                  setState(() {
                                    value.isLoading = false;
                                  });
                                  if (result != null) {
                                    String address = result.address ?? ''; // 주소
                                    String postalCode = result.zonecode ?? 0;
                                    _addressController.text = address;
                                    _postalCodeController.text = postalCode;
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColor.brown,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                ),
                                child: Center(
                                  child: Text(
                                    '우편번호 찾기',
                                    style: AppTextStyle.hint
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 주소 입력 필드
                      CustomInputField(
                        hint: '주소',
                        controller: _addressController,
                        onChanged: (p0) => value.updateAddress(p0),
                      ),
                      CustomInputField(
                        hint: '상세주소',
                        controller: _detailAddressController,
                        onChanged: (p0) => value.updateDetailAddress(p0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: CustomNextButton(
                          onPressed: () async {
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const JoinScreen4()),
                              );
                            }
                          },
                          text: '다음',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
