import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_request.freezed.dart';
part 'commission_request.g.dart';

@freezed
class CommissionRequest with _$CommissionRequest {
  factory CommissionRequest({
    @Default(0) int directorId,
    required BasicInfo basicInfo,
    required DesiredStyle desiredStyle,
    required OtherMatters otherMatters,
  }) = _CommissionRequest;

  factory CommissionRequest.fromJson(Map<String, dynamic> json) =>
      _$CommissionRequestFromJson(json);

  // Map<String, dynamic> toJson() => _$CommissionRequestToJson(this);


  static CommissionRequest defaultValue() {
    return CommissionRequest(
      directorId: 0,
      basicInfo: BasicInfo.defaultValue(),
      desiredStyle: DesiredStyle.defaultValue(),
      otherMatters: OtherMatters.defaultValue(),
    );
  }
}

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
    @Default([]) List<String> preferredStyleList,
    @Default([]) List<String> nonPreferredStyleList,
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
    @Default([]) List<String> preferredFitList,
    @Default([]) List<String> nonPreferredFitList,
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
    @Default([]) List<String> preferredMaterialList,
    @Default([]) List<String> nonPreferredMaterialList,
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
    @Default([]) List<String> goodBodyTypeList,
    @Default([]) List<String> badBodyTypeList,
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

@freezed
class OtherMatters with _$OtherMatters {
  factory OtherMatters({
    @Default(0) int minPrice,
    @Default(0) int maxPrice,
    @Default('') String dateToUse,
    @Default('') String desiredDate,
    @Default('') String text,
    @Default(false) bool isShared,
  }) = _OtherMatters;

  factory OtherMatters.fromJson(Map<String, dynamic> json) =>
      _$OtherMattersFromJson(json);

  static OtherMatters defaultValue() {
    return OtherMatters(
      minPrice: 0,
      maxPrice: 0,
      dateToUse: '',
      desiredDate: '',
      text: '',
      isShared: false,
    );
  }
}
