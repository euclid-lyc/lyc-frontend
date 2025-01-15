// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommissionModelImpl _$$CommissionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionModelImpl(
      directorId: (json['directorId'] as num?)?.toInt() ?? 0,
      basicInfo: BasicInfo.fromJson(json['basicInfo'] as Map<String, dynamic>),
      desiredStyle:
          DesiredStyle.fromJson(json['desiredStyle'] as Map<String, dynamic>),
      otherMatters:
          OtherMatters.fromJson(json['otherMatters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommissionModelImplToJson(
        _$CommissionModelImpl instance) =>
    <String, dynamic>{
      'directorId': instance.directorId,
      'basicInfo': instance.basicInfo,
      'desiredStyle': instance.desiredStyle,
      'otherMatters': instance.otherMatters,
    };

_$BasicInfoImpl _$$BasicInfoImplFromJson(Map<String, dynamic> json) =>
    _$BasicInfoImpl(
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      topSize: json['topSize'] as String,
      bottomSize: json['bottomSize'] as String,
      postalCode: (json['postalCode'] as num).toInt(),
      address: json['address'] as String,
      detailAddress: json['detailAddress'] as String,
      text: json['text'] as String,
      infoStyle: InfoStyle.fromJson(json['infoStyle'] as Map<String, dynamic>),
      infoFit: InfoFit.fromJson(json['infoFit'] as Map<String, dynamic>),
      infoMaterial:
          InfoMaterial.fromJson(json['infoMaterial'] as Map<String, dynamic>),
      infoBodyType:
          InfoBodyType.fromJson(json['infoBodyType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BasicInfoImplToJson(_$BasicInfoImpl instance) =>
    <String, dynamic>{
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

_$InfoStyleImpl _$$InfoStyleImplFromJson(Map<String, dynamic> json) =>
    _$InfoStyleImpl(
      preferredStyleList: (json['preferredStyleList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nonPreferredStyleList: (json['nonPreferredStyleList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InfoStyleImplToJson(_$InfoStyleImpl instance) =>
    <String, dynamic>{
      'preferredStyleList': instance.preferredStyleList,
      'nonPreferredStyleList': instance.nonPreferredStyleList,
    };

_$InfoFitImpl _$$InfoFitImplFromJson(Map<String, dynamic> json) =>
    _$InfoFitImpl(
      preferredFitList: (json['preferredFitList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nonPreferredFitList: (json['nonPreferredFitList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InfoFitImplToJson(_$InfoFitImpl instance) =>
    <String, dynamic>{
      'preferredFitList': instance.preferredFitList,
      'nonPreferredFitList': instance.nonPreferredFitList,
    };

_$InfoMaterialImpl _$$InfoMaterialImplFromJson(Map<String, dynamic> json) =>
    _$InfoMaterialImpl(
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

Map<String, dynamic> _$$InfoMaterialImplToJson(_$InfoMaterialImpl instance) =>
    <String, dynamic>{
      'preferredMaterialList': instance.preferredMaterialList,
      'nonPreferredMaterialList': instance.nonPreferredMaterialList,
    };

_$InfoBodyTypeImpl _$$InfoBodyTypeImplFromJson(Map<String, dynamic> json) =>
    _$InfoBodyTypeImpl(
      goodBodyTypeList: (json['goodBodyTypeList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      badBodyTypeList: (json['badBodyTypeList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InfoBodyTypeImplToJson(_$InfoBodyTypeImpl instance) =>
    <String, dynamic>{
      'goodBodyTypeList': instance.goodBodyTypeList,
      'badBodyTypeList': instance.badBodyTypeList,
    };

_$DesiredStyleImpl _$$DesiredStyleImplFromJson(Map<String, dynamic> json) =>
    _$DesiredStyleImpl(
      occasion: json['occasion'] as String,
      styleList: StyleList.fromJson(json['styleList'] as Map<String, dynamic>),
      fitList: FitList.fromJson(json['fitList'] as Map<String, dynamic>),
      materialList:
          MaterialList.fromJson(json['materialList'] as Map<String, dynamic>),
      colorList: ColorList.fromJson(json['colorList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DesiredStyleImplToJson(_$DesiredStyleImpl instance) =>
    <String, dynamic>{
      'occasion': instance.occasion,
      'styleList': instance.styleList,
      'fitList': instance.fitList,
      'materialList': instance.materialList,
      'colorList': instance.colorList,
    };

_$StyleListImpl _$$StyleListImplFromJson(Map<String, dynamic> json) =>
    _$StyleListImpl(
      styleList:
          (json['styleList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$StyleListImplToJson(_$StyleListImpl instance) =>
    <String, dynamic>{
      'styleList': instance.styleList,
    };

_$FitListImpl _$$FitListImplFromJson(Map<String, dynamic> json) =>
    _$FitListImpl(
      fitList:
          (json['fitList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$FitListImplToJson(_$FitListImpl instance) =>
    <String, dynamic>{
      'fitList': instance.fitList,
    };

_$MaterialListImpl _$$MaterialListImplFromJson(Map<String, dynamic> json) =>
    _$MaterialListImpl(
      materialList: (json['materialList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$MaterialListImplToJson(_$MaterialListImpl instance) =>
    <String, dynamic>{
      'materialList': instance.materialList,
    };

_$ColorListImpl _$$ColorListImplFromJson(Map<String, dynamic> json) =>
    _$ColorListImpl(
      colorList:
          (json['colorList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ColorListImplToJson(_$ColorListImpl instance) =>
    <String, dynamic>{
      'colorList': instance.colorList,
    };

_$OtherMattersImpl _$$OtherMattersImplFromJson(Map<String, dynamic> json) =>
    _$OtherMattersImpl(
      minPrice: (json['minPrice'] as num?)?.toInt() ?? 0,
      maxPrice: (json['maxPrice'] as num?)?.toInt() ?? 0,
      dateToUse: json['dateToUse'] as String? ?? '',
      desiredDate: json['desiredDate'] as String? ?? '',
      text: json['text'] as String? ?? '',
      isShared: json['isShared'] as bool? ?? false,
    );

Map<String, dynamic> _$$OtherMattersImplToJson(_$OtherMattersImpl instance) =>
    <String, dynamic>{
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'dateToUse': instance.dateToUse,
      'desiredDate': instance.desiredDate,
      'text': instance.text,
      'isShared': instance.isShared,
    };
