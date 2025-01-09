import 'package:freezed_annotation/freezed_annotation.dart';
part 'basic_info.freezed.dart';
part 'basic_info.g.dart';

@freezed
class BasicInfo with _$BasicInfo {
  factory BasicInfo({
    required int height,
    required int weight,
    required String topSize,
    required String bottomSize,
    required int postalCode,
    required String address,
    required String detailAddress,
    required String text,
    required InfoStyle infoStyle,
    required InfoFit infoFit,
    required InfoMaterial infoMaterial,
    required InfoBodyType infoBodyType,
  }) = _BasicInfo;

  factory BasicInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoFromJson(json);

  static BasicInfo defaultValue() {
    return BasicInfo(
      height: 0,
      weight: 0,
      topSize: '',
      bottomSize: '',
      postalCode: 0,
      address: '',
      detailAddress: '',
      text: '',
      infoStyle: InfoStyle.defaultValue(),
      infoFit: InfoFit.defaultValue(),
      infoMaterial: InfoMaterial.defaultValue(),
      infoBodyType: InfoBodyType.defaultValue(),
    );
  }

}

@freezed
class InfoStyle with _$InfoStyle {
  factory InfoStyle({
    required List<String> preferredStyleList,
    required List<String> nonPreferredStyleList,
  }) = _InfoStyle;

  factory InfoStyle.fromJson(Map<String, dynamic> json) =>
      _$InfoStyleFromJson(json);

  static InfoStyle defaultValue() {
    return InfoStyle(
      preferredStyleList: [],
      nonPreferredStyleList: [],
    );
  }
}

@freezed
class InfoFit with _$InfoFit {
  factory InfoFit({
    required List<String> preferredFitList,
    required List<String> nonPreferredFitList,
  }) = _InfoFit;

  factory InfoFit.fromJson(Map<String, dynamic> json) =>
      _$InfoFitFromJson(json);

  static InfoFit defaultValue() {
    return InfoFit(
      preferredFitList: [],
      nonPreferredFitList: [],
    );
  }
}

@freezed
class InfoMaterial with _$InfoMaterial {
  factory InfoMaterial({
    required List<String> preferredMaterialList,
    required List<String> nonPreferredMaterialList,
  }) = _InfoMaterial;

  factory InfoMaterial.fromJson(Map<String, dynamic> json) =>
      _$InfoMaterialFromJson(json);

  static InfoMaterial defaultValue() {
    return InfoMaterial(
      preferredMaterialList: [],
      nonPreferredMaterialList: [],
    );
  }
}

@freezed
class InfoBodyType with _$InfoBodyType {
  factory InfoBodyType({
    required List<String> goodBodyTypeList,
    required List<String> badBodyTypeList,
  }) = _InfoBodyType;

  factory InfoBodyType.fromJson(Map<String, dynamic> json) =>
      _$InfoBodyTypeFromJson(json);

  static InfoBodyType defaultValue() {
    return InfoBodyType(
      goodBodyTypeList: [],
      badBodyTypeList: [],
    );
  }
}
