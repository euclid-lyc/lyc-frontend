import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/widget/point_input_field.dart';
import 'package:lyc_flutter_project/mypage/widget/point_pay.dart';
import 'package:lyc_flutter_project/widget/normal_appbar.dart';
import 'package:lyc_flutter_project/mypage/widget/point_custom_container.dart';
import 'package:lyc_flutter_project/mypage/widget/point_sub_title.dart';

class PointChargeScreen extends StatefulWidget {
  const PointChargeScreen({super.key});

  @override
  State<PointChargeScreen> createState() => _PointChargeScreenState();
}

class _PointChargeScreenState extends State<PointChargeScreen> {
  int point = 0;

  final String webApplicationId = "66b0e5d186fd08d2213fbf98";
  final String iosApplicationId = "66b0e5d186fd08d2213fbf9a";
  final String androidApplicationId = "66b0e5d186fd08d2213fbf99";

  Payload payload = Payload();

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
                          point = int.tryParse(value.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
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
                          bootpayRequestDataInit('kakao');
                          goBootpayTest(context);
                        }),
                    PointPay(
                      label: "네이버페이",
                      icon: "assets/icon_naver.png",
                      onTap: () {
                        bootpayRequestDataInit('npay');
                        goBootpayTest(context);
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

  void bootpayRequestDataInit(String pg) {
    Item item = Item();
    item.itemName = "포인트";
    item.qty = 1;
    item.unique = "ITEM_CODE_POINT";
    item.price = point.toDouble();

    List<Item> itemList = [item];

    payload.webApplicationId = webApplicationId;
    payload.androidApplicationId = androidApplicationId;
    payload.iosApplicationId = iosApplicationId;

    payload.pg = pg;
    // payload.methods
    payload.name = "포인트 충전";
    payload.price = point.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString(); // Unique order ID

    payload.params = {
      "callbackParam1": "value12",
      "callbackParam2": "value34",
      "callbackParam3": "value56",
      "callbackParam4": "value78",
    }; // Parameters for callback

    payload.items = itemList; // Add item list

    User user = User(); // User information
    user.username = "카리나";
    user.id = "1";

    Extra extra = Extra(); // Payment options
    extra.appScheme = 'bootpayFlutterExample';

    payload.user = user;
    payload.extra = extra;
  }

  void goBootpayTest(BuildContext context) {
    Bootpay().request(
      context: context,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context);
        Navigator.pop(context);
      },
      onCloseHardware: () {
        print('------- onCloseHardware');
      },
      onConfirm: (String data) {
        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }
}

