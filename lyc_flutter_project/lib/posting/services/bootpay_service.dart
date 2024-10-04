import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter/material.dart';

String webApplicationId = "66b0e5d186fd08d2213fbf98";
String iosApplicationId = "66b0e5d186fd08d2213fbf9a";
String androidApplicationId = "66b0e5d186fd08d2213fbf99";

class BootpayService {
  int point;
  BootpayService(this.point);

  Payload payload = Payload();

  bootpayReqeustDataInit(String pg) {
    Item item = Item();
    item.itemName = "포인트"; // 주문정보에 담길 상품명
    item.qty = 1; // 해당 상품의 주문 수량
    item.unique= "ITEM_CODE_POINT"; // 해당 상품의 고유 키
    item.price = point.toDouble(); // 상품의 가격

    List<Item> itemList = [item];

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id


    payload.pg = pg;
    // payload.method = "card";
    payload.name = "포인트";
    payload.price = point.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString(); //주문번호, 개발사에서 고유값으로 지정해야함


    payload.params = {
      "callbackParam1" : "value12",
      "callbackParam2" : "value34",
      "callbackParam3" : "value56",
      "callbackParam4" : "value78",
    }; // 전달할 파라미터, 결제 후 되돌려 주는 값
    payload.items = itemList;

    User user = User();
    user.username = "카리나";
    user.id = "1";

    Extra extra = Extra();
    extra.appScheme = 'bootpayFlutterExample';
    // extra.cardQuota = '3';
    // extra.openType = 'popup';

    // extra.carrier = "SKT,KT,LGT"; //본인인증 시 고정할 통신사명
    // extra.ageLimit = 20; // 본인인증시 제한할 최소 나이 ex) 20 -> 20살 이상만 인증이 가능

    payload.user = user;
    payload.extra = extra;
    // payload.extra?.openType = "iframe";
  }

  void goBootpayTest(BuildContext context) {
    Bootpay().request(
      context: context,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onCancel: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context);
        Navigator.pop(context);
      },
      onCloseHardware: () {
        print('------- onCloseHardware');
      },
      // onIssued: (String data) {
      //   print('------- onIssued: $data');
      // },
      onConfirm: (String data) {
        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }

  String webApplicationId = "66b0e5d186fd08d2213fbf98";
  String iosApplicationId = "66b0e5d186fd08d2213fbf9a";
  String androidApplicationId = "66b0e5d186fd08d2213fbf99";

  _bootpayReqeustDataInit(String pg) {
    Item item = Item();
    item.itemName = "포인트"; // 주문정보에 담길 상품명
    item.qty = 1; // 해당 상품의 주문 수량
    item.unique= "ITEM_CODE_POINT"; // 해당 상품의 고유 키
    item.price = point.toDouble(); // 상품의 가격

    List<Item> itemList = [item];

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id


    payload.pg = pg;
    // payload.method = "card";
    payload.name = "포인트";
    payload.price = point.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString(); //주문번호, 개발사에서 고유값으로 지정해야함


    payload.params = {
      "callbackParam1" : "value12",
      "callbackParam2" : "value34",
      "callbackParam3" : "value56",
      "callbackParam4" : "value78",
    }; // 전달할 파라미터, 결제 후 되돌려 주는 값
    payload.items = itemList;

    User user = User();
    user.username = "카리나";
    user.id = "1";

    Extra extra = Extra();
    extra.appScheme = 'bootpayFlutterExample';
    // extra.cardQuota = '3';
    // extra.openType = 'popup';

    // extra.carrier = "SKT,KT,LGT"; //본인인증 시 고정할 통신사명
    // extra.ageLimit = 20; // 본인인증시 제한할 최소 나이 ex) 20 -> 20살 이상만 인증이 가능

    payload.user = user;
    payload.extra = extra;
    // payload.extra?.openType = "iframe";
  }

  void _goBootpayTest(BuildContext context) {
    Bootpay().request(
      context: context,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onCancel: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context);
        Navigator.pop(context);
      },
      onCloseHardware: () {
        print('------- onCloseHardware');
      },
      // onIssued: (String data) {
      //   print('------- onIssued: $data');
      // },
      onConfirm: (String data) {
        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }
}
