// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desired_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
