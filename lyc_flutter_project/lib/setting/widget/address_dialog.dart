import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/widget/custom_text_form_field.dart';

class AddressDialog extends StatelessWidget {
  const AddressDialog({super.key});

  //MediaQuery.of(context).size.height / 2,
  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "배송지 변경",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            Text(
              "배송지 정보는 다른 사용자에게 노출되지 않습니다.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    fillColor: AppColor.lightGrey,
                    hint: "우편번호",
                    readOnly: true,
                    borderRadius: 10.0,
                  ),
                ),
                SizedBox(width: 8),
                CustomTextButton(
                  label: "우편번호\n찾기",
                  borderRadius: 10.0,
                ),
              ],
            ),
            CustomTextFormField(
              fillColor: AppColor.lightGrey,
              hint: "주소",
              readOnly: true,
              borderRadius: 10.0,
            ),
            CustomTextFormField(
              fillColor: AppColor.lightGrey,
              hint: "상세주소",
              borderRadius: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: CustomTextButton(
                label: "저장",
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void tmp() {}
