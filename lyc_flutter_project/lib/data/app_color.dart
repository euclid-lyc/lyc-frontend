// 앱에서 사용되는 색상들입니다
// 이 파일을 imoprt하고 사용하시면 됩니다
// 예) color: AppColor.beige
// 보통 AppBar는 beige, 배경은 lightGrey, 버튼이나 강조 글자는 brown이네요

import 'dart:ui';

abstract class AppColor {
  AppColor._();

  static const beige = const Color(0xffC4BAA2);
  static const lightGrey = const Color(0xffF1F1F1);
  static const grey = const Color(0xffD9D9D9);
  static const deepGrey = const Color(0xff738998);
  static const brown = const Color(0xff8D8371);
  static const active = Color(0xff03A600);
}