import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/widget/point_custom_container.dart';
import 'package:lyc_flutter_project/widget/point_input_field.dart';
import 'package:lyc_flutter_project/widget/point_pay.dart';
import 'package:lyc_flutter_project/widget/point_sub_title.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';

class PointChargeScreen extends StatefulWidget {
  const PointChargeScreen({super.key});

  @override
  State<PointChargeScreen> createState() => _PointChargeScreenState();
}

class _PointChargeScreenState extends State<PointChargeScreen> {
  int point = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: const NormalAppbar(),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            children: [
              PointCustomContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PointSubTitle(label: "포인트를 충전하시겠습니까?"),
                    const SizedBox(height: 20.0),
                    PointInputField(
                      onChanged: (value) {
                        setState(() {
                          point = value as int;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26.0),
              PointCustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PointSubTitle(label: "충전 수단"),
                    PointPay(
                        label: "카카오페이",
                        icon: "assets/icon_kakao.png",
                        onTap: () {
                         // goBootpayRequest(context, 'kakao', point);
                        }),
                    PointPay(
                      label: "네이버페이",
                      icon: "assets/icon_naver.png",
                      onTap: () {
                        //goBootpayRequest(context, 'naver', point);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goBootpayRequest(BuildContext context, String pg, int point) {
    Item item = Item();
    item.itemName = "포인트";
    item.qty = 1;
    item.unique = "ITEM_CODE_POINT";
    item.price = point.toDouble();

    Payload payload = Payload();
    payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';
    payload.pg = pg;
    payload.method = 'card';
    payload.name = '포인트 결제';
    payload.price = point.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    User user = User();
    user.id = 'user_id_1234';

    Bootpay bootpay = Bootpay();
    bootpay.request(
      context: context,
      payload: payload,
      onDone: (String json) {
        print('결제 완료: $json');
      },
      onCancel: (String json) {
        print('결제 취소: $json');
      },
      onError: (String json) {
        print('결제 오류: $json');
      },
    );
  }
}
