// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommissionResponseModelImpl _$$CommissionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionResponseModelImpl(
      commissionId: (json['commissionId'] as num).toInt(),
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      commissionInfo: CommissionInfo.fromJson(
          json['commissionInfo'] as Map<String, dynamic>),
      commissionStyle: CommissionStyle.fromJson(
          json['commissionStyle'] as Map<String, dynamic>),
      commissionOther: CommissionOther.fromJson(
          json['commissionOther'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommissionResponseModelImplToJson(
        _$CommissionResponseModelImpl instance) =>
    <String, dynamic>{
      'commissionId': instance.commissionId,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'commissionInfo': instance.commissionInfo,
      'commissionStyle': instance.commissionStyle,
      'commissionOther': instance.commissionOther,
    };

_$CommissionInfoImpl _$$CommissionInfoImplFromJson(Map<String, dynamic> json) =>
    _$CommissionInfoImpl(
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      topSize: json['topSize'] as String,
      bottomSize: json['bottomSize'] as String,
      text: json['text'] as String,
      commissionInfoStyleList: (json['commissionInfoStyleList']
              as List<dynamic>)
          .map((e) => CommissionInfoStyle.fromJson(e as Map<String, dynamic>))
          .toList(),
      commissionInfoBodyTypeList: (json['commissionInfoBodyTypeList']
              as List<dynamic>)
          .map(
              (e) => CommissionInfoBodyType.fromJson(e as Map<String, dynamic>))
          .toList(),
      commissionInfoFitList: (json['commissionInfoFitList'] as List<dynamic>)
          .map((e) => CommissionInfoFit.fromJson(e as Map<String, dynamic>))
          .toList(),
      commissionInfoMaterialList: (json['commissionInfoMaterialList']
              as List<dynamic>)
          .map(
              (e) => CommissionInfoMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommissionInfoImplToJson(
        _$CommissionInfoImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'topSize': instance.topSize,
      'bottomSize': instance.bottomSize,
      'text': instance.text,
      'commissionInfoStyleList': instance.commissionInfoStyleList,
      'commissionInfoBodyTypeList': instance.commissionInfoBodyTypeList,
      'commissionInfoFitList': instance.commissionInfoFitList,
      'commissionInfoMaterialList': instance.commissionInfoMaterialList,
    };

_$CommissionInfoStyleImpl _$$CommissionInfoStyleImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionInfoStyleImpl(
      occasion: json['occasion'] as String,
      styleList: StyleList.fromJson(json['styleList'] as Map<String, dynamic>),
      fitList: FitList.fromJson(json['fitList'] as Map<String, dynamic>),
      materialList:
          MaterialList.fromJson(json['materialList'] as Map<String, dynamic>),
      colorList: ColorList.fromJson(json['colorList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommissionInfoStyleImplToJson(
        _$CommissionInfoStyleImpl instance) =>
    <String, dynamic>{
      'occasion': instance.occasion,
      'styleList': instance.styleList,
      'fitList': instance.fitList,
      'materialList': instance.materialList,
      'colorList': instance.colorList,
    };

_$CommissionInfoBodyTypeImpl _$$CommissionInfoBodyTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionInfoBodyTypeImpl(
      bodyTypes:
          (json['bodyTypes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CommissionInfoBodyTypeImplToJson(
        _$CommissionInfoBodyTypeImpl instance) =>
    <String, dynamic>{
      'bodyTypes': instance.bodyTypes,
    };

_$CommissionInfoFitImpl _$$CommissionInfoFitImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionInfoFitImpl(
      fits: (json['fits'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CommissionInfoFitImplToJson(
        _$CommissionInfoFitImpl instance) =>
    <String, dynamic>{
      'fits': instance.fits,
    };

_$CommissionInfoMaterialImpl _$$CommissionInfoMaterialImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionInfoMaterialImpl(
      materials:
          (json['materials'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CommissionInfoMaterialImplToJson(
        _$CommissionInfoMaterialImpl instance) =>
    <String, dynamic>{
      'materials': instance.materials,
    };

_$CommissionStyleImpl _$$CommissionStyleImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionStyleImpl(
      style: (json['style'] as List<dynamic>)
          .map((e) => CommissionInfoStyle.fromJson(e as Map<String, dynamic>))
          .toList(),
      material: (json['material'] as List<dynamic>)
          .map(
              (e) => CommissionInfoMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      fit: (json['fit'] as List<dynamic>)
          .map((e) => CommissionInfoFit.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: (json['color'] as List<dynamic>)
          .map((e) => CommissionInfoColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommissionStyleImplToJson(
        _$CommissionStyleImpl instance) =>
    <String, dynamic>{
      'style': instance.style,
      'material': instance.material,
      'fit': instance.fit,
      'color': instance.color,
    };

_$CommissionInfoColorImpl _$$CommissionInfoColorImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionInfoColorImpl(
      color: json['color'] as String,
      isPrefer: json['isPrefer'] as bool,
    );

Map<String, dynamic> _$$CommissionInfoColorImplToJson(
        _$CommissionInfoColorImpl instance) =>
    <String, dynamic>{
      'color': instance.color,
      'isPrefer': instance.isPrefer,
    };

_$CommissionOtherImpl _$$CommissionOtherImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionOtherImpl(
      dateToUse: json['dateToUse'] as String,
      desiredDate: json['desiredDate'] as String,
      minPrice: (json['minPrice'] as num).toInt(),
      maxPrice: (json['maxPrice'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$CommissionOtherImplToJson(
        _$CommissionOtherImpl instance) =>
    <String, dynamic>{
      'dateToUse': instance.dateToUse,
      'desiredDate': instance.desiredDate,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'text': instance.text,
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
