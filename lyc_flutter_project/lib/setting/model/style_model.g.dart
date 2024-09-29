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
      preferredMaterials: MaterialModel.fromJson(
          json['preferredMaterial'] as Map<String, dynamic>),
      nonPreferredMaterials: MaterialModel.fromJson(
          json['nonPreferredMaterial'] as Map<String, dynamic>),
      preferredFits:
          FitModel.fromJson(json['preferredFit'] as Map<String, dynamic>),
      nonPreferredFits:
          FitModel.fromJson(json['nonPreferredFit'] as Map<String, dynamic>),
      goodBodyTypes:
          BodyTypeModel.fromJson(json['goodBodyType'] as Map<String, dynamic>),
      badBodyTypes:
          BodyTypeModel.fromJson(json['badBodyType'] as Map<String, dynamic>),
      details: json['details'] as String,
    );

Map<String, dynamic> _$StyleModelToJson(StyleModel instance) =>
    <String, dynamic>{
      'spec': instance.spec,
      'preferredStyle': instance.preferredStyle,
      'nonPreferredStyle': instance.nonPreferredStyle,
      'preferredMaterial': instance.preferredMaterials,
      'nonPreferredMaterial': instance.nonPreferredMaterials,
      'preferredFit': instance.preferredFits,
      'nonPreferredFit': instance.nonPreferredFits,
      'goodBodyType': instance.goodBodyTypes,
      'badBodyType': instance.badBodyTypes,
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
      styles:
          (json['styles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StyleListModelToJson(StyleListModel instance) =>
    <String, dynamic>{
      'styles': instance.styles,
    };

MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    MaterialModel(
      materials:
          (json['materials'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MaterialModelToJson(MaterialModel instance) =>
    <String, dynamic>{
      'materials': instance.materials,
    };

FitModel _$FitModelFromJson(Map<String, dynamic> json) => FitModel(
      fits: (json['fits'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FitModelToJson(FitModel instance) => <String, dynamic>{
      'fits': instance.fits,
    };

BodyTypeModel _$BodyTypeModelFromJson(Map<String, dynamic> json) =>
    BodyTypeModel(
      bodyTypes:
          (json['bodyTypes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BodyTypeModelToJson(BodyTypeModel instance) =>
    <String, dynamic>{
      'bodyTypes': instance.bodyTypes,
    };
