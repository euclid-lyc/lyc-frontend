// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClothesModelImpl _$$ClothesModelImplFromJson(Map<String, dynamic> json) =>
    _$ClothesModelImpl(
      clothesId: (json['clothesId'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String,
      clothesUrl: json['clothesUrl'] as String,
    );

Map<String, dynamic> _$$ClothesModelImplToJson(_$ClothesModelImpl instance) =>
    <String, dynamic>{
      'clothesId': instance.clothesId,
      'imageUrl': instance.imageUrl,
      'clothesUrl': instance.clothesUrl,
    };
