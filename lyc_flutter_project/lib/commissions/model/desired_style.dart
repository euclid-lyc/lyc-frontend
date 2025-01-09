import 'package:freezed_annotation/freezed_annotation.dart';

part 'desired_style.freezed.dart';
part 'desired_style.g.dart';

@freezed
class DesiredStyle with _$DesiredStyle {
  factory DesiredStyle({
    required String occasion,
    required StyleList styleList,
    required FitList fitList,
    required MaterialList materialList,
    required ColorList colorList,
  }) = _DesiredStyle;

  factory DesiredStyle.fromJson(Map<String, dynamic> json) =>
      _$DesiredStyleFromJson(json);

  static DesiredStyle defaultValue() {
    return DesiredStyle(
      occasion: '',
      styleList: StyleList.defaultValue(),
      fitList: FitList.defaultValue(),
      materialList: MaterialList.defaultValue(),
      colorList: ColorList.defaultValue(),
    );
  }
}

@freezed
class StyleList with _$StyleList {
  factory StyleList({
    required List<String> styleList,
  }) = _StyleList;

  factory StyleList.fromJson(Map<String, dynamic> json) =>
      _$StyleListFromJson(json);

  static StyleList defaultValue() {
    return StyleList(styleList: []);
  }
}

@freezed
class FitList with _$FitList {
  factory FitList({
    required List<String> fitList,
  }) = _FitList;

  factory FitList.fromJson(Map<String, dynamic> json) =>
      _$FitListFromJson(json);

  static FitList defaultValue() {
    return FitList(fitList: []);
  }
}

@freezed
class MaterialList with _$MaterialList {
  factory MaterialList({
    required List<String> materialList,
  }) = _MaterialList;

  factory MaterialList.fromJson(Map<String, dynamic> json) =>
      _$MaterialListFromJson(json);

  static MaterialList defaultValue() {
    return MaterialList(materialList: []);
  }
}

@freezed
class ColorList with _$ColorList {
  factory ColorList({
    required List<String> colorList,
  }) = _ColorList;

  factory ColorList.fromJson(Map<String, dynamic> json) =>
      _$ColorListFromJson(json);

  static ColorList defaultValue() {
    return ColorList(colorList: []);
  }
}
