// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_matters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherMatters _$OtherMattersFromJson(Map<String, dynamic> json) => OtherMatters(
      minPrice: (json['minPrice'] as num).toInt(),
      maxPrice: (json['maxPrice'] as num).toInt(),
      dateToUse: json['dateToUse'] as String,
      desiredDate: json['desiredDate'] as String,
      text: json['text'] as String,
      isShareClothesList: json['isShareClothesList'] as bool,
    );

Map<String, dynamic> _$OtherMattersToJson(OtherMatters instance) =>
    <String, dynamic>{
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'dateToUse': instance.dateToUse,
      'desiredDate': instance.desiredDate,
      'text': instance.text,
      'isShareClothesList': instance.isShareClothesList,
    };
