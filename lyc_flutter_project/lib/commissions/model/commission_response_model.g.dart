// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionModel _$CommissionModelFromJson(Map<String, dynamic> json) =>
    CommissionModel(
      directorId: (json['directorId'] as num?)?.toInt() ?? 0,
      basicInfo: BasicInfo.fromJson(json['basicInfo'] as Map<String, dynamic>),
      desiredStyle:
          DesiredStyle.fromJson(json['desiredStyle'] as Map<String, dynamic>),
      otherMatters:
          OtherMatters.fromJson(json['otherMatters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommissionModelToJson(CommissionModel instance) =>
    <String, dynamic>{
      'directorId': instance.directorId,
      'basicInfo': instance.basicInfo,
      'desiredStyle': instance.desiredStyle,
      'otherMatters': instance.otherMatters,
    };

BasicInfo _$BasicInfoFromJson(Map<String, dynamic> json) => BasicInfo(
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      topSize: json['topSize'] as String,
      bottomSize: json['bottomSize'] as String,
      postalCode: (json['postalCode'] as num?)?.toInt() ?? 0,
      address: json['address'] as String? ?? '',
      detailAddress: json['detailAddress'] as String? ?? '',
      text: json['text'] as String,
      infoStyle: InfoStyle.fromJson(json['infoStyle'] as Map<String, dynamic>),
      infoFit: InfoFit.fromJson(json['infoFit'] as Map<String, dynamic>),
      infoMaterial:
          InfoMaterial.fromJson(json['infoMaterial'] as Map<String, dynamic>),
      infoBodyType:
          InfoBodyType.fromJson(json['infoBodyType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasicInfoToJson(BasicInfo instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'topSize': instance.topSize,
      'bottomSize': instance.bottomSize,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'detailAddress': instance.detailAddress,
      'text': instance.text,
      'infoStyle': instance.infoStyle,
      'infoFit': instance.infoFit,
      'infoMaterial': instance.infoMaterial,
      'infoBodyType': instance.infoBodyType,
    };

InfoStyle _$InfoStyleFromJson(Map<String, dynamic> json) => InfoStyle(
      preferredStyleList: (json['preferredStyleList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nonPreferredStyleList: (json['nonPreferredStyleList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InfoStyleToJson(InfoStyle instance) => <String, dynamic>{
      'preferredStyleList': instance.preferredStyleList,
      'nonPreferredStyleList': instance.nonPreferredStyleList,
    };

InfoFit _$InfoFitFromJson(Map<String, dynamic> json) => InfoFit(
      preferredFitList: (json['preferredFitList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nonPreferredFitList: (json['nonPreferredFitList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InfoFitToJson(InfoFit instance) => <String, dynamic>{
      'preferredFitList': instance.preferredFitList,
      'nonPreferredFitList': instance.nonPreferredFitList,
    };

InfoMaterial _$InfoMaterialFromJson(Map<String, dynamic> json) => InfoMaterial(
      preferredMaterialList: (json['preferredMaterialList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nonPreferredMaterialList:
          (json['nonPreferredMaterialList'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$InfoMaterialToJson(InfoMaterial instance) =>
    <String, dynamic>{
      'preferredMaterialList': instance.preferredMaterialList,
      'nonPreferredMaterialList': instance.nonPreferredMaterialList,
    };

InfoBodyType _$InfoBodyTypeFromJson(Map<String, dynamic> json) => InfoBodyType(
      goodBodyTypeList: (json['goodBodyTypeList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      badBodyTypeList: (json['badBodyTypeList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InfoBodyTypeToJson(InfoBodyType instance) =>
    <String, dynamic>{
      'goodBodyTypeList': instance.goodBodyTypeList,
      'badBodyTypeList': instance.badBodyTypeList,
    };

DesiredStyle _$DesiredStyleFromJson(Map<String, dynamic> json) => DesiredStyle(
      occasion: json['occasion'] as String,
      styleList: StyleList.fromJson(json['styleList'] as Map<String, dynamic>),
      fitList: FitList.fromJson(json['fitList'] as Map<String, dynamic>),
      materialList:
          MaterialList.fromJson(json['materialList'] as Map<String, dynamic>),
      colorList: ColorList.fromJson(json['colorList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesiredStyleToJson(DesiredStyle instance) =>
    <String, dynamic>{
      'occasion': instance.occasion,
      'styleList': instance.styleList,
      'fitList': instance.fitList,
      'materialList': instance.materialList,
      'colorList': instance.colorList,
    };

StyleList _$StyleListFromJson(Map<String, dynamic> json) => StyleList(
      styleList:
          (json['styleList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StyleListToJson(StyleList instance) => <String, dynamic>{
      'styleList': instance.styleList,
    };

FitList _$FitListFromJson(Map<String, dynamic> json) => FitList(
      fitList:
          (json['fitList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FitListToJson(FitList instance) => <String, dynamic>{
      'fitList': instance.fitList,
    };

MaterialList _$MaterialListFromJson(Map<String, dynamic> json) => MaterialList(
      materialList: (json['materialList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MaterialListToJson(MaterialList instance) =>
    <String, dynamic>{
      'materialList': instance.materialList,
    };

ColorList _$ColorListFromJson(Map<String, dynamic> json) => ColorList(
      colorList:
          (json['colorList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ColorListToJson(ColorList instance) => <String, dynamic>{
      'colorList': instance.colorList,
    };

OtherMatters _$OtherMattersFromJson(Map<String, dynamic> json) => OtherMatters(
      minPrice: (json['minPrice'] as num?)?.toInt() ?? 0,
      maxPrice: (json['maxPrice'] as num?)?.toInt() ?? 1000000,
      dateToUse: json['dateToUse'] as String? ?? '',
      desiredDate: json['desiredDate'] as String? ?? '',
      text: json['text'] as String? ?? '',
      isShared: json['isShared'] as bool? ?? false,
    );

Map<String, dynamic> _$OtherMattersToJson(OtherMatters instance) =>
    <String, dynamic>{
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'dateToUse': instance.dateToUse,
      'desiredDate': instance.desiredDate,
      'text': instance.text,
      'isShared': instance.isShared,
    };

_$CommissionResponseModelImpl _$$CommissionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionResponseModelImpl(
      commissionId: (json['commissionId'] as num).toInt(),
      createdDate: json['createdDate'] as String,
      status: json['status'] as String,
      commission:
          CommissionModel.fromJson(json['commission'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommissionResponseModelImplToJson(
        _$CommissionResponseModelImpl instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'createdDate': instance.createdDate,
      'status': instance.status,
      'commission': instance.commission,
    };
