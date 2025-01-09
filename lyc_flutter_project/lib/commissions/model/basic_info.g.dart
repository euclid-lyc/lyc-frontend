// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      preferredStyleList: (json['preferredStyleList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nonPreferredStyleList: (json['nonPreferredStyleList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$InfoStyleImplToJson(_$InfoStyleImpl instance) =>
    <String, dynamic>{
      'preferredStyleList': instance.preferredStyleList,
      'nonPreferredStyleList': instance.nonPreferredStyleList,
    };

_$InfoFitImpl _$$InfoFitImplFromJson(Map<String, dynamic> json) =>
    _$InfoFitImpl(
      preferredFitList: (json['preferredFitList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nonPreferredFitList: (json['nonPreferredFitList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$InfoFitImplToJson(_$InfoFitImpl instance) =>
    <String, dynamic>{
      'preferredFitList': instance.preferredFitList,
      'nonPreferredFitList': instance.nonPreferredFitList,
    };

_$InfoMaterialImpl _$$InfoMaterialImplFromJson(Map<String, dynamic> json) =>
    _$InfoMaterialImpl(
      preferredMaterialList: (json['preferredMaterialList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nonPreferredMaterialList:
          (json['nonPreferredMaterialList'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$InfoMaterialImplToJson(_$InfoMaterialImpl instance) =>
    <String, dynamic>{
      'preferredMaterialList': instance.preferredMaterialList,
      'nonPreferredMaterialList': instance.nonPreferredMaterialList,
    };

_$InfoBodyTypeImpl _$$InfoBodyTypeImplFromJson(Map<String, dynamic> json) =>
    _$InfoBodyTypeImpl(
      goodBodyTypeList: (json['goodBodyTypeList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      badBodyTypeList: (json['badBodyTypeList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$InfoBodyTypeImplToJson(_$InfoBodyTypeImpl instance) =>
    <String, dynamic>{
      'goodBodyTypeList': instance.goodBodyTypeList,
      'badBodyTypeList': instance.badBodyTypeList,
    };
