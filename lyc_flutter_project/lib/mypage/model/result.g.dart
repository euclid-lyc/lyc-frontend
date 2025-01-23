// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordiResult _$CoordiResultFromJson(Map<String, dynamic> json) => CoordiResult(
      imageList: (json['imageList'] as List<dynamic>)
          .map((e) => CoordiPostingPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoordiResultToJson(CoordiResult instance) =>
    <String, dynamic>{
      'imageList': instance.imageList,
    };

ClosetResult _$ClosetResultFromJson(Map<String, dynamic> json) => ClosetResult(
      clothesList: (json['clothesList'] as List<dynamic>)
          .map((e) => ClosetPostingPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClosetResultToJson(ClosetResult instance) =>
    <String, dynamic>{
      'clothesList': instance.clothesList,
    };
