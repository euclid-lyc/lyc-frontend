// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StyleModel _$StyleModelFromJson(Map<String, dynamic> json) => StyleModel(
      spec: SpecModel.fromJson(json['spec'] as Map<String, dynamic>),
      preferredStyle: StyleListModel.fromJson(
          json['preferredStyle'] as Map<String, dynamic>),
      nonPreferredStyle: StyleListModel.fromJson(
          json['nonPreferredStyle'] as Map<String, dynamic>),
      preferredMaterials: StyleModel._materialsFromJson(
          json['preferredMaterial'] as Map<String, dynamic>),
      nonPreferredMaterials: StyleModel._materialsFromJson(
          json['nonPreferredMaterial'] as Map<String, dynamic>),
      preferredFits: StyleModel._fitsFromJson(
          json['preferredFit'] as Map<String, dynamic>),
      nonPreferredFits: StyleModel._fitsFromJson(
          json['nonPreferredFit'] as Map<String, dynamic>),
      goodBodyTypes: StyleModel._bodyTypesFromJson(
          json['goodBodyType'] as Map<String, dynamic>),
      badBodyTypes: StyleModel._bodyTypesFromJson(
          json['badBodyType'] as Map<String, dynamic>),
      details: json['details'] as String,
    );

Map<String, dynamic> _$StyleModelToJson(StyleModel instance) =>
    <String, dynamic>{
      'spec': instance.spec,
      'preferredStyle': instance.preferredStyle,
      'nonPreferredStyle': instance.nonPreferredStyle,
      'preferredMaterial':
          StyleModel._materialsToJson(instance.preferredMaterials),
      'nonPreferredMaterial':
          StyleModel._materialsToJson(instance.nonPreferredMaterials),
      'preferredFit': StyleModel._fitsToJson(instance.preferredFits),
      'nonPreferredFit': StyleModel._fitsToJson(instance.nonPreferredFits),
      'goodBodyType': StyleModel._bodyTypesToJson(instance.goodBodyTypes),
      'badBodyType': StyleModel._bodyTypesToJson(instance.badBodyTypes),
      'details': instance.details,
    };

SpecModel _$SpecModelFromJson(Map<String, dynamic> json) => SpecModel(
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      topSize: json['topSize'] as String,
      bottomSize: json['bottomSize'] as String,
    );

Map<String, dynamic> _$SpecModelToJson(SpecModel instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'topSize': instance.topSize,
      'bottomSize': instance.bottomSize,
    };

StyleListModel _$StyleListModelFromJson(Map<String, dynamic> json) =>
    StyleListModel(
      occasion: json['occasion'] as String,
      styles: StyleListModel._listFromJson(
          json['styleList'] as Map<String, dynamic>),
      fits:
          StyleListModel._listFromJson(json['fitList'] as Map<String, dynamic>),
      materials: StyleListModel._listFromJson(
          json['materialList'] as Map<String, dynamic>),
      colors: StyleListModel._listFromJson(
          json['colorList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StyleListModelToJson(StyleListModel instance) =>
    <String, dynamic>{
      'occasion': instance.occasion,
      'styleList': StyleListModel._listToJson(instance.styles),
      'fitList': StyleListModel._listToJson(instance.fits),
      'materialList': StyleListModel._listToJson(instance.materials),
      'colorList': StyleListModel._listToJson(instance.colors),
    };
