// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_matters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherMattersImpl _$$OtherMattersImplFromJson(Map<String, dynamic> json) =>
    _$OtherMattersImpl(
      minPrice: (json['minPrice'] as num).toInt(),
      maxPrice: (json['maxPrice'] as num).toInt(),
      dateToUse: json['dateToUse'] as String,
      desiredDate: json['desiredDate'] as String,
      text: json['text'] as String,
      isShareClothesList: json['isShareClothesList'] as bool,
    );

Map<String, dynamic> _$$OtherMattersImplToJson(_$OtherMattersImpl instance) =>
    <String, dynamic>{
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'dateToUse': instance.dateToUse,
      'desiredDate': instance.desiredDate,
      'text': instance.text,
      'isShareClothesList': instance.isShareClothesList,
    };
