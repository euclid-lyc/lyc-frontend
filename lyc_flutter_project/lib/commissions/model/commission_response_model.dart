import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_response_model.freezed.dart';
part 'commission_response_model.g.dart';



@freezed
class CommissionResponseModel with _$CommissionResponseModel {
  factory CommissionResponseModel({
    required int commissionId,
    required String status,
    required String createdDate,
    required CommissionInfo commissionInfo,
    required CommissionStyle commissionStyle,
    required CommissionOther commissionOther,
  }) = _CommissionResponseModel;

  factory CommissionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionResponseModelFromJson(json);
}

@freezed
class CommissionInfo with _$CommissionInfo {
  factory CommissionInfo({
    required int height,
    required int weight,
    required String topSize,
    required String bottomSize,
    required String text,
    required List<CommissionInfoStyle> commissionInfoStyleList,
    required List<CommissionInfoBodyType> commissionInfoBodyTypeList,
    required List<CommissionInfoFit> commissionInfoFitList,
    required List<CommissionInfoMaterial> commissionInfoMaterialList,
  }) = _CommissionInfo;

  factory CommissionInfo.fromJson(Map<String, dynamic> json) =>
      _$CommissionInfoFromJson(json);
}

@freezed
class CommissionInfoStyle with _$CommissionInfoStyle {
  factory CommissionInfoStyle({
    required String occasion,
    required StyleList styleList,
    required FitList fitList,
    required MaterialList materialList,
    required ColorList colorList,
  }) = _CommissionInfoStyle;

  factory CommissionInfoStyle.fromJson(Map<String, dynamic> json) =>
      _$CommissionInfoStyleFromJson(json);
}

@freezed
class CommissionInfoBodyType with _$CommissionInfoBodyType {
  factory CommissionInfoBodyType({
    required List<String> bodyTypes,
  }) = _CommissionInfoBodyType;

  factory CommissionInfoBodyType.fromJson(Map<String, dynamic> json) =>
      _$CommissionInfoBodyTypeFromJson(json);
}

@freezed
class CommissionInfoFit with _$CommissionInfoFit {
  factory CommissionInfoFit({
    required List<String> fits,
  }) = _CommissionInfoFit;

  factory CommissionInfoFit.fromJson(Map<String, dynamic> json) =>
      _$CommissionInfoFitFromJson(json);
}

@freezed
class CommissionInfoMaterial with _$CommissionInfoMaterial {
  factory CommissionInfoMaterial({
    required List<String> materials,
  }) = _CommissionInfoMaterial;

  factory CommissionInfoMaterial.fromJson(Map<String, dynamic> json) =>
      _$CommissionInfoMaterialFromJson(json);
}

@freezed
class CommissionStyle with _$CommissionStyle {
  factory CommissionStyle({
    required List<CommissionInfoStyle> style,
    required List<CommissionInfoMaterial> material,
    required List<CommissionInfoFit> fit,
    required List<CommissionInfoColor> color,
  }) = _CommissionStyle;

  factory CommissionStyle.fromJson(Map<String, dynamic> json) =>
      _$CommissionStyleFromJson(json);
}

@freezed
class CommissionInfoColor with _$CommissionInfoColor {
  factory CommissionInfoColor({
    required String color,
    required bool isPrefer,
  }) = _CommissionInfoColor;

  factory CommissionInfoColor.fromJson(Map<String, dynamic> json) =>
      _$CommissionInfoColorFromJson(json);
}

@freezed
class CommissionOther with _$CommissionOther {
  factory CommissionOther({
    required String dateToUse,
    required String desiredDate,
    required int minPrice,
    required int maxPrice,
    required String text,
  }) = _CommissionOther;

  factory CommissionOther.fromJson(Map<String, dynamic> json) =>
      _$CommissionOtherFromJson(json);
}

@freezed
class StyleList with _$StyleList {
  factory StyleList({
    required List<String> styleList,
  }) = _StyleList;

  factory StyleList.fromJson(Map<String, dynamic> json) =>
      _$StyleListFromJson(json);
}

@freezed
class FitList with _$FitList {
  factory FitList({
    required List<String> fitList,
  }) = _FitList;

  factory FitList.fromJson(Map<String, dynamic> json) =>
      _$FitListFromJson(json);
}

@freezed
class MaterialList with _$MaterialList {
  factory MaterialList({
    required List<String> materialList,
  }) = _MaterialList;

  factory MaterialList.fromJson(Map<String, dynamic> json) =>
      _$MaterialListFromJson(json);
}

@freezed
class ColorList with _$ColorList {
  factory ColorList({
    required List<String> colorList,
  }) = _ColorList;

  factory ColorList.fromJson(Map<String, dynamic> json) =>
      _$ColorListFromJson(json);
}
